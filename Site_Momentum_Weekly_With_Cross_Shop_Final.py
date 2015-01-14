
# coding: utf-8

# In[1]:

from pylab import *
from pandas import *



# this is used for RSI calc
import numpy as np
import pandas as pd


import pyodbc
import time
from datetime import date, timedelta as td
import csv
from random import sample

conn = pyodbc.connect('DSN=vertica_production')
cursor1 = conn.cursor()
cursor2 = conn.cursor()



def rsiFunc(prices, n=14):
    deltas = np.diff(prices)
    seed = deltas[:n+1]
    up = seed[seed>=0].sum()/n
    down = -seed[seed<0].sum()/n
    rs = up/down
    rsi = np.zeros_like(prices)
    rsi[:n] = 100. - 100./(1.+rs)

    for i in range(n, len(prices)):
        delta = deltas[i-1] # cause the diff is 1 shorter

        if delta>0:
            upval = delta
            downval = 0.
        else:
            upval = 0.
            downval = -delta

        up = (up*(n-1) + upval)/n
        down = (down*(n-1) + downval)/n

        rs = up/down
        rsi[i] = 100. - 100./(1.+rs)

    return rsi


# In[2]:

## create time dimension table
cursor1.execute("drop table if exists tmp_dim_time")
cursor1.execute("create local temporary table tmp_dim_time (cal_date DATE, cal_year int, cal_month int, cal_month_day int, day_of_week int, day_of_week_name varchar(10), day_of_year int, week_of_year int) ON COMMIT PRESERVE ROWS")

# change the date range for appropriate numbers
d1 = date(2013,6,1)
d2 = date(2014,4,30)
delta = d2 - d1
for i in range(delta.days + 1):
    newday = d1 + td(days=i)
    # print newday
    cursor1.execute("insert into tmp_dim_time (cal_date, cal_year, cal_month,cal_month_day,day_of_week, day_of_week_name, day_of_year, week_of_year) values (?,?,?,?,?,?,?,?)",newday.strftime('%Y-%m-%d'),newday.strftime('%Y'),newday.strftime('%m'),
                    newday.strftime('%d'),newday.strftime('%w'),newday.strftime('%A'),newday.strftime('%j'),newday.strftime('%W'))

print "done with time table"


# In[3]:

## jpb, REWRITE TO USE WEEK OF YEAR ONLY RATHER THAN CAL_YEAR, CAL_MONTH, WEEK OF YEAR
##  Now create the day counts for each month - A dimension of total counts by month
cursor1.execute("drop table if exists tmp_dim_time_day_counts")
cursor1.execute("create local temporary table tmp_dim_time_day_counts (cal_year int, week_of_year int , count_of_days int) ON COMMIT PRESERVE ROWS")
cursor1.execute("INSERT INTO tmp_dim_time_day_counts (cal_year, week_of_year, count_of_days) select cal_year, week_of_year, count(cal_date) from tmp_dim_time group by cal_year, week_of_year order by cal_year desc, week_of_year desc")


# In[4]:

## jpb, REWRITE TO USE YEAR ONLY
## CREATE THE full_month sites table based on sites reporting a full month of traffic.  Walk down the time _day_count to build
cursor1.execute("DROP TABLE IF EXISTS tmp_full_month_sites");
cursor1.execute("CREATE local temporary table tmp_full_month_sites (cal_year int, week_of_year int, site_id int, day_count int) ON COMMIT PRESERVE ROWS")
cursor2.execute("SELECT cal_year, week_of_year, count_of_days FROM tmp_dim_time_day_counts order by cal_year desc, week_of_year desc")
rows = cursor2.fetchall()
for row in rows:
     cursor1.execute("INSERT INTO tmp_full_month_sites (cal_year, week_of_year, site_id, day_count) SELECT YEAR(pv.datestamp) as cal_year, WEEK_ISO(pv.datestamp) as week_of_year, pv.site_id, count(distinct pv.pageview_day_id) day_count FROM BI_DAT_Production.PageView pv JOIN BI_DAT_Production.Site s on s.Site_ID = pv.Site_ID WHERE WEEK_ISO(pv.DateStamp) = ? AND YEAR(pv.DateStamp) = ? AND s.site_Type_ID = 1 group by cal_year, week_of_year, pv.site_id having count(distinct pv.pageview_day_id) = ?",row.week_of_year, row.cal_year, row.count_of_days)
print "tmp_full_month sites has been built"


# In[5]:

# jpb, rewrite for week of year 
## Create and populate the tmp_full_month_traffic table
cursor1.execute("DROP TABLE IF EXISTS tmp_full_month_traffic")
cursor1.execute("CREATE local temporary table tmp_full_month_traffic (cal_Year int, cal_Month int, week_of_year int, site varchar(100), site_id int, VehicleMake varchar(50), VehicleModel varchar(50), UniqueUsers int, UniqueSites int, UniqueURL int, AvgVisitsPerSite numeric) ON COMMIT PRESERVE ROWS")
cursor1.execute("INSERT INTO tmp_full_month_traffic(cal_year, cal_month, week_of_year, site, site_id, VehicleMake, VehicleModel, UniqueUsers, UniqueSites, UniqueURL, AvgVisitsPerSite) select YEAR(date_desc2), MONTH(date_desc2), WEEK_ISO(date_desc2), s.site_name, s.site_ID, mm.mm_make_name VehicleMake, mm.mm_model_name VehicleModel, count(distinct user_id) Unique_Users, count(distinct su.site_id) Unique_Sites, count(distinct su.siteurl_id) Unique_URL, count(distinct user_id)/count(distinct su.site_id) as AvgVisitsPerSite from BI_DAT_Production.VehicleDetail vd join BI_DAT_Production.Day_Lookup dl on vd.pageview_day_id = dl.date_id join BI_DAT_Production.Make_Model mm on vd.makemodel_id = mm.makemodel_id join BI_DAT_Production.SiteURL su on vd.siteurl_id = su.siteurl_id join BI_DAT_Production.Site s on s.Site_ID = su.site_ID join tmp_full_month_sites tfs on s.Site_ID = tfs.site_id where YEAR(date_desc2) || WEEK_ISO(date_desc2) IN (SELECT DISTINCT cal_year || week_of_year from tmp_full_month_sites) and Site_Type_ID = 1 group by year(date_desc2), MONTH(date_desc2), WEEK_ISO(date_desc2), s.site_name, s.site_id, mm.mm_make_name,mm.mm_model_name order by 1,2,3,4,5")
print "tmp_full_month_traffic table has been populated"


# In[6]:

## NOW FIND THE TOP ACTIVE MODELS FOR CURRENT MONTH
cursor1.execute("drop table if exists tmp_current_top_ranked_vehicles")
cursor1.execute("CREATE local temporary table tmp_current_top_ranked_vehicles (cal_year int, cal_month int, week_of_year int, site varchar(100), site_id int, VehicleMake varchar(50), VehicleModel varchar(50), Vehicle varchar(100), UniqueUsers int, UniqueSites int, AvgVisitsPerSite numeric, rank int) ON COMMIT PRESERVE ROWS")
cursor1.execute("INSERT INTO tmp_current_top_ranked_vehicles (cal_year, cal_month, week_of_year, site, site_id, VehicleMake, VehicleModel, Vehicle, UniqueUsers, UniqueSites, AvgVisitsPerSite, rank) SELECT * FROM (SELECT cal_year, cal_month, week_of_year, site, site_id, VehicleMake, VehicleModel, VehicleMake || ' ' || VehicleModel as Vehicle, UniqueUsers, UniqueSites, AvgVisitsPerSite, RANK() OVER (PARTITION BY site_id ORDER BY AvgVisitsPerSite DESC) As rank FROM tmp_full_month_traffic where cal_year = YEAR(current_date + INTERVAL '-2 DAY') AND cal_month = MONTH(current_date + INTERVAL '-2 DAY')) as t2 where t2.rank = 1 order by site_id desc;")

cursor1.execute("SELECT count(*) from tmp_current_top_ranked_vehicles limit 10")
rows = cursor1.fetchall()
for row in rows:
    print row


# In[7]:

## WE NEED TO ELIMINATE SITES THAT HAVEN'T RECENTLY REPORTED, EVEN IF THEY TRANSMITTED THE FULL MONTH.
## SO FIND CURRENT MONTH AND BACK UP 14 PERIODS FROM THAT.  (OR POSSIBLY 6)
## AND WE NEED TO ELIMINATE VEHICLES THAT DON'T HAVE CONSECUTIVE PERIODS

## BUT THIS MIGHT WORK FOR NOW...

cursor1.execute("DROP TABLE IF EXISTS tmp_top_ranked_vehicle_traffic")
cursor1.execute("CREATE local temporary table tmp_top_ranked_vehicle_traffic (cal_Year int, cal_Month int, week_of_year int, site varchar(100), site_id int, VehicleMake varchar(50), VehicleModel varchar(50), UniqueUsers int, UniqueSites int, UniqueURL int, AvgVisitsPerSite numeric) ON COMMIT PRESERVE ROWS")


cursor1.execute("INSERT INTO tmp_top_ranked_vehicle_traffic (cal_Year, cal_Month, week_of_year, site, site_id, VehicleMake, VehicleModel, UniqueUsers, UniqueSites, UniqueURL, AvgVisitsPerSite) SELECT tfm.cal_Year, tfm.cal_Month, tfm.week_of_year, tfm.site, tfm.site_id, tfm.VehicleMake, tfm.VehicleModel, tfm.UniqueUsers, tfm.UniqueSites, tfm.UniqueURL, tfm.AvgVisitsPerSite from tmp_full_Month_Traffic tfm JOIN tmp_current_top_ranked_vehicles tv On tfm.site_id = tv.site_id AND (tfm.VehicleMake || ' ' || tfm.VehicleModel) = tv.vehicle")

cursor1.execute("SELECT count(*) from tmp_top_ranked_vehicle_traffic")
rows = cursor1.fetchall()
for row in rows:
    print row

  
# cursor1.execute("SELECT * from tmp_top_ranked_vehicle_traffic where site_id = 45760242 order by site_id, cal_Year desc, week_of_year desc limit 20");
# rows = cursor1.fetchall()
# for row in rows:
#    print row


## More debug





# In[12]:

from pandas.io import sql

# JPB, 2014-03-11, ADDED CONDITION FOR SELECTED MARKET REPORT SITES TO PARE DOWN DATA SET
# EDIT ACCORDINGLY

#  note:  we could change this to not have to manually include sites
# site_dim = sql.read_frame("SELECT distinct site, site_id from tmp_top_ranked_vehicle_traffic WHERE SITE_ID IN (708,5363,38010249,2260250,3908,7510240,45760242,45760241,1060,8759,40260249,307,18,46510240,1762,7655,2010289,334) order by site asc",conn)
site_dim = sql.read_frame("SELECT distinct site, site_id from tmp_top_ranked_vehicle_traffic WHERE SITE_ID IN (334,39010241,1060,18,8732,3908,46760240,7655,8759,2010289,2260250,46510240,4598,1173,50010240,53010273,1762,48510243,307) order by site asc",conn)
print "completed site dimension"

# debug check count of dma_dim - 214 records
# print len(dma_dim.index)
# end of debug

# now make a vehicle dimension table
vehicle_dim = sql.read_frame("SELECT distinct VehicleMake || ' ' || VehicleModel as Vehicle from tmp_top_ranked_vehicle_traffic order by VehicleMake || ' ' || VehicleModel",conn)
print "completed vehicle dimension"


# debug check count of vehicle dimension
# len(vehicle_dim.index)
  

# now get the full data set as a data frame
sitedata = sql.read_frame("SELECT site, site_id, VehicleMake || ' ' || VehicleModel as Vehicle, cal_Year, cal_Month, week_of_year, UniqueUsers, UniqueSites, avgvisitspersite from tmp_top_ranked_vehicle_traffic ORDER BY site_id desc,  VehicleMake || ' ' || VehicleModel desc, Cal_Year, week_of_year",conn)
# jpb, can't do this here  because it limits the number of periods
# sitedata = sql.read_frame("SELECT * FROM (SELECT site, site_id, VehicleMake || ' ' || VehicleModel as Vehicle, week_of_Year, AVG(avgvisitspersite) as avgvisitspersite, ROW_NUMBER() OVER (PARTITION BY site_id ORDER BY week_of_year) as Rank FROM tmp_top_ranked_vehicle_traffic WHERE site_id in (708,5363,38010249,2260250,3908,7510240,45760242,45760241,1060,8759,40260249,307,18,46510240,1762,7655,2010289,334) GROUP BY site, site_id, Vehicle, week_of_year ) AS subquery WHERE subquery.rank <= 6 order by site_id desc, week_of_year", conn)
print "completed full site data load"
    


# In[16]:

len(sitedata.index)


# In[17]:

rsioutput = pd.DataFrame()
for i, row in enumerate(site_dim.values):
    includeSite = site_dim['site'].iloc[i]
    # print includeSite

    # get the records for the specifid DMA
    sitesub = sitedata.ix[sitedata['site']==includeSite]
    # reset the index in order to match RSI results
    sitesub = sitesub.reset_index()
    
    # send data to the RSI function and calculate
    vehiclersi = rsiFunc(sitesub.avgvisitspersite.values)
    
    # convert RSI results to a data frame and rename column to rsi
    rsidf = pd.DataFrame(vehiclersi)
    rsidf = rsidf.rename(columns={0: 'rsi'})
    
    # add the rsi info back to the dataframe
    siteout = pd.concat([sitesub, rsidf],axis=1)

    # rsioutput is the final merged output
    # concatenate everything to one big DF
    rsioutput = pd.concat([rsioutput, siteout],axis=0)

# jpb, 3/12/2014, added grouping to select top N from the final set.  Note head() is 5 by default    
finalrsi = rsioutput.groupby('site_id').tail().reset_index(drop=True)
#  end of everything, write as CSV file
finalrsi.to_csv('C:/Users/jburns/Documents/marketreport/sitersioutput.csv',index_label=False,index=False,header=False,cols=['index','site_id','site','week_of_year','cal_Year','cal_Month','Vehicle','avgvisitspersite','rsi'],sep=',',quoting=csv.QUOTE_MINIMAL)
print 'Output done'

print 'Output file available.  Check for sitersioutput.csv'



# In[18]:

## Big query for the cross-shop stuff

## Create and populate the tmp_top_site_vehicle_dim
cursor1.execute("DROP TABLE IF EXISTS tmp_top_site_vehicle_dim")
cursor1.execute("CREATE local temporary table tmp_top_site_vehicle_dim (site_id int, Vehicle varchar(100)) ON COMMIT PRESERVE ROWS")
# jpb, 2014-03-11, MODIFIED TO INCLUDE MARKET REPORT SITE IDS to pare down data set
# cursor1.execute("INSERT INTO tmp_top_site_vehicle_dim(site_id, Vehicle) SELECT distinct site_id, VehicleMake || ' ' || VehicleModel as Vehicle from tmp_top_ranked_vehicle_traffic WHERE site_id in (708,5363,38010249,2260250,3908,7510240,45760242,45760241,1060,8759,40260249,307,18,46510240,1762,7655,2010289,334) order by site_id, Vehicle")
cursor1.execute("INSERT INTO tmp_top_site_vehicle_dim(site_id, Vehicle) SELECT distinct site_id, VehicleMake || ' ' || VehicleModel as Vehicle from tmp_top_ranked_vehicle_traffic WHERE site_id in (334,39010241,1060,18,8732,3908,46760240,7655,8759,2010289,2260250,46510240,4598,1173,50010240,53010273,1762,48510243,307) order by site_id, Vehicle")

cursor1.execute("SELECT count(*) from tmp_top_site_vehicle_dim")
rows = cursor1.fetchall()
for row in rows:
    print row       
        
print "Top Site Vehicle Dim table created"



# In[19]:

# jpb, This builds the cross shop table by taking the top vehicles for each site and joining to the orignal cross shop
# query out of MSTR.
# WARNING:  really long query below

cursor1.execute("DROP TABLE IF EXISTS tmp_cross_shop_top_vehicle")
cursor1.execute("CREATE local temporary table tmp_cross_shop_top_vehicle (site_id int, area_id int, MakeModelID int, SiteVehicle varchar(100), DMA_CS_VehicleYear varchar(20), DMA_CS_VehicleMake varchar(50), DMA_CS_VehicleModel varchar(50), DMA_CS_UserCount int) ON COMMIT PRESERVE ROWS")
cursor1.execute("INSERT INTO tmp_cross_shop_top_vehicle (site_id, area_id, MakeModelID, SiteVehicle, DMA_CS_VehicleYear, DMA_CS_VehicleMake, DMA_CS_VehicleModel, DMA_CS_UserCount) Select B.Site_ID, B.Area_ID, B.MakeModel_ID, B.Target_Make || ' ' || B.Target_Model as Vehicle,B.DMA_CrossShop_VehicleYear, B.DMA_CrossShop_Make,B.DMA_CrossShop_Model,B.DMA_CrossShop_User_Count From (SELECT crossshop.Site_ID, crossshop.DMA_ID as Area_ID, crossshop.Target_MakeModel as MakeModel_ID,crossshop.Target_Make,crossshop.Target_Model,crossshop.VehicleYear as DMA_CrossShop_VehicleYear, crossshop.Make as DMA_CrossShop_Make, crossshop.Model as DMA_CrossShop_Model, crossshop.CountOfUsers as DMA_CrossShop_User_Count, RANK() OVER (PARTITION BY crossshop.DMA_id, crossshop.Target_MakeModel ORDER BY crossshop.CountOfUsers DESC) AS Rnk FROM (SELECT A.Site_ID, dma.DMA_ID, dma.DMA, A.MakeModel_ID as Target_MakeModel, A.MM_Make_Name AS Target_Make, A.MM_Model_Name AS Target_Model, CASE WHEN vd.InventoryType_ID = 1 THEN CAST('New' AS VARCHAR(45)) WHEN vd.InventoryType_ID <>1 THEN CAST(REGEXP_SUBSTR(vd.year,'(?:19|20)\d{2}') AS VARCHAR(45)) END AS VehicleYear,mm.MakeModel_ID,mm.MM_Make_Name AS Make,mm.MM_Model_Name AS Model,COUNT(DISTINCT vd.USer_ID) AS CountOfUsers FROM BI_DAT_Production.VehicleDetail vd JOIN BI_DAT_Production.SiteURL url on vd.SiteURL_ID = url.SiteURL_ID JOIN BI_DAT_Production.Site s on url.Site_ID = s.Site_ID JOIN BI_DAT_PRODUCTION.VW_DMA dma on s.Site_ID = dma.Site_ID JOIN (SELECT DISTINCT s.site_id, dma.DMA_ID, mm.MakeModel_ID, mm.MM_Make_Name, mm.MM_Model_Name, vd.USer_ID FROM BI_DAT_Production.VehicleDetail vd JOIN BI_DAT_Production.siteurl url on vd.SiteURL_ID = url.SiteURL_ID JOIN BI_DAT_Production.Site s on url.Site_ID = s.Site_ID JOIN BI_DAT_Production.VW_DMA dma on s.Site_ID = dma.Site_ID JOIN BI_DAT_Production.Make_Model mm on vd.MakeModel_ID = mm.MakeModel_ID JOIN tmp_top_site_vehicle_dim tvd ON s.site_id =tvd.site_id AND mm.MM_Make_Name || ' ' || mm.MM_Model_Name = tvd.Vehicle WHERE vd.Pageview_Day_ID >= cast(replace(left(cast(getdate()-30 as varchar(40)),10),'-','') as int) ORDER BY 1,3) A ON vd.User_ID = A.User_ID AND dma.DMA_ID = A.DMA_ID JOIN BI_DAT_Production.Make_Model mm on vd.MakeModel_ID = mm.MakeModel_ID WHERE vd.Pageview_Day_ID >= cast(replace(left(cast(getdate()-30 as varchar(40)),10),'-','') as int) GROUP BY a.site_id, dma.DMA_ID, dma.DMA, A.MakeModel_ID, A.MM_Make_Name, A.MM_Model_Name, CASE WHEN vd.InventoryType_ID = 1 THEN CAST('New' AS VARCHAR(45)) WHEN vd.InventoryType_ID <>1 THEN CAST(REGEXP_SUBSTR(vd.year,'(?:19|20)\d{2}') AS VARCHAR(45)) END, mm.MakeModel_ID, mm.MM_Make_Name, mm.MM_Model_Name ORDER BY A.MM_Model_Name ASC,COUNT(DISTINCT vd.USer_ID) DESC) crossshop WHERE crossshop.Target_Make <> crossshop.Make AND case when crossshop.VehicleYear = 'New' THEN CAST(YEAR(GETDATE()) AS INT) ELSE CAST(crossshop.VehicleYear AS INT) END BETWEEN CAST(YEAR(GETDATE()) AS INT)-5 AND CAST(YEAR(GETDATE()) AS INT)+2 ORDER by 1,2,6 desc) B WHERE rnk <= 5 order by DMA_CrossShop_User_Count desc")

cursor1.execute("SELECT count(*) as recordcount from tmp_cross_shop_top_vehicle")
rows = cursor1.fetchall()
for row in rows:
    print row.recordcount

print "Cross Shop Table Complete"
    


# In[24]:

# build a data frame and export out to CSV
cross_shop_data = sql.read_frame("SELECT * from tmp_cross_shop_top_vehicle order by site_id, DMA_CS_UserCount desc",conn)
#  end of everything, write as CSV file
# cross_shop_data.to_csv('C:/Users/jburns/Documents/cross_shop_output.csv',sep=',')
cross_shop_data.to_csv('C:/Users/jburns/Documents/marketreport/dataload/cross_shop_output.csv',index_label=False,index=False,header=False,cols=['site_id','area_id','MakeModelID','SiteVehicle','DMA_CS_VehicleYear','DMA_CS_VehicleMake','DMA_CS_VehicleModel','DMA_CS_UserCount'],sep=',',quoting=csv.QUOTE_MINIMAL)
print 'Cross Shop Output file available.  Check for cross_shop_output.csv'


# In[ ]:

# DEBUG
# cursor1.execute("SELECT * from tmp_cross_shop_Top_vehicle where site_id = 7655 order by DMA_CS_UserCount desc limit 10")
# rows = cursor1.fetchall()
# for row in rows:
#    print row


# In[25]:

## jpb, 3/11/2014, added search keyword data
## Create and populate the tmp_top_site_vehicle_dim
cursor1.execute("DROP TABLE IF EXISTS tmp_top_site_searchKeywords")
cursor1.execute("CREATE local temporary table tmp_top_site_searchKeywords (site_id int, SearchKeyword varchar(1000), month_id int, KeywordPageViews int) ON COMMIT PRESERVE ROWS")
# jpb, 2014-03-11, MODIFIED TO INCLUDE MARKET REPORT SITE IDS to pare down data set
# cursor1.execute("INSERT INTO tmp_top_site_searchKeywords (site_id, SearchKeyword, month_id, KeywordPageViews) SELECT site_id,RollupSearchWord, month_id, RU_I_SKM_Pageviews FROM BI_DAT_Production.RU_Insite_SearchKeywords WHERE site_id in (708,5363,38010249,2260250,3908,7510240,45760242,45760241,1060,8759,40260249,307,18,46510240,1762,7655,2010289,334) and month_id = TO_CHAR((current_date + INTERVAL '-1 MONTH'),'YYYY') || TO_CHAR((current_date + INTERVAL '-1 MONTH'),'MM') and RollupSearchWord NOT IN ('No Keyword Used') order by site_id, month_id, RU_I_SKM_Pageviews desc ")
# cursor1.execute("INSERT INTO tmp_top_site_searchKeywords (site_id, SearchKeyword, month_id, KeywordPageViews) SELECT site_id,RollupSearchWord, month_id, RU_I_SKM_Pageviews FROM BI_DAT_Production.RU_Insite_SearchKeywords WHERE site_id in (50010240,7655,330,2010289,4598,46510240,3908,334,46760240,8759,8732,2260250) and month_id = TO_CHAR((current_date + INTERVAL '-1 MONTH'),'YYYY') || TO_CHAR((current_date + INTERVAL '-1 MONTH'),'MM') and RollupSearchWord NOT IN ('No Keyword Used') order by site_id, month_id, RU_I_SKM_Pageviews desc ")

cursor1.execute("insert into tmp_top_site_searchkeywords (site_id, SearchKeyword, KeywordPageViews) select site_id, RollupSearchWord, RU_I_SKM_Pageviews from (SELECT site_id, RollupSearchWord, RU_I_SKM_Pageviews, ROW_NUMBER() OVER (PARTITION BY site_id ORDER BY RU_I_SKM_Pageviews DESC) As row_number FROM BI_DAT_Production.RU_Insite_SearchKeywords WHERE SITE_ID IN (334,39010241,1060,18,8732,3908,46760240,7655,8759,2010289,2260250,46510240,4598,1173,50010240,53010273,1762,48510243,307) and month_id = TO_CHAR((current_date + INTERVAL '-1 MONTH'),'YYYY') || TO_CHAR((current_date + INTERVAL '-1 MONTH'),'MM') and RollupSearchWord NOT IN ('No Keyword Used')) as t2 where t2.row_number <= 5 order by site_id, RU_I_SKM_Pageviews desc")

cursor1.execute("SELECT count(*) from tmp_top_site_searchKeywords")
rows = cursor1.fetchall()
for row in rows:
    print row       
        
print "Top Site Search Keywords table created"



# In[30]:

# jpb, 3/11/2014, added search keyword data output
from pandas.io import sql
search_keyword_data = sql.read_frame("SELECT site_id, SearchKeyword,KeywordPageViews from tmp_top_site_searchKeywords order by site_id desc, KeywordPageViews desc",conn)

# search_keyword_data.to_csv('C:/Users/jburns/Documents/search_keyword_output.csv',sep=',')
search_keyword_data.to_csv('C:/Users/jburns/Documents/marketreport/dataload/search_keyword_output.csv',index_label=False,index=False,header=False,cols=['site_id','SearchKeyword','KeywordPageViews'],sep=',',quoting=csv.QUOTE_MINIMAL)
print 'Search Keyword file available.  Check for search_keyword_output.csv'


# In[33]:

#  jpb, 3/11/2014 added new and used split

# newused_data = sql.read_frame("SELECT Site_ID, NewVDP/(CAST(NewVDP+UsedVDP AS FLOAT)) AS NewVDP, UsedVDP/(CAST(NewVDP+UsedVDP AS FLOAT)) AS UsedVDP FROM (SELECT a.Site_ID, SUM(CASE WHEN a.InventoryType_Name = 'new' THEN VDP ELSE NULL END) AS NewVDP,SUM(CASE WHEN a.InventoryType_Name = 'used' THEN VDP ELSE NULL END) AS UsedVDP FROM (SELECT su.Site_ID, it.InventoryType_Name,COUNT(DISTINCT vd.VehicleDetail_ID) AS VDP FROM BI_DAT_Production.VehicleDetail vd JOIN BI_DAT_Production.Pageview_Day_Lookup pdl on vd.PAgeview_Day_Id = pdl.PAgeview_Day_ID JOIN BI_DAT_Production.SiteURL su ON vd.SiteURL_ID = su.SiteUrl_ID JOIN BI_DAT_Production.InventoryType it on vd.InventoryType_ID = it.InventoryType_ID WHERE pdl.PAgeview_Month_ID = TO_CHAR((current_date + INTERVAL '-1 MONTH'),'YYYY') || TO_CHAR((current_date + INTERVAL '-1 MONTH'),'MM') AND vd.InventoryType_ID IN(1,2) AND su.Site_ID IN  (708,5363,38010249,2260250,3908,7510240,45760242,45760241,1060,8759,40260249,307,18,46510240,1762,7655,2010289,334) GROUP BY su.Site_ID, it.InventoryType_Name) A GROUP BY a.Site_ID) B",conn)
newused_data = sql.read_frame("SELECT Site_ID, NewVDP/(CAST(NewVDP+UsedVDP AS FLOAT)) AS NewVDP, UsedVDP/(CAST(NewVDP+UsedVDP AS FLOAT)) AS UsedVDP FROM (SELECT a.Site_ID, SUM(CASE WHEN a.InventoryType_Name = 'new' THEN VDP ELSE NULL END) AS NewVDP,SUM(CASE WHEN a.InventoryType_Name = 'used' THEN VDP ELSE NULL END) AS UsedVDP FROM (SELECT su.Site_ID, it.InventoryType_Name,COUNT(DISTINCT vd.VehicleDetail_ID) AS VDP FROM BI_DAT_Production.VehicleDetail vd JOIN BI_DAT_Production.Pageview_Day_Lookup pdl on vd.PAgeview_Day_Id = pdl.PAgeview_Day_ID JOIN BI_DAT_Production.SiteURL su ON vd.SiteURL_ID = su.SiteUrl_ID JOIN BI_DAT_Production.InventoryType it on vd.InventoryType_ID = it.InventoryType_ID WHERE pdl.PAgeview_Month_ID = TO_CHAR((current_date + INTERVAL '-1 MONTH'),'YYYY') || TO_CHAR((current_date + INTERVAL '-1 MONTH'),'MM') AND vd.InventoryType_ID IN(1,2) AND su.Site_ID IN  (50010240,7655,330,2010289,4598,46510240,3908,334,4670240,8759,8732,2260250) GROUP BY su.Site_ID, it.InventoryType_Name) A GROUP BY a.Site_ID) B",conn)
# newused_data.to_csv('C:/Users/jburns/Documents/newused_output.csv',sep=',')

newused_data.to_csv('C:/Users/jburns/Documents/marketreport/dataload/newused_output.csv',index_label=False,index=False,header=False,cols=['Site_ID','NewVDP','UsedVDP'],sep=',',quoting=csv.QUOTE_MINIMAL)

print 'New Used Output Available.  Check for newused_output.csv'



# In[ ]:




# In[ ]:

cursor1.close()
cursor2.close()


# In[ ]:

conn.close()


# In[ ]:




from django.conf.urls import patterns, url

# jpb, imported for report
from report import *

# jpb, 4/4/2014, import for User Profile
# from report.views import UserProfileDetailView


urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'report_ninja.views.home', name='home'),
    # url(r'^report_ninja/', include('report_ninja.foo.urls')),

    # jpb, added for report app home page - don't remove
    # url(r'^report/',report.views.index, name = 'index'),
    # url(r'^$',report.views.index,name='index'),
    url(r'^$','report.views.index'),

    
## jpb, these two views are working, don't remove.  They are used for creating the report.    
    url(r'^client_name/get/(?P<client_id>\d+)/$','report.views.client_name'),
    url(r'^client_sample/get/(?P<client_id>\d+)/$','report.views.client_sample'),


## jpb, this view gnerate the cross shop chart for static use. Don't remove it.

    url(r'^client_crossshops/get/(?P<client_id>\d+)/$','report.views.client_crossshops'),

## jpb, this view generates the dmm charts for static use.  Don't remove it.   
   url(r'^client_dmm/get/(?P<client_id>\d+)/$','report.views.client_dmm'),
   
## jpb, 2014-03-18, this view generates the tag cloud for static use.  Don't remove it.
   url(r'^client_search/get/(?P<client_id>\d+)/$','report.views.client_search'),
   
   ## jpb, this view generates the hitlist table for static use.  Don't remove it.   
   url(r'^client_hitlist/get/(?P<client_id>\d+)/$','report.views.client_hitlist'),
 
## jpb, this view generates the circletest.  TESTING ONLY
   url(r'^client_circletest/get/(?P<client_id>\d+)/$','report.views.client_circletest'),

## jpb, this view generates sunburst test.  TESTING ONLY as of 5/21/2014
   url(r'^dma_sunburst/get/(?P<dma_id>\d+)/$','report.views.dma_sunburst'),
  
## jpb, these URLs are for the user portal login and logout
    # url(r'^login/$','django.contrib.auth.views.login'),
    # url(r'^logout/$','report.views.logout_page'),
    # url(r'^portal/','report.views.portal_page'),
    # url(r'^auth_password_reset/$','django.contrib.auth.views.password_change'),
    # url(r'^password_changed/$','django.contrib.auth.views.password_change_done'),
    # jpb, 2/24 register page working 
    #  jpb, 3/28 commented out below to use and test django-registration
 #   url(r'^register/$','report.views.register',name='register'), 
    # jpb, 2/24 added for login
    url(r'^login/$','report.views.user_login',name='login'),
    
    # jpb, 2/24 added for logout
    # jpb, 3/28 commented out below to use and test django-registration
     url(r'^logout/$','report.views.user_logout',name='logout'), 
    # jpb, 3/8/2014 added to change password in dashboard
    url(r'^changepassword/$','report.views.changepassword',name='changepassword'),

    # jpb, 4/14/2014, added for password reset
    url(r'^reset/$','report.views.reset', name='reset'),

## jpb, 4/4/2014 added URLs for user profile infp
#    url(r'^users/(?P<slug>\w+)/$',UserProfileDetailView.as_view(), name="profile"),
    

## jpb, this URL is for user dashboard
    url(r'^dashboard/$','report.views.dashboard',name='dashboard'),

## jpb, these are for sending email reports
    url(r'^sendmktrpt/(?P<client_id>\d+)/$','report.views.sendmktrpt',name='sendmktrpt'),

## jpb, 5/9/2014, this is to allow a user to select clients for sending report
    url(r'^select_client_email/$','report.views.select_client_emails',name='select_client_email'),

## NOT USED BELOW
       # jpb, example template for report.  Old and can be removed.
      #  url(r'^report/', views.report, name='report'),

    # sample only, not used 
    url(r'^client_report/get/(?P<client_id>\d+)/$','report.views.client_report'),



)

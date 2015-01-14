from django.db import models

# Create your models here.

# jpb, 3/21/2014, added serializers
from django.core import serializers

# jpb, 3/21/2014, added for auth and login
from django.contrib.auth.models import User

# jpb, 4/3/2014 added User Profile model 
class UserProfile(models.Model):
     user = models.OneToOneField(User,unique=True)
     bio = models.TextField(null=True)
     position = models.TextField(null=True)
     has_optedout = models.BooleanField()
     wants_alerts = models.BooleanField()
     wants_marketinfo = models.BooleanField()
     wants_newsletters = models.BooleanField()
     
     def __unicode__(self):
          return "%s's profile" % self.user

# jpb, 5/21/2014 added the Site model
# to support site reporting.  Each User Profile may belong to a Site
class DataiumSiteTraffic(models.Model):
     dataiumsiteid = models.IntegerField(default=0)
     sitename = models.CharField(max_length=128)
     dealername = models.CharField(max_length=128)
     dma = models.ForeignKey('DataiumDMA')
     percentdma = models.FloatField(default=0.0)
     

     def __unicode__(self):
         return self.sitename

     def _get_dma_site(self):
         return '%s %s' % (self.dma, self.sitename)
     full_site = property(_get_dma_site)

# jpb, 5/21 added the DMA model
# to support DMA / site reporting.  Each site belongs to only one DMA
class DataiumDMA(models.Model):
     dataiumdmaid = models.IntegerField(default=0)
     dmaname = models.CharField(max_length=128)

     def __unicode__(self):
         return self.dmaname

     def get_json(self):
         return {
              "dma":self.dmaname,
              "sites": [{"id": s.id, "sitename": s.sitename, "size":s.percentdma} for s in self.dataiumsite_set.all()]}



#def create_profile(sender, instance, created, **kwargs):
#     if created:
#          profile, created = UserProfile.objects.get_or_create(user=instance)

# Signal while saving user 
#from django.db.models.signals import post_save
#post_save.connect(create_profile, sender=User)


# jpb, 3/21/2014 added parent Client model for reporting app
class Client(models.Model):
     clientname = models.CharField(max_length=128)
     clientemail = models.EmailField(max_length=50)
     dataiumclientid = models.IntegerField(default=0)
     dataiumreportmonth = models.CharField(max_length=50)
     clienthasoptedout = models.CharField(max_length=3)
     clientdma = models.CharField(max_length=50)
     clientcity = models.CharField(max_length=50)
     clientstate = models.CharField(max_length=12)
     clientwebsite = models.CharField(max_length=50)
     clientshopimage = models.CharField(max_length=100)
     clientdmmimage = models.CharField(max_length=100)
     clienthitlistimage = models.CharField(max_length=100)
     clientsocialimage = models.CharField(max_length=100)
     clientutilityimage = models.CharField(max_length=100)
     # jpb, 4/17/2014 added clientimagemonth ('mmyyyy') to maintain history
     # for images.
     clientimagemonth = models.CharField(max_length=20,default='mmyyyy')

     def __unicode__(self):
	return self.clientname

# jpb, 3/2014, added model for cross shop data
class ClientCrossshop(models.Model):
    client = models.ForeignKey(Client,related_name='shops')
    dataiumclientid = models.IntegerField(default=0)
    clientmodel = models.CharField(max_length=50)
    crossmodel = models.CharField(max_length=50)
    shops = models.IntegerField(default=0)

    def __unicode__(self):
        return ' '.join([self.clientmodel, ',',self.crossmodel,',',str(self.shops),])


# jpb, 3/21/2014, added class for model momentum data
class ClientModelMomentum(models.Model):
    client = models.ForeignKey(Client, related_name='dmm')
    dataiumclientid = models.IntegerField(default=0)
    clientmodel = models.CharField(max_length=50)
    yearmonth = models.CharField(max_length=20)
    dmm = models.CharField(max_length=10)
    active = models.CharField(max_length=2)
    
    def __unicode__(self):
        return ' '.join([self.clientmodel,' ',self.yearmonth,' ',self.dmm,])


# jpb, 3/21/2014 added class for hit list
class ClientHitList(models.Model):
    client = models.ForeignKey(Client, related_name='hitlist')
    dataiumclientid = models.IntegerField(default=0)
    stocknumber = models.CharField(max_length=20)
    vehicle = models.CharField(max_length=50)
    shopperindex = models.CharField(max_length=20)
    lastviewed = models.CharField(max_length=20)
    
    
    def __unicode__(self):
        return ' '.join([str(self.dataiumclientid),' ',self.stocknumber,' ',self.vehicle,' ',self.shopperindex,' ', self.lastviewed,])


# jpb, 3/21/2014, added class for search keyword
# jpb, 3/17/2014 ADDED search keyword
class ClientSearchKeyword(models.Model):
    client = models.ForeignKey(Client, related_name='search')
    dataiumclientid = models.IntegerField(default=0)
    searchkeyword = models.CharField(max_length=100)
    searchkw_pageviews = models.IntegerField(default=0)
    
    def __unicode__(self):
        return ' '.join([str(self.dataiumclientid),' ',self.searchkeyword,' ',str(self.searchkw_pageviews),])
        
# jpb, 3/21/2014, ADDED NEW vs. Used 
class ClientNewUsedSplit(models.Model):
    client = models.ForeignKey(Client, related_name='newused')
    dataiumclientid = models.IntegerField(default=0)
    newpercent = models.CharField(max_length=10)
    usedpercent = models.CharField(max_length=10)
    
    def __unicode__(self):
        return ' '.join([str(self.dataiumclientid),' ',self.newpercent,' ',self.usedpercent,])


# jpb, 6/10/2014, ADDED FOR RE-WORK TO SUPPORT DEALER HIERARCHY

# class Dealer(models.Model):
#    dealername = models.CharField(max_length=128)
#    dealercity = models.CharField(max_length=50)
#    dealerstate = models.CharField(max_length=20)
#    dealermainsite = models.CharField(max_length=50)
#    dma = models.ForeignKey(DataiumDMA, related_name='dma')
#    dealerdma = models.CharField(max_length=50)

#    def __unicode__(self):
#        return ''.join([self.dealername,' ',self.city,', ',self.state,])

   
        

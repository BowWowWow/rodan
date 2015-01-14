from django.shortcuts import render

# Create your views here.

# jpb, added for report test only
from django.http import HttpResponse
from django.template import RequestContext
from django.shortcuts import render_to_response
# jpb, I added this in an attempt to return child data as JSON
from django.core import serializers
import json

# jpb, added new views for report models and testing
from report.models import Client
from report.models import ClientCrossshop
from report.models import ClientNewUsedSplit
from django.views.generic import ListView

# jpb, added for user auth
from report.forms import ClientForm
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required

# jpb, 5/21/2014, added for sunburst testing
from report.models import DataiumDMA, DataiumSiteTraffic
from django.utils import simplejson


# jpb, added for email testing
from django.views.generic.base import TemplateView
from django.core.mail import EmailMultiAlternatives
from django.core.mail import EmailMessage
from django.template.loader import get_template
from django.template import Context

# jpb, only for debugging
import pprint


# jpb, 3/28 added import for registration backend
from registration.backends import *

from django.http import HttpResponseRedirect


# jpb, 4/4 added for user profile page
# from django.views.generic import DetailView
# from django.contrib.auth import get_user_model
# from report.models import UserProfile

# jpb, 4/14/2014 added for password reset
from django.contrib.auth.views import password_reset, password_reset_confirm
from django.core.urlresolvers import reverse

# jpb, 4/17/2014 added for exception check if client id not found
from django.core.exceptions import ObjectDoesNotExist
from django.http import Http404




# view to point to home page (index.html)
def index(request):
   #  return HttpResponse("Hello from Report app")
       # Request the context of the request.
    # The context contains information such as the client's machine details, for example.
    context = RequestContext(request)

    # Construct a dictionary to pass to the template engine as its context.
    # Note the key boldmessage is the same as {{ boldmessage }} in the template!
    context_dict = {'boldmessage': "I am bold font from the context"}

    # Return a rendered response to send to the client.
    # We make use of the shortcut function to make our lives easier.
    # Note that the first parameter is the template we wish to use.
    return render_to_response('./index.html', context_dict, context)

# jpb, 2-24 added user_login
def user_login(request):
    # Like before, obtain the context for the user's request.
    context = RequestContext(request)

    # If the request is a HTTP POST, try to pull out the relevant information.
    if request.method == 'POST':
        # Gather the username and password provided by the user.
        # This information is obtained from the login form.
        username = request.POST['username']
        password = request.POST['password']

        # Use Django's machinery to attempt to see if the username/password
        # combination is valid - a User object is returned if it is.
        user = authenticate(username=username, password=password)

        # If we have a User object, the details are correct.
        # If None (Python's way of representing the absence of a value), no user
        # with matching credentials was found.
        if user is not None:
            # Is the account active? It could have been disabled.
            if user.is_active:
                # If the account is valid and active, we can log the user in.
                # We'll send the user back to the homepage.
                login(request, user)
                return HttpResponseRedirect('/report/dashboard')
            else:
                # An inactive account was used - no logging in!
                return HttpResponse("Your Rango account is disabled.")
        else:
            # Bad login details were provided. So we can't log the user in.
            print "Invalid login details: {0}, {1}".format(username, password)
            return HttpResponse("Invalid login details supplied.")

    # The request is not a HTTP POST, so display the login form.
    # This scenario would most likely be a HTTP GET.
    else:
        # No context variables to pass to the template system, hence the
        # blank dictionary object...
        return render_to_response('./registration/login.html', {}, context)

#jpb, 2/24, added user log out
# Use the login_required() decorator to ensure only those logged in can access the view.
@login_required
def user_logout(request):
    # Since we know the user is logged in, we can now just log them out.
    logout(request)

    # Take the user back to the homepage.
    return HttpResponseRedirect('/')
    
# jpb, 2/24/ now working


## END OF REGISTRATION

## jpb, 4/14/2014 added to reset password
### RESET PASSWORD (WHEN USER NOT LOGGED IN)

def reset(request):
    return password_reset(request, template_name='password_reset_form.html',
          email_template_name='password_reset_email.html',
          subject_template_name = 'reset_subject.txt',
          post_reset_redirect = reverse('login'))

   



## jpb, 3/8/2014, added for change password after login - NOT Forgot Password or Verify
## CHANGE PASSWORD (WHEN USER IS LOGGED IN
@login_required
def changepassword(request):
    context = RequestContext(request)
    
    return render_to_response('changepassword.html',{'changepassword':changepassword},context)
    

## USER PROFILE
# jpb, 4/42014 added user profile ino
#class UserProfileDetailView(DetailView):
#     model = get_user_model()
#     slug_field = "username"
#     template_name = "user_detail.html"

#     def get_object(self,queryset=None):
#          user = super(UserProfileDetailView, self).get_object(queryset)
#          UserProfile.objects.get_or_create(user=user)
#          return user


## END OF USER PROFILE

## START OF DASHBOARD (NOT MARKET REPORT, BUT USER DASHBOARD)

## jpb, 2/28 added dashboard
@login_required
def dashboard(request):
    context = RequestContext(request)
    
    return render_to_response('dashboard.html', {}, context)

## end of dashboard

## jpb, 3/1, START OF EMAIL VIEWS
def sendmktrpt(request, client_id=1):
    client=Client.objects.get(id=client_id)
    # bogus_shops = client.shops.all()
    # shops = serializers.serialize('json',bogus_shops)
    # bogus_dmm = client.dmm.filter(active='Y')
    # dmm = serializers.serialize('json',bogus_dmm)
    hitlist = client.hitlist.all()
    search = client.search.all()
    newuseddata = client.newused.all()
    subject = "Dataium Market Report for October 2014"
    to = [client.clientemail]
    # to = ['jburns@dataium.com','burns_jp@bellsouth.net']
    to = []
    bogusto = client.clientemail
    to = bogusto.split(',')

    bcc = ['support@dataium.com','jburns@dataium.com']
    from_email = 'no-reply@dataium.com'
    ctx = {
        'client':client,
        'hitlist':hitlist,
        'search':search,
        'newuseddata':newuseddata,
    }
    
    message = get_template('client_email.html').render(Context(ctx))
    msg = EmailMessage(subject,message,to=to,from_email=from_email,bcc=bcc)
    # msg = EmailMessage(subject,message,to=to,from_email=from_email)
    msg.content_subtype = 'html'
    msg.send()
    return HttpResponse('email sent')
    
## jpb, END OF EMAIL VIEWS

## START OF MARKET REPORT

## jpb, 2/7 THIS WORKED AND ALLOWED ME TO GET ALL CHILDREN BACK FROM PARENT CLASS  
##   locals() will create the dictionary automagically
##   'shops' is the variable that contains the info
##    this is main report - don't remove
def client_name(request, client_id=1):
# jpb, changed to add exception check if client not found
    try:
    	client = Client.objects.get(id=client_id)
       
#   jpb, this worked
        bogus_shops = client.shops.all()
        shops = serializers.serialize('json',bogus_shops)
        bogus_dmm = client.dmm.all()
        dmm = serializers.serialize('json',bogus_dmm)
        bogus_search = client.search.all()
        search = serializers.serialize('json',bogus_search)
        hitlist = client.hitlist.all()
        newuseddata = client.newused.all()

        return render_to_response('client.html',locals(),context_instance=RequestContext(request))
    
    except ObjectDoesNotExist:
	print "Client id requested does not exist"
        raise Http404



## jpb, 2/13, THIS VIEW GENERATES A CLIENT CROSS SHOP CHART ONLY - DON"T REMOVE
def client_crossshops(request, client_id=1):
    try:
        client = Client.objects.get(id=client_id)
#   jpb, this worked
    	bogus_shops = client.shops.all()
    	shops = serializers.serialize('json',bogus_shops)
    	bogus_dmm = client.dmm.filter(active='Y')
    	dmm = serializers.serialize('json',bogus_dmm)
    	bogus_hitlist = client.hitlist.all()
    	hitlist = serializers.serialize('json',bogus_hitlist)
        return render_to_response('client_crossshops.html',locals(),context_instance=RequestContext(request))

    except ObjectDoesNotExist:
        print "Client id requested does not exist for this Cross Shop View"
        raise Http404


## jpb, 2/13, THIS VIEW GENERATES A DMM CHART ONLY
# jpb, 4/17, updated to throw 404 if client not found
def client_dmm(request, client_id=1):
    try:
        client = Client.objects.get(id=client_id)
#   jpb, this worked
        bogus_shops = client.shops.all()
        shops = serializers.serialize('json',bogus_shops)
        bogus_dmm = client.dmm.all()
        dmm = serializers.serialize('json',bogus_dmm)
        return render_to_response('client_dmm.html',locals(),context_instance=RequestContext(request))
    except ObjectDoesNotExist:
        print "Client id requested does not exist for this DMM view"
        raise Http404


## jpb, 3/18, 2014 THIS VIEW GENERATES THE TAG CLOUD ONLY
# jpb 4/17, Added exception handling for client object not found
def client_search(request,client_id=1):
    try:
        client=Client.objects.get(id=client_id)
        bogus_search = client.search.all()
        search = serializers.serialize('json',bogus_search)
        return render_to_response('client_search.html',locals(),context_instance=RequestContext(request))
    except ObjectDoesNotExist:
        print "Client id requested does not exist for this Tag Cloud view"
        raise Http404

## jpb, 2/13, THIS VIEW GENERATES A HITLIST ONLY
def client_hitlist(request, client_id=1):
    client = Client.objects.get(id=client_id)
    hitlist = client.hitlist.all()
    return render_to_response('client_hitlist.html',locals(),context_instance=RequestContext(request))


## jpb, 3/31, THIS IS FOR TESTING CIRCLE CHART (CUSTOM GRAPHIC) ONLY
def client_circletest(request,client_id=1):
    return render_to_response('client_circletest.html',locals(),context_instance=RequestContext(request))

## jpb, 5/21/2014, THIS IS FOR SUNBURST TESTING BY DMA ONLY

def dma_sunburst(request, dma_id=1):
     bogus_sites = DataiumSite.objects.filter(dma=dma_id)
     bogus_dma = DataiumDMA.objects.get(id=dma_id)
     # bogus_sites = DataiumSite.objects.select_related().filter(dma=dma_id)
     # bogus_sites = bogus_dma.sites
     sites = serializers.serialize('json',bogus_sites)
     # dma = serializers.serialize('json',bogus_dma)
     data = simplejson.dumps([a.get_json() for a in DataiumDMA.objects.filter(id=dma_id)])
     return render_to_response('dma_sunburst.html',locals(),context_instance=RequestContext(request))

 

    
def get_model_shops(request):
    return render(request,'client_report.html',{'client_model_shops':ClientCrossshop})

## jpb, 5/9/2014, THIS IS FOR SENDING EMAILS.  IT's THE LINK OFF THE DASHBORD WHEN AN ADMIN USER IS LOGGED IN
def select_client_emails(request):
    client_list = Client.objects.all().order_by('clientname')
    context = { 'client_list':client_list}
    return render(request,'select_client_email.html',context)
    


## VIEWS NOT USED BELOW
## THESE ARE OLD AND NOT USED

## This is old report.  can be removed
def report(request):
    return render_to_response('report.html')
    
## this is old sample report, not used    
def client_report(request, client_id=1):
    return render_to_response('client_report.html',{'client':Client.objects.get(id=client_id) })

## jpb, 2/13 NOT USED ANYMORE
##  THIS VIEW IS FOR THE BOOTSTRAP MOCKUP SHOWING LIVE CHARTS
##  IT IS BASED ON THE PREVIOUS VIEW (Client_Name) but uses "Client_REport.html" 
###  WHICH EXTENDS the template "base.html" to produce D3.JS charts
##   THIS IS NOT USED ANYMORE
def client_sample(request, client_id=1):
    client = Client.objects.get(id=client_id)
#   jpb, this worked
    bogus_shops = client.shops.all()
    shops = serializers.serialize('json',bogus_shops)
    bogus_dmm = client.dmm.all()
    dmm = serializers.serialize('json',bogus_dmm)
    bogus_hitlist = client.hitlist.all()
    hitlist = serializers.serialize('json',bogus_hitlist)
    return render_to_response('client_report.html',locals(),context_instance=RequestContext(request))
#    return render_to_response('market_report.html',locals(),context_instance=RequestContext(request))

## old sample - not used    
def shops(request, myid=1):
    clientobj = ClientCrossshop.objects.filter(client_id=myid)
    crossshops_as_json = serializers.serialize('json',clientobj)
    # return HttpResponse(crossshops_as_json, content_type = 'json')
    return render_to_response('shops.html',{'crossshops':clientobj})
    

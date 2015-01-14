from django.contrib import admin

# jpb added for profile updates
from django.contrib.auth.admin import UserAdmin
#from django.contrib.auth import get_user_model
#from report.models import UserProfile

# Register your models here.
from report.models import Client
from report.models import ClientModelMomentum
from report.models import ClientCrossshop
from report.models import ClientHitList
from report.models import ClientSearchKeyword
from report.models import ClientNewUsedSplit


# added for user profile
#class UserProfileInline(admin.StackedInline):
#     model = UserProfile
#     can_delete = False

#class UserProfileAdmin(UserAdmin):
#     inlines=(UserProfileInline,)




admin.site.register(Client)
#admin.site.unregister(get_user_model())
#admin.site.register(get_user_model(), UserProfileAdmin)



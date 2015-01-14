"""
Django settings for rodanportal project.

For more information on this file, see
https://docs.djangoproject.com/en/1.6/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.6/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
BASE_DIR = os.path.dirname(os.path.dirname(__file__))
#  BASE_DIR IS /home/jburns/Documents/rodan/rodanportal
TEMPLATE_PATH = os.path.join(BASE_DIR, 'templates')
# TEMPLATE_PATH IS /home/jburns/Documents/rodan/rodanportal/templates
REPORT_PATH = os.path.join(BASE_DIR,'report')
# 
REGISTRATION_PATH = os.path.join(BASE_DIR,'registration/templates')
# print BASE_DIR
# print TEMPLATE_PATH
# print REPORT_PATH
print REGISTRATION_PATH

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.6/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '11@=vq&s^=0nlmo0qkr)vl92g)bqrw8uf&5n)a94t^mn!yo3jj'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

TEMPLATE_DEBUG = True

ALLOWED_HOSTS = []

# jpb, 3/21, added EMAIL setup
EMAIL_USE_TLS = True
EMAIL_HOST = 'smtp.mandrillapp.com'
EMAIL_HOST_USER = 'jburns@dataium.com'
EMAIL_HOST_PASSWORD = 'ESYomNVo5D661rMsbkz8-w'
EMAIL_PORT = 587
DEFAULT_FROM_EMAIL = 'no-reply@dataium.com'


# Application definition

INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
# jpb, 3/21, added report app
    'report',
# jpb, 3/28, added registration app
    'registration',
# jpb, 4/4, added south for DB migrations
    'south',
# jpb, 4/4, added for user profiles
    'profiles',
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

ROOT_URLCONF = 'rodanportal.urls'

WSGI_APPLICATION = 'rodanportal.wsgi.application'

# jpb, 3/28/2014, added ACCOUNT_ACTIVATION_DAYS for django-registration
ACCOUNT_ACTIVATION_DAYS = 2

# jpb, 4/4/2014 added for user profiles
AUTH_PROFILE_MODULE = 'report.UserProfile'

# Database
# https://docs.djangoproject.com/en/1.6/ref/settings/#databases

DATABASES = {
    'default': {
    #    'ENGINE': 'django.db.backends.sqlite3',
    #    'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
	'ENGINE': 'django.db.backends.mysql',
	'NAME': 'rodan',
	'USER': 'root',
	'PASSWORD': 'Voyager26!',
	'HOST': 'localhost',
	'PORT': '3306',
        'STORAGE_ENGINE':'MyISAM',
    }
}

# Internationalization
# https://docs.djangoproject.com/en/1.6/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'America/Chicago'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.6/howto/static-files/

STATIC_URL = '/static/'

# jpb, 3/27, 2014 added TEMPLATE_DIRS FOR CORRECT 
# search path to TEMPLATES
TEMPLATE_DIRS = (
	TEMPLATE_PATH,
	REGISTRATION_PATH,

)

# jpb, 3/27/2014
# added STATICFILES_DIRS for static directories
STATICFILES_DIRS = (
	os.path.join(REPORT_PATH,"static"),
)

# jpb, 4/1/2014
# added LOGIN REDIRECT for redirection from profiles
LOGIN_REDIRECT_URL = '/report/dashboard/'

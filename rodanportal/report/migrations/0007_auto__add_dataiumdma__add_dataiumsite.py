# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'DataiumDMA'
        db.create_table(u'report_dataiumdma', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('dataiumdmaid', self.gf('django.db.models.fields.IntegerField')(default=0)),
            ('dmaname', self.gf('django.db.models.fields.CharField')(max_length=128)),
        ))
        db.send_create_signal(u'report', ['DataiumDMA'])

        # Adding model 'DataiumSite'
        db.create_table(u'report_dataiumsite', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('dataiumsiteid', self.gf('django.db.models.fields.IntegerField')(default=0)),
            ('sitename', self.gf('django.db.models.fields.CharField')(max_length=128)),
            ('dealername', self.gf('django.db.models.fields.CharField')(max_length=128)),
            ('dma', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['report.DataiumDMA'])),
        ))
        db.send_create_signal(u'report', ['DataiumSite'])


    def backwards(self, orm):
        # Deleting model 'DataiumDMA'
        db.delete_table(u'report_dataiumdma')

        # Deleting model 'DataiumSite'
        db.delete_table(u'report_dataiumsite')


    models = {
        u'auth.group': {
            'Meta': {'object_name': 'Group'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '80'}),
            'permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'})
        },
        u'auth.permission': {
            'Meta': {'ordering': "(u'content_type__app_label', u'content_type__model', u'codename')", 'unique_together': "((u'content_type', u'codename'),)", 'object_name': 'Permission'},
            'codename': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['contenttypes.ContentType']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        u'auth.user': {
            'Meta': {'object_name': 'User'},
            'date_joined': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'groups': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'related_name': "u'user_set'", 'blank': 'True', 'to': u"orm['auth.Group']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'is_staff': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'is_superuser': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'last_login': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'password': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'user_permissions': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'related_name': "u'user_set'", 'blank': 'True', 'to': u"orm['auth.Permission']"}),
            'username': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30'})
        },
        u'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        u'report.client': {
            'Meta': {'object_name': 'Client'},
            'clientcity': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'clientdma': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'clientdmmimage': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'clientemail': ('django.db.models.fields.EmailField', [], {'max_length': '50'}),
            'clienthasoptedout': ('django.db.models.fields.CharField', [], {'max_length': '3'}),
            'clienthitlistimage': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'clientimagemonth': ('django.db.models.fields.CharField', [], {'default': "'mmyyyy'", 'max_length': '20'}),
            'clientname': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'clientshopimage': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'clientsocialimage': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'clientstate': ('django.db.models.fields.CharField', [], {'max_length': '12'}),
            'clientutilityimage': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'clientwebsite': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'dataiumclientid': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'dataiumreportmonth': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        },
        u'report.clientcrossshop': {
            'Meta': {'object_name': 'ClientCrossshop'},
            'client': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'shops'", 'to': u"orm['report.Client']"}),
            'clientmodel': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'crossmodel': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'dataiumclientid': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'shops': ('django.db.models.fields.IntegerField', [], {'default': '0'})
        },
        u'report.clienthitlist': {
            'Meta': {'object_name': 'ClientHitList'},
            'client': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'hitlist'", 'to': u"orm['report.Client']"}),
            'dataiumclientid': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'lastviewed': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'shopperindex': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'stocknumber': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'vehicle': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        u'report.clientmodelmomentum': {
            'Meta': {'object_name': 'ClientModelMomentum'},
            'active': ('django.db.models.fields.CharField', [], {'max_length': '2'}),
            'client': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'dmm'", 'to': u"orm['report.Client']"}),
            'clientmodel': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'dataiumclientid': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'dmm': ('django.db.models.fields.CharField', [], {'max_length': '10'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'yearmonth': ('django.db.models.fields.CharField', [], {'max_length': '20'})
        },
        u'report.clientnewusedsplit': {
            'Meta': {'object_name': 'ClientNewUsedSplit'},
            'client': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'newused'", 'to': u"orm['report.Client']"}),
            'dataiumclientid': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'newpercent': ('django.db.models.fields.CharField', [], {'max_length': '10'}),
            'usedpercent': ('django.db.models.fields.CharField', [], {'max_length': '10'})
        },
        u'report.clientsearchkeyword': {
            'Meta': {'object_name': 'ClientSearchKeyword'},
            'client': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'search'", 'to': u"orm['report.Client']"}),
            'dataiumclientid': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'searchkeyword': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'searchkw_pageviews': ('django.db.models.fields.IntegerField', [], {'default': '0'})
        },
        u'report.dataiumdma': {
            'Meta': {'object_name': 'DataiumDMA'},
            'dataiumdmaid': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'dmaname': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        },
        u'report.dataiumsite': {
            'Meta': {'object_name': 'DataiumSite'},
            'dataiumsiteid': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'dealername': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'dma': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['report.DataiumDMA']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'sitename': ('django.db.models.fields.CharField', [], {'max_length': '128'})
        },
        u'report.userprofile': {
            'Meta': {'object_name': 'UserProfile'},
            'bio': ('django.db.models.fields.TextField', [], {'null': 'True'}),
            'has_optedout': ('django.db.models.fields.BooleanField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'position': ('django.db.models.fields.TextField', [], {'null': 'True'}),
            'user': ('django.db.models.fields.related.OneToOneField', [], {'to': u"orm['auth.User']", 'unique': 'True'}),
            'wants_alerts': ('django.db.models.fields.BooleanField', [], {}),
            'wants_marketinfo': ('django.db.models.fields.BooleanField', [], {}),
            'wants_newsletters': ('django.db.models.fields.BooleanField', [], {})
        }
    }

    complete_apps = ['report']
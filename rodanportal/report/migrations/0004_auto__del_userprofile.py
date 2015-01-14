# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Deleting model 'UserProfile'
        db.delete_table(u'report_userprofile')


    def backwards(self, orm):
        # Adding model 'UserProfile'
        db.create_table(u'report_userprofile', (
            ('bio', self.gf('django.db.models.fields.TextField')(null=True)),
            ('user', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['auth.User'], unique=True)),
            ('wants_newsletters', self.gf('django.db.models.fields.BooleanField')()),
            ('wants_alerts', self.gf('django.db.models.fields.BooleanField')()),
            ('position', self.gf('django.db.models.fields.TextField')(null=True)),
            ('has_optedout', self.gf('django.db.models.fields.BooleanField')()),
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('wants_marketinfo', self.gf('django.db.models.fields.BooleanField')()),
        ))
        db.send_create_signal(u'report', ['UserProfile'])


    models = {
        u'report.client': {
            'Meta': {'object_name': 'Client'},
            'clientcity': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'clientdma': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'clientdmmimage': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'clientemail': ('django.db.models.fields.EmailField', [], {'max_length': '50'}),
            'clienthasoptedout': ('django.db.models.fields.CharField', [], {'max_length': '3'}),
            'clienthitlistimage': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
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
        }
    }

    complete_apps = ['report']
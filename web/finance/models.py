# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin sqlcustom [app_label]'
# into your database.
from __future__ import unicode_literals
from django.db import models

class StockHistory(models.Model):
    symbolid = models.CharField(max_length=20)
    open = models.CharField(max_length=10)
    close = models.CharField(max_length=10)
    high = models.CharField(max_length=10)
    low = models.CharField(max_length=10)
    volume = models.CharField(max_length=15)
    date = models.DateTimeField()
    k = models.FloatField()
    d = models.FloatField()

    class Meta:
        managed = False
        db_table = 'stock_history'
        app_label = 'finance'


class StockList(models.Model):
    symbolid = models.CharField(max_length=10)
    symbol = models.CharField(max_length=10)
    start = models.DateTimeField()
    type = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'stock_list'
        app_label = 'finance'
		

class UserFinanceRecord(models.Model):
    id = models.IntegerField()
    uid = models.IntegerField()
    type = models.IntegerField()
    symbolid = models.CharField(max_length=20)
    num = models.IntegerField()
    price = models.FloatField()
    hand = models.IntegerField()
    tax = models.IntegerField()
    fout = models.IntegerField()
    fin = models.IntegerField()
    total = models.IntegerField()
    date = models.DateField()
    mtime = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'user_finance_record'
        app_label = 'finance'


class UserFinanceStock(models.Model):
    id = models.IntegerField()
    uid = models.IntegerField()
    symbolid = models.CharField(max_length=20)
    num = models.IntegerField()
    bprice = models.FloatField()
    date = models.DateField()

    class Meta:
        managed = False
        db_table = 'user_finance_stock'
        app_label = 'finance'

class UserProfile(models.Model):
    uid = models.IntegerField()
    bank = models.IntegerField()
    num = models.IntegerField()
    udate = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'user_profile'
        app_label = 'finance'

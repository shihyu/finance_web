# -*-coding:utf-8 -*-
from django.conf.urls import include, url
from django.contrib import admin
from finance.views import index,stock,profile,setting,map
from api.views import getStockHistory,getStockInfo,getStockInfoNow,setStock,getStock,delStock

urlpatterns = [
	url(r'^accounts/', include('allauth.urls')),
    url(r'^admin/', include(admin.site.urls)),
	url(r'^profile/',profile),
	url(r'^setting/',setting),
	url(r'^map/',map),
	url(r'^api/getStockHistory',getStockHistory),
	url(r'^api/getStockInfoNow',getStockInfoNow),
	url(r'^api/getStockInfo',getStockInfo),
	url(r'^api/user/setStock', setStock),
	url(r'^api/user/delStock', delStock),
	url(r'^api/user/getStock', getStock),
	url(r'^stock/(?P<id>[0-9]+)/$',stock),
	url(r'^$',index),
]

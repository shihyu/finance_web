# -*-coding:utf-8 -*-
from django.shortcuts import render
from django.contrib.auth.decorators import login_required  


def index(request):
	return render(request,"web/index.html",locals())
	
def stock(request,id):
	sid = id
	return render(request,"web/stock.html",locals())
	
def profile(request):
	return render(request,"web/profile.html",locals())
	
def setting(request):
	return render(request,"web/setting.html",locals())
	
def map(request):
	return render(request,"web/map.html",locals())
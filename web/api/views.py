# -*- coding: utf-8 -*-
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from finance.models import StockHistory,StockList,UserFinanceRecord
from django.core import serializers
from django.http import HttpResponse
from django.http import JsonResponse
from yahoo_finance import Share
from django.utils import timezone


@login_required
def setStock(request):
	if request.method == 'POST':
	
		uid = request.user.id
		type = request.POST.get('type')
		symbolid = request.POST.get('symbolid')
		num = request.POST.get('num')
		price = request.POST.get('price')
		date = request.POST.get('date')
		mtime = timezone.now()
		
		if not symbolid:
			return JsonResponse({"success": 'false', 'error': '股票代碼未填寫', 'errid': 's01'})
		if not num:
			return JsonResponse({"success": 'false', 'error': '數量未填寫', 'errid': 's02'})
		if not price:
			return JsonResponse({"success": 'false', 'error': '價格未填寫', 'errid': 's03'})	
		if not date:
			return JsonResponse({"success": 'false', 'error': '時間未填寫', 'errid': 's04'})	
		
		hand = float(price) * float(num) * 0.001425
		tax = 0
		fin = 0
		fout = 0
		total = 0
		
		if int(type) == 1:
			fout = float(price) * float(num) + hand	
		if int(type) == 2:
			tax = float(price) * float(num) * 0.003
			fin = float(price) * float(num) - hand - tax
		if int(type) == 3:
			hand = 0
			fin = float(price) * float(num)

		UserFinanceRecord.objects.create(uid=uid,type=type,symbolid=symbolid,num=num,price=price,hand=hand,tax=tax,fout=fout,fin=fin,total=total,date=date,mtime=mtime)
		
		return JsonResponse({"result": "Add successfully! "+symbolid})
	else:
		return JsonResponse({"success": 'false', 'error': 'wrong method'})

@login_required
def delStock(request):
	if request.method == 'POST':
	
		id = request.POST['id']
		uid = request.user.id
		
		d = UserFinanceRecord.objects.filter(uid=uid,id=id)
		d.delete()
		
		return JsonResponse({"result": 'delete '+id})
	else:
		return JsonResponse({"success": 'false', 'error': 'wrong method'})
		
@login_required
def getStock(request):
	if request.method == 'GET':
		uid = request.user.id
		data = serializers.serialize('json', UserFinanceRecord.objects.filter(uid=uid).order_by('-mtime'))
		return HttpResponse(data, content_type="application/json")
	else:
		return JsonResponse({"success": 'false', 'error': 'wrong method'})
		
@login_required
def getStockHistory(request):
	if request.method == 'GET':
		sid = request.GET['sid']
		data = serializers.serialize('json', StockHistory.objects.filter(symbolid=sid).order_by('-date')[:400])
		return HttpResponse(data, content_type="application/json")
	else:
		return JsonResponse({"success": 'false', 'error': 'wrong method'})

@login_required		
def getStockInfoNow(request):
	if request.method == 'GET':
		sid = request.GET['sid']
		try:
			s = Share(sid+'.TW')
			p = float(s.get_price())
			c = float(s.get_change())
			v = float(s.get_volume())/1000
			pc = float(s.get_prev_close())
		except:
			return JsonResponse({"success": 'false', 'error': 'wrong sid'})
		return JsonResponse({'price': p, 'change': c, 'volume': v, 'prev_close': pc})
	else:
		return JsonResponse({"success": 'false', 'error': 'wrong method'})

@login_required
def getStockInfo(request):
	if request.method == 'GET':
		sid = request.GET['sid']
		try:
			data = serializers.serialize('json', StockList.objects.filter(symbolid=sid))
		except:
			return JsonResponse({"success": 'false', 'error': 'wrong sid'})
		return HttpResponse(data, content_type="application/json")
	else:
		return JsonResponse({"success": 'false', 'error': 'wrong method'})

#!/usr/bin/env python
# -*- coding: utf-8 -*-
import MySQLdb

def calKD(list,n,res):

	i = 0
	list_id = list[0]
	list_close = list[1]
	list_high = list[2]
	list_low = list[3]
	
	for close in list_close:
		
		cmin = 10000
		cmax = 0
		#print list_id[i]
		K=50
		D=50
		RSV=0
		#print i,i-n+1
		if i >= n-1:
			cmin = min(list_low[i-n+1:i+1])
			#print cmin,list_close[i-n+1:i+1]
			cmax = max(list_high[i-n+1:i+1])
			#print cmin,list[i-n+1:i]
			#start cal rsv
			#RSV=100*(第N天收盤價-近N日內最低價)/(近N日內最高價-近N日內最低價)
			RSV = 100 * (close - cmin)/(cmax - cmin)
			#Kt=(1/3)RSVt + (2/3)Kt-1
			#Dt=(1/3)Kt  + (2/3)Dt-1
			K = RSV / 3.0 + (res[len(res)-1][3] / 1.5)
			D = K / 3.0 + (res[len(res)-1][4] / 1.5)
			#print close,RSV,K,D
			#print RSV
		data=[list_id[i],close,RSV,K,D]
		res.append(data)
			
		i = i + 1

def updateKD(res):

	c = conn.cursor()
	for data in res:
		sql = "UPDATE stock_history SET k = "+ str(data[3]) +" , d = "+ str(data[4]) + " WHERE id = "+ str(data[0])
		try:
			c.execute(sql)
			conn.commit()
		except MySQLdb.Error,e:
			print "Mysql Error %d: %s" % (e.args[0], e.args[1])
			
		#print "id=" + str(data[0]) + "\tclose=" + str(data[1]) + "\tK=" + str(data[3]) + "\tD=" + str(data[4])+ "\tRSV=" + str(data[2]) 

		
def getStock(conn,id,list):
	c = conn.cursor()
	sql = "SELECT * FROM stock_history where symbolid = " + str(id) + " order by date"
	try:
		c.execute(sql)
		res = c.fetchall()
		list_id=[]
		list_close=[]
		list_high=[]
		list_low=[]
		for record in res:
			id = record[0]
			close = float(record[3])
			high = float(record[4])
			low = float(record[5])
			list_id.append(id)
			list_close.append(close)
			list_high.append(high)
			list_low.append(low)
			
		list.append(list_id)
		list.append(list_close)
		list.append(list_high)
		list.append(list_low)

	except MySQLdb.Error,e:
		print e

def connectDB():
	try:
		conn = MySQLdb.connect(host="localhost", user="root", passwd="123456qqq", db="finance")
		conn.set_character_set('utf8')
		return conn
	except socket.error as serror:
		if conn is not None:
			conn.close()

def insertDB(conn,RSV,K,D):

	c = conn.cursor()
	sql = "INSERT INTO stock_list(symbolid,symbol,start,type) VALUES(%s,%s,%s,%s)"
	try:
		c.execute(sql,(symbolid,symbol,start,type))
		conn.commit()
	except MySQLdb.Error,e:
		print "Mysql Error %d: %s" % (e.args[0], e.args[1])
	
	
def closeDB(conn):
	conn.close()
			
conn = None
conn = connectDB()
n = 9
list = []
res = []
getStock(conn,0050,list)
calKD(list,n,res)
updateKD(res)
for data in res:
	pass
	print "id=" + str(data[0]) + "\tclose=" + str(data[1]) + "\tK=" + str(data[3]) + "\tD=" + str(data[4])+ "\tRSV=" + str(data[2]) 

closeDB(conn)

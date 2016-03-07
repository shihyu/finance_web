#!/usr/bin/env python
# -*- coding: utf-8 -*-
from yahoo_finance import Share
import MySQLdb
import re
import requests
from bs4 import BeautifulSoup

def getList(conn):
	url = "http://isin.twse.com.tw/isin/C_public.jsp?strMode=2"
	res = requests.get(url, verify=False)
	soup = BeautifulSoup(res.text,'html.parser')
	
	for row in soup.select('tr'):
		cols = row.find_all('td')
		col1 = cols[0].text.encode('utf-8')
		data = re.search(r'(.*)    　(.*)',col1)
		if data is not None:
			if data.group(1) is not None:
				if data.group(2) is not None:
					if (len(cols[4].text.encode('utf-8')) != 0):
						symbolid =  filter(str.isalnum,data.group(1))
						symbol = data.group(2)
						start = cols[2].text.encode('utf-8')
						type = cols[4].text.encode('utf-8')
						#print symbolid,symbol,start,type
						insertDB(conn,symbolid,symbol,start,type)
						#print symbolid

def connectDB():
	try:
		conn = MySQLdb.connect(host="localhost", user="root", passwd="123456qqq", db="finance")
		conn.set_character_set('utf8')
		return conn
	except socket.error as serror:
		if conn is not None:
			conn.close()

def insertDB(conn,symbolid,symbol,start,type):

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
getList(conn)
#insertDB(conn,data,id)
closeDB(conn)
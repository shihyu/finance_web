# -*- coding: utf-8 -*-
import requests
import urllib2
import MySQLdb
import re
from bs4 import BeautifulSoup
import re
import datetime

def connectDB():
	try:
		conn = MySQLdb.connect(host="localhost", user="root", passwd="123456qqq", db="finance")
		conn.set_character_set('utf8')
		return conn
	except socket.error as serror:
		if conn is not None:
			conn.close()
			
def closeDB(conn):
	conn.close()

def getData(date,data):
	
	pdate = date[0:4] + date[5:7] + date[8:10]
	
	url = "http://www.stockq.org/stock/history/"+date[0:4]+"/"+date[5:7]+"/"+pdate+"_tc.php"
	requests.packages.urllib3.disable_warnings()

	res = requests.get(url, verify=False)
	soup = BeautifulSoup(res.text,'html.parser')
	
	tables = soup.find_all('table', attrs={'class':'marketdatatable'})
	table_count = 0
	
	for table in tables:
		if(table_count>=3):
			break
		rows = table.find_all('tr')
		for row in rows:
			cols = row.find_all('td')
			cols = [ele.text.strip() for ele in cols]
			if(len(cols)>4):
				text = cols[0].encode('Latin-1')
				if text == "澳洲股市":
					data.append(float(cols[1]))
					data.append(float(cols[2]))
				elif text == "日經225":
					data.append(float(cols[1]))
					data.append(float(cols[2]))
				elif text == "韓國股市":
					data.append(float(cols[1]))
					data.append(float(cols[2]))
				elif text == "台灣加權":
					data.append(float(cols[1]))
					data.append(float(cols[2]))
				elif text == "上海綜合":
					data.append(float(cols[1]))
					data.append(float(cols[2]))
				elif text == "上海A股":
					data.append(float(cols[1]))
					data.append(float(cols[2]))
				elif text == "上海B股":
					data.append(float(cols[1]))
					data.append(float(cols[2]))
				elif text == "深圳A股":
					data.append(float(cols[1]))
					data.append(float(cols[2]))
				elif text == "深圳B股":
					data.append(float(cols[1]))
					data.append(float(cols[2]))
				elif text == "香港恆生":
					data.append(float(cols[1]))
					data.append(float(cols[2]))
				elif text == "新加坡":
					data.append(float(cols[1]))
					data.append(float(cols[2]))
				elif text == "馬來西亞":
					data.append(float(cols[1]))
					data.append(float(cols[2]))
				elif text == "俄羅斯":
					data.append(float(cols[1]))
					data.append(float(cols[2]))
				elif text == "英國股市":
					data.append(float(cols[1]))
					data.append(float(cols[2]))
				elif text == "法國股市":
					data.append(float(cols[1]))
					data.append(float(cols[2]))
				elif text == "德國股市":
					data.append(float(cols[1]))
					data.append(float(cols[2]))
				elif text == "道瓊工業":
					data.append(float(cols[1]))
					data.append(float(cols[2]))
				elif text == "NASDAQ":
					data.append(float(cols[1]))
					data.append(float(cols[2]))
				elif re.search("S&P",text):
					data.append(float(cols[1]))
					data.append(float(cols[2]))
				elif text == "羅素3000":
					data.append(float(cols[1]))
					data.append(float(cols[2]))
				elif text == "費城半導體":
					data.append(float(cols[1]))
					data.append(float(cols[2]))
				elif text == "加拿大":
					data.append(float(cols[1]))
					data.append(float(cols[2]))
		table_count = table_count + 1
		
	data.append(date)  
	#print data

def insertDB(conn,date,data):

	c = conn.cursor()
	sql = "INSERT INTO world_stock_history(AS30,AS30d,NYK,NYKd,KOSPI,KOSPId,TWSE,TWSEd,SHCOMP,SHCOMPd,SHAOMP,SHAOMPd,SHBOMP,SHBOMPd,SZASHR,SZASHRd,SZBSHR,SZBSHRd,HSI,HSId,FSSTI,FSSTId,KLCI,KLCId,RTSI,RTSId,UKX,UKXd,CAC,CACd,DAX,DAXd,INDU,INDUd,CCMP,CCMPd,SPX,SPXd,RAY,RAYd,SOX,SOXd,SPTSX,SPTSXd,date) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
	try:
		c.execute(sql,(data[0],data[1],data[2],data[3],data[4],data[5],data[6],data[7],data[8],data[9],data[10],data[11],data[12],data[13],data[14],data[15],data[16],data[17],data[18],data[19],data[20],data[21],data[22],data[23],data[24],data[25],data[26],data[27],data[28],data[29],data[30],data[31],data[32],data[33],data[34],data[35],data[36],data[37],data[38],data[39],data[40],data[41],data[42],data[43],data[44]))
		conn.commit()
	except MySQLdb.Error,e:
		print "Mysql Error %d: %s" % (e.args[0], e.args[1])


conn = None
conn = connectDB()

start = datetime.datetime.strptime("2016-02-01", "%Y-%m-%d")
end = datetime.datetime.strptime("2016-02-15", "%Y-%m-%d")
date_generated = [start + datetime.timedelta(days=x) for x in range(0, (end-start).days)]

for dd in date_generated:
	data = []
	pdate = dd.strftime("%Y-%m-%d")
	print "process date: " + pdate
	getData(pdate,data)
	if len(data)>1:
		insertDB(conn,pdate,data)
	else:
		print "can't get data"
closeDB(conn)
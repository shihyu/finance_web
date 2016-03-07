from yahoo_finance import Share
import MySQLdb
import datetime

def getStockList(conn,list):
	c = conn.cursor()
	sql = "SELECT symbolid FROM stock_list order by id"
	try:
		c.execute(sql)
		res = c.fetchall()
		for record in res:
			list.append(record[0])

	except MySQLdb.Error,e:
		print e

def getStock(id):
	stock = Share(str(id)+'.TW')
	today = datetime.date.today() #todays date
	data = stock.get_historical('2016-01-28', str(today))
	return data

def connectDB():
	try:
		conn = MySQLdb.connect(host="localhost", user="root", passwd="123456qqq", db="finance")
		conn.set_character_set('utf8')
		return conn
	except socket.error as serror:
		if conn is not None:
			conn.close()

def insertDB(conn,data,id):

	c = conn.cursor()
	for row in data:
		if(int(row["Volume"]) > 0):
			sql = "INSERT INTO stock_history(symbolid,open,close,high,low,volume,date) VALUES(%s,%s,%s,%s,%s,%s,%s)"
			try:
				c.execute(sql,(id,row["Open"],row["Close"],row["High"],row["Low"],row["Volume"],row["Date"]))
				conn.commit()
			except MySQLdb.Error,e:
				print "Mysql Error %d: %s" % (e.args[0], e.args[1])
	
def closeDB(conn):
	conn.close()
	
def getAllStock(conn,list):
	for id in list:
		if int(id) > 2352:
			data = getStock(id)
			insertDB(conn,data,id)
			print id + "complete!"
			
conn = None
conn = connectDB()
list = []

getStockList(conn,list)
#getAllStock(conn,list)
print getStock(2353)

closeDB(conn)
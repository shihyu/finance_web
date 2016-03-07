from pprint import pprint
from yahoo_finance import Share

s = Share('1517.TW')

pprint(s.get_price())
pprint(s.get_change())
print float(s.get_volume())/1000
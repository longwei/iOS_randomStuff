import json
from pprint import pprint
import sqlite3;

json_data=open('json_data')

data = json.load(json_data)
# pprint(data['lists'])
json_data.close()
# print type(data['lists'])


conn = sqlite3.connect('topics.sqlite3')
c = conn.cursor()
c.execute('drop table if exists topics_lists')
c.execute('create table topics_lists(lastdetected text, description text, title text, deleted integer, timeofcreation text, itemsorder text, priority integer, numItems integer, lastmodified text, numChecked integer, hidden integer, id integer primary key)')

for entry in data['lists']:
	print [ i for i in entry.values()] 
# 	sql = "insert into topics_lists(lastdetected, description, title, deleted, timeofcreation, itemsorder, priority, numItems, lastmodified, numChecked, hidden, id) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
# 	c.execute(sql, entry.values())
# conn.commit()
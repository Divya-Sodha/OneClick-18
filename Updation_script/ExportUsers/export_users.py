'''
This script is used to download database of users from kolibri server in the Excel sheet.
'''
import sqlite3
from openpyxl import Workbook

conn = sqlite3.connect('db.sqlite3')
c = conn.cursor()
#main_query = "selct"
#query = "select kf.full_name, kf.username from kolibriauth_facilityuser kf left outer join kolibriauth_role kr on kr.user_id == kf.id where kr.user_id is null;"
query = "select kf.full_name, kf.username, kc.name from kolibriauth_facilityuser kf join kolibriauth_membership km on km.user_id == kf.id join kolibriauth_collection kc on kc.id == km.collection_id and kc.kind == 'classroom' order by kc.name asc;"
c.execute(query)
rows = c.fetchall()

print (rows)

wb=Workbook()
filepath="/home/kolibri/Desktop/ExportUsers/studentData.xlsx"

sheet=wb.active

data = []
data = [(row[0],row[1],1,row[2]) for row in rows]

c = ('Full Name', 'Username', 'Password', 'Class Name')

data.insert(0,c)

print(data)

for row in data:
    sheet.append(row)

wb.save(filepath)






import mysql.connector

dataBase = mysql.connector.connect(
    host = 'localhost',
    user = 'root',
    passwd = 'Leewin260905',
    )

cursorObject=dataBase.cursor()

cursorObject.execute("CREATE DATABASE dcrm")
print("alldone")
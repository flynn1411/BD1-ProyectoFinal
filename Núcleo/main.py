# -*- coding: utf-8 -*-

from ConnectionConfig import ConnectionConfig
from MySQLEngine import MySQLEngine
from Login import Login

#config = ConnectionConfig("localhost", "3306", "root", "140403", "BaseA")
config = ConnectionConfig("localhost", "3306", "root", "root", "BaseA")

engine = MySQLEngine(config)


window = Login(engine)
window.login.mainloop()
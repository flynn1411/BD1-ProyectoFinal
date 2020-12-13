# -*- coding: utf-8 -*-
from Core.ConnectionConfig import ConnectionConfig
from Core.MySQLEngine import MySQLEngine
from Core.Login import Login

config = ConnectionConfig("localhost", "3306", "root", "root", "BaseA")
engine = MySQLEngine(config)

window = Login(engine)
window.login.mainloop()
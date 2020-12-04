# -*- coding: utf-8 -*-

from ConnectionConfig import ConnectionConfig
from MySQLEngine import MySQLEngine
from Login import Login

config = ConnectionConfig("localhost", "3306", "root", "140403", "BaseA")
engine = MySQLEngine(config)

Login(engine)


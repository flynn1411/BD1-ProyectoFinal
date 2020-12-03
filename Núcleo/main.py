# -*- coding: utf-8 -*-

from ConnectionConfig import ConnectionConfig
from MySQLEngine import MySQLEngine

config = ConnectionConfig("localhost", "3306", "root", "root", "BaseA")
engine = MySQLEngine(config)

result = engine.generalCallProcedure('Auth',["Gabriel", "123465", '@userID'])
if(result):
    print(result)
else:
    print("Cuenta Inexistente o contraseña incorrecta")



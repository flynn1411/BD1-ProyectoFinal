import mysql.connector
from datetime import date, datetime, timedelta
class MySQLEngine:

    def __init__(self, config):
        self.server = config.server
        self.port = config.port
        self.user = config.user
        self.password = config.password
        self.database = config.database

        self.start()

    def start(self):
        self.con = mysql.connector.connect(
            host = self.server,
            port = self.port,
            user = self.user,
            password = self.password,
            database = self.database
        )

        #versión texto de con
        print("Versión de texto del objeto de conexión a MySQL: %s" % (self.con))

        #Enlace
        self.link = self.con.cursor()
    
    def select(self, query=""):
        self.link.execute(query)

        return self.link.fetchall()

    def generalCallProcedure(self, procedureName, argsList):
        result_args = self.link.callproc(procedureName, argsList)
        return result_args[-1]

    def insertDraw(self, name, userId, drawJson):
        date = datetime.now()
        addDraw = "INSERT INTO Drawing (txt_name, tim_date, accountId, jso_file) VALUES (%s, %s, %s, %s)"
        dataDraw = (name, date, userId, drawJson)

        self.link.execute(addDraw, dataDraw)
        drawID = self.link.lastrowid
        self.con.commit()

        return drawID

    def getDraws(self, userId):
        result = self.select("SELECT Drawing.id, Drawing.txt_name FROM Drawing JOIN Account ON Drawing.accountId=Account.id WHERE Account.id=%s" % userId)
        return result

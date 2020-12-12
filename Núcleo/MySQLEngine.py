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

    def insert(self, tableName, argsList = [], dataElement = ()):
        tupleStr = []
        for _ in range(len(dataElement)):
            tupleStr.append("%s")

        addElement = "INSERT INTO %s (%s) VALUES (%s)" % (tableName, ",".join(argsList), ",".join(tupleStr) )

        self.link.execute(addElement, dataElement)
        elementId = self.link.lastrowid
        self.con.commit()
        return elementId

    def update(self, elementID, tableName, argsList = [], dataList = []):
        updateList = []
        for i in range(len(dataList)):
            updateList.append("%s = %s" % (argsList[i], dataList[i]))

        updateSQL = "UPDATE %s SET %s WHERE id = %s" % (tableName, ",".join(updateList), elementID)
        try:
            self.link.execute(updateSQL)
            self.con.commit()
            return True
        except:
            print("Error durante la actualización")
            return False
        


    def generalCallProcedure(self, procedureName, argsList):
        result_args = self.link.callproc(procedureName, argsList)
        return result_args[-1]

    def insertDraw(self, name, userId, drawJson):
        date = datetime.now()
        drawID =  self.insert(
            'Drawing',  
            ["txt_fileName", "tim_date", "accountId", "jso_file"], 
            (name, date, userId, drawJson)
        )
    
        return drawID

    def getDraws(self, userId):
        result = self.select("SELECT Drawing.id, Drawing.txt_fileName FROM Drawing JOIN Account ON Drawing.accountId=Account.id WHERE Account.id=%s" % userId)
        return result

    def getOperatorUser(self):
        result = self.select("SELECT * FROM OperatorUsers")
        return result

    def getDrawByID(self, drawID):
        result = self.generalCallProcedure("GetDrawingByID_SP", [drawID, '@drawing_json'])
        print(result)
        return result

    def updateDraw(self, drawID, drawJson):
        return self.update(drawID, "Drawing", ["jso_file"], ["'%s'" % drawJson])
        
    def loginUser(self, userAcc, passwordAcc):
        userID = self.generalCallProcedure('Auth_SP',[userAcc, passwordAcc, '@userID'])
        admin = self.generalCallProcedure('GetRole_SP',[userAcc, passwordAcc, '@userID'])

        return (userID, admin)

    def getUserConfig(self,userID):
        return self.select("SELECT * FROM Config WHERE accountId=%s" % userID)[0]

    def updateUserConfigByAdmin(self, configValues):
        self.generalCallProcedure('UpdateConfigByAdmin_SP', configValues)

    def createOperatorUser(self, username, password):
        return self.generalCallProcedure('AddAccount_SP', [username, password, '@exist'])

    def updateOperatorUser(self, userID, username, password):
        return self.generalCallProcedure('UpdateAccount_SP', [userID, username, password, '@exist'])
import tkinter
import tkinter.colorchooser
import tkinter.filedialog
from DrawApp import DrawingApplication
from ConnectionConfig import ConnectionConfig
from MySQLEngine import MySQLEngine
from Encrypt import Encryptor

class Login:
    def __init__(self,engine):
        self.engine = engine
        self.adminState = False
        #Ventana para logear a los usuarios y sus atributos
        self.login = tkinter.Tk()
        self.login.title("Login")
        self.login.geometry("400x200")
        self.login.configure(background = 'white')
        self.login.resizable(0,0)

        #Espacio para ingresar un usuario
        self.userL = tkinter.Label(self.login,text='User: ',font = ('arial',15),bd=5,bg="white")
        self.userL.place(x=90,y=50)
        self.userE = tkinter.Entry(self.login)
        self.userE.place(x=150,y=50,height=30)
        
        #Espacio para ingresar una contraseña
        self.passL = tkinter.Label(self.login,text='Password: ',font = ('arial',15),bd=5,bg="white")
        self.passL.place(x=46,y=100)
        self.passE = tkinter.Entry(self.login,show="*")
        self.passE.place(x=150,y=100,height=30)

        #Boton para ejecutar la verificacion edl usuario 
        self.loginButton = tkinter.Button(self.login,text="LOGIN",cursor='hand2',command=self.getValues).place(x=150,y=150)

        #Loop para que la ventana se mantenga abierta
        self.login.mainloop()


    def getValues(self):

        #obtner los valores de los entry para el usuario y la contraseña 
        userAcc = self.userE.get()
        #passwordAcc =  encryptor.encrypt(self.passE.get(),"root")
        passwordAcc =  self.passE.get()
        
        print(passwordAcc)
        userID = self.engine.generalCallProcedure('Auth',[userAcc, passwordAcc, '@userID'])
        admin = self.engine.generalCallProcedure('GetRole',[userAcc, passwordAcc, '@userID'])

        if userID:
            if admin == "Admin":
                self.adminState = True

            user = {"userId": userID, "username": userAcc}
            self.paint(user)
        else:
            tkinter.messagebox.showinfo(message="El usuario o la contraseña es incorrecta", title="Login error") 
       
    def paint(self, user):

        self.login.withdraw()
        self.login.destroy()
        root = tkinter.Tk()  
        drawingApp = DrawingApplication(root,self.adminState, user,self.engine)  
        drawingApp.mainloop()
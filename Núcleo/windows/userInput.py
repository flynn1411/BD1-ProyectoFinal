import tkinter
import tkinter.colorchooser
import tkinter.filedialog


class UserInput:
    def __init__(self,engine, username, updateWindow,windowType = None):
        self.updateWindow = updateWindow
        self.engine = engine
        self.adminState = False
        self.userInput = tkinter.Tk()
        self.userInput.geometry("400x200")
        self.userInput.configure(background = 'white')
        self.userInput.resizable(0,0)
        self.oldUsername = username
        if(windowType == "signUp"):
            #Ventana para logear a los usuarios y sus atributos
            self.userInput.title("New user")
        else:
            self.userInput.title("Upgrade User")

        #Espacio para ingresar un usuario
        self.userL = tkinter.Label(self.userInput,text='User: ',font = ('arial',15),bd=5,bg="white")
        self.userL.place(x=90,y=50)
        self.userE = tkinter.Entry(self.userInput)
        self.userE.place(x=150,y=50,height=30)
        
        if(windowType == "update"):
            self.userE.insert(0,self.oldUsername)        
        
        #Espacio para ingresar una contraseña
        self.passL = tkinter.Label(self.userInput,text='Password: ',font = ('arial',15),bd=5,bg="white")
        self.passL.place(x=46,y=100)
        self.passE = tkinter.Entry(self.userInput,show="*")
        self.passE.place(x=150,y=100,height=30)


        if(windowType == "signUp"):
            #Boton para ejecutar la verificacion edl usuario 
            self.loginButton = tkinter.Button(self.userInput,text="SING IN",cursor='hand2',command=self.newUser)
        else: 
            self.loginButton = tkinter.Button(self.userInput,text="UPGRADE",cursor='hand2',command=self.updateUser)

        self.loginButton.place(x=150,y=150)
        
        self.userInput.mainloop()

    def newUser(self):

        #obtner los valores de los entry para el usuario y la contraseña 
        userAcc = self.userE.get()
        passwordAcc =  self.passE.get()
       
        exists = self.engine.createOperatorUser(userAcc,passwordAcc)
        print(exists)
        if not exists:
            self.updateWindow()
            self.userInput.destroy()
        else:
            tkinter.messagebox.showinfo(message="El usuario ya existe", title="Sign in error") 

    
    def updateUser(self):

        userAcc = self.userE.get()
        passwordAcc =  self.passE.get()
        usersList = self.engine.getOperatorUser()
        oldID = None
        for userID, username in usersList:
            if username == self.oldUsername:
                oldID = userID
                break


        exist = self.engine.updateOperatorUser(oldID,userAcc,passwordAcc)
        print(exist)
        if not exist:
            self.updateWindow()
            self.userInput.destroy()
        else:
            tkinter.messagebox.showinfo(message="El usuario ya existe", title="Update error") 
            

       

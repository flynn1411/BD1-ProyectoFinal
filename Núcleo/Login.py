import tkinter
import tkinter.colorchooser
import tkinter.filedialog
from DrawApp import DrawingApplication

class Login:
    def __init__(self):
        self.adminState = False
        #Ventana para logear a los usuarios y sus atributos
        self.login = tkinter.Tk()
        self.login.title("Login")
        self.login.geometry("400x200")
        self.login.configure(background = 'white')
        self.login.resizable(0,0)

        #Espacio para ingresar un usuario
        self.userL = tkinter.Label(self.login,text='User',font = ('arial',15),bd=5,bg="white")
        self.userL.place(x=90,y=50)
        self.userE = tkinter.Entry(self.login)
        self.userE.place(x=150,y=50,height=30)
        
        #Espacio para ingresar una contraseña
        self.passL = tkinter.Label(self.login,text='Password',font = ('arial',15),bd=5,bg="white")
        self.passL.place(x=50,y=100)
        self.passE = tkinter.Entry(self.login,show="*")
        self.passE.place(x=150,y=100,height=30)

        #Boton para ejecutar la verificacion edl usuario 
        self.loginButton = tkinter.Button(self.login,text="LOGIN",command=self.getValues).place(x=150,y=150)


        self.login.mainloop()   

    def getValues(self):

        #obtner los valores de los entry para el usuario y la contraseña 
        user = self.userE.get()
        password = self.passE.get()
        test = True

        #auth(user,password)  return [true or false , true or false] 
        #valid,admin = auth(user,password)

        """ 
        if valid:
            if admin:
                self.adminState = False
            paint()
        else:
            messagebox.showinfo(message="El usuario o la contraseña es incorrecta", title="Login error") 
        """

        if test:
            self.adminState = False
            self.paint()
        else:
            tkinter.messagebox.showinfo(message="El usuario o la contraseña es incorrecta", title="Login error")


  
    def paint(self):
        self.login.withdraw()
        root = tkinter.Tk()  
        drawingApp = DrawingApplication(root,self.adminState)  
        drawingApp.mainloop()
        print("Program Execution Completed.")
        
            
if __name__ == "__main__":
    Login()
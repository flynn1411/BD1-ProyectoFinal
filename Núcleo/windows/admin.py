import tkinter
import tkinter.messagebox

class Admin:

    def __init__(self, usersList):

        #Ventana principal
        self.userMgmt = tkinter.Tk()
        self.userMgmt.title("Admin Managment")
        self.userMgmt.geometry("500x700")
        self.userMgmt.resizable(0,0)

        #Label de la tabla de la lista de usuarios
        self.userListLabel = tkinter.Label(self.userMgmt, text = "Operators users", font=('arial', 18, 'bold'))
        self.userListLabel.place(x=50,y=20)

        #Botón para crear nuevos usuarios operadores
        self.addButton = tkinter.Button(self.userMgmt, text="Add", font=('arial', 12), cursor='hand2')
        self.addButton.place(x=370,y=20, width=80)

        #Widget para la lista de usuarios
        self.list = tkinter.Listbox(self.userMgmt, font=('arial', 15))
        self.list.pack(pady=15)
        self.list.place(x=50,y=70,width=400, height=280)
        scrollbar = tkinter.Scrollbar(self.list, orient="vertical")
        scrollbar.config(command=self.list.yview)
        scrollbar.pack(side="right", fill="y")
        self.list.config(yscrollcommand=scrollbar.set)

        for userID, username in usersList:
            print(username)
            self.list.insert(userID, username)

        self.list.bind('<<ListboxSelect>>', self.onselect)

        #label para usuario seleccionado
        self.userLabel = tkinter.Label(self.userMgmt, text = "Selected User:", font=('arial', 12,'bold'))
        self.userLabel.place(x=50,y=370)

        #Label del nombre del actual usuario seleccionado
        self.currentUserLabel = tkinter.Label(self.userMgmt, text = "", font=('arial', 12))
        self.currentUserLabel.place(x=190,y=370)
        
        
        #User admin butons
        self.buttonUpdate = tkinter.Button(self.userMgmt, text="Update", font=('arial', 12), cursor='hand2')
        self.buttonUpdate.place(x=50,y=400, width=80)
        
        self.buttonDelete = tkinter.Button(self.userMgmt, text="Delete", font=('arial', 12), cursor='hand2')
        self.buttonDelete.place(x=150,y=400, width=80)
        

        #Label de la configuración del usuario
        self.userConfigLabel = tkinter.Label(self.userMgmt, text = "User Config", font=('arial', 18, 'bold'))
        self.userConfigLabel.place(x=50,y=455)

        #Input PenColor
        self.penColorLabel = tkinter.Label(self.userMgmt, text = "PenColor: ", font=('arial', 14))
        self.penColorLabel.place(x=100,y=500)
        self.penColorEntry = tkinter.Entry(self.userMgmt, font=('arial',13))
        self.penColorEntry.place(x=200,y=500, height=28 )

        #Input FillColor
        self.fillColorLabel = tkinter.Label(self.userMgmt, text = "FillColor: ", font=('arial', 14))
        self.fillColorLabel.place(x=100,y=535)
        self.fillColorEntry = tkinter.Entry(self.userMgmt, font=('arial',13))
        self.fillColorEntry.place(x=200,y=535, height=28 )

        #Input Radius
        self.radiusLabel = tkinter.Label(self.userMgmt, text = "Radius: ", font=('arial', 14))
        self.radiusLabel.place(x=100,y=570)
        self.radiusEntry = tkinter.Entry(self.userMgmt, font=('arial',13))
        self.radiusEntry.place(x=200,y=570, height=28 )

        #Input Width
        self.widthLabel = tkinter.Label(self.userMgmt, text = "Width: ", font=('arial', 14))
        self.widthLabel.place(x=100,y=605)
        self.widthEntry = tkinter.Entry(self.userMgmt, font=('arial',13))
        self.widthEntry.place(x=200,y=605, height=28 )

        #save config
        self.saveConfigButton = tkinter.Button(self.userMgmt, text="Save Config", font=('arial', 12), cursor='hand2')
        self.saveConfigButton.place(x=185,y=650, width=120)

        self.userMgmt.mainloop() 

    def onselect(self,e):
        w = e.widget
        index = int(w.curselection()[0])
        value = w.get(index)
        self.currentUserLabel.configure(text=value)



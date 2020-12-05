import tkinter
import tkinter.messagebox
class loadFile:

    def __init__(self):

        self.load = tkinter.Tk()
        self.load.title("Cargar Dibujo")
        self.load.geometry("500x500")
        self.load.resizable(0,0)
        #self.load.config(background="#E6E6E6")
        self.nameLabel = tkinter.Label(self.load, text = "Cargar Dibujo", font=('arial', 20))
        self.nameLabel.place(x=50,y=20)

        self.list = tkinter.Listbox(self.load, font=('arial', 15))
        self.list.pack(pady=15)
        self.list.place(x=50,y=70,width=400, height=280)
        scrollbar = tkinter.Scrollbar(self.list, orient="vertical")
        scrollbar.config(command=self.list.yview)
        scrollbar.pack(side="right", fill="y")
        self.list.config(yscrollcommand=scrollbar.set)

        self.drawLabel = tkinter.Label(self.load, text = "Dibujo Seleccionado:", font=('arial', 12,'bold'))
        self.drawLabel.place(x=50,y=370)
        self.currentDrawLabel = tkinter.Label(self.load, text = "", font=('arial', 12))
        self.currentDrawLabel.place(x=230,y=370)
        
        self.list.insert(0, "Dibujo1")
        self.list.insert(1, "Dibujo2")
        self.list.insert(2, "Dibujo3")
        self.list.insert(3, "Dibujo4")

        self.buttonLoad = tkinter.Button(self.load, text="Abrir", font=('arial', 12), cursor='hand2', command=self.loadDraw)
        self.buttonLoad.place(x=50,y=420, width=80)
        
        self.list.bind('<<ListboxSelect>>', self.onselect)
        self.load.mainloop() 

    def onselect(self,e):
        w = e.widget
        index = int(w.curselection()[0])
        value = w.get(index)
        self.currentDrawLabel.configure(text=value)

    def loadDraw(self):
        name = self.currentDrawLabel.cget('text')
        if(name):
            print(name)
            self.load.destroy()
        else:
            tkinter.messagebox.showinfo(message="seleccione un archivo", title="save error") 


loadFile()
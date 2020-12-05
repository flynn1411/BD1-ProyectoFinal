import tkinter
import tkinter.messagebox
class SaveFile:

    def __init__(self):
        self.save = tkinter.Tk()
        self.save.title("Guardar Dibujo")
        self.save.geometry("450x140")
        self.nameLabel = tkinter.Label(self.save, text = "Nombre del Archivo: ", font=('arial', 17))
        self.nameLabel.place(x=20,y=20)
        self.filename = tkinter.Entry(self.save, font=('arial',13))
        self.filename.place(x=245,y=20, height=30 )
        self.buttonSave = tkinter.Button(self.save, text="Guardar", font=('arial', 14), cursor='hand2', command=self.saveDraw)
        self.buttonSave.place(x=170 ,y=70, width=100 )
        self.save.mainloop()

    def saveDraw(self):
        name = self.filename.get()
        if(name):
            self.save.destroy()
        else:
            tkinter.messagebox.showinfo(message="Agrege un nombre de archivo", title="save error") 


SaveFile()



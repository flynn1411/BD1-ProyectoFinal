import tkinter
import tkinter.messagebox

class LoadFile:

    def __init__(self, master, drawList, updateDrawScreen):
        self.update = updateDrawScreen
        self.load = tkinter.Toplevel(master)
        self.load.title("Upload drawings")
        self.load.geometry("500x470")
        self.load.resizable(0,0)
        #self.load.config(background="#E6E6E6")
        self.nameLabel = tkinter.Label(self.load, text = "Upload Drawings", font=('arial', 20))
        self.nameLabel.place(x=50,y=20)

        self.list = tkinter.Listbox(self.load, font=('arial', 15))
        self.list.pack(pady=15)
        self.list.place(x=50,y=70,width=400, height=280)
        scrollbar = tkinter.Scrollbar(self.list, orient="vertical")
        scrollbar.config(command=self.list.yview)
        scrollbar.pack(side="right", fill="y")
        self.list.config(yscrollcommand=scrollbar.set)

        self.drawLabel = tkinter.Label(self.load, text = "Selected Drawing:", font=('arial', 12,'bold'))
        self.drawLabel.place(x=50,y=370)
        self.currentDrawLabel = tkinter.Label(self.load, text = "", font=('arial', 12))
        self.currentDrawLabel.place(x=190,y=370)
        
        self.drawDict = {}
        for drawID, drawName in drawList:    
            self.drawDict[drawName] = drawID
            self.list.insert('end', drawName)

        self.buttonLoad = tkinter.Button(self.load, text="Open", font=('arial', 12), cursor='hand2', command=self.loadDraw)
        self.buttonLoad.place(x=50,y=420, width=80)
        
        self.list.bind('<<ListboxSelect>>', self.onselect)        

    def onselect(self,e):
        w = e.widget
        drawIndex = int(w.curselection()[0])
        value = w.get(drawIndex)
        self.currentDrawLabel.configure(text=value)

    def loadDraw(self):
        name = self.currentDrawLabel.cget('text')
        if(name):
            self.update(self.drawDict[name], name)
            self.load.destroy()

        else:
            tkinter.messagebox.showinfo(message="select a file", title="save error") 
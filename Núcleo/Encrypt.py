class Encryptor:
    def __init__(self):
        pass

    def decrypt(self,encriptedtext,password):
        return self.encrypt(encriptedtext,password)
        
    def encrypt(self,phrase,password): #Toma en cuenta todas las letras de la contraseña
        encripted= []
        c = 0
        for i in bytearray(phrase,'utf-8'):
            encripted.append(chr( i ^ ord(password[c % len (password)])))
            c+=1
        
        return "".join(encripted)
USE BaseA;

/*INSERT INTO Role ( txt_roleName ) VALUES
    ("ADMIN"),
    ("OPERADOR")
;*/

/*INSERT INTO Action ( txt_actionName ) VALUES
    ("VIZUALIZACION"),
    ("MODIFICACION"),
    ("ELIMINACION"),
    ("AUTENTICACION"),
    ("CREACION")
;

INSERT INTO Element ( txt_elementType ) VALUES
    ("DIBUJO"),
    ("CONFIGURACION"),
    ("USUARIO")
;*/

/*TRUNCATE TABLE Account;*/

INSERT INTO Account ( txt_name , txt_password, id_role) VALUES
    ("root", "root",1)
;

INSERT INTO Account ( txt_name , txt_password) VALUES
    ("Gabriel", "1234"),
    ("Fernando", "140403"),
    ("Josue", "hola"),
    ("Caleb", "0000")
;
/*
*/
USE BaseA;

TRUNCATE TABLE Account;

INSERT INTO Account ( txt_name , txt_password, txt_role) VALUES
    ("SoyAdmin", "admin","Admin")
;

INSERT INTO Account ( txt_name , txt_password) VALUES
    ("Gabriel", "1234"),
    ("Fernando", "5678"),
    ("Josue", "hola"),
    ("Caleb", "0000")
;
USE BaseA;

delimiter //

CREATE PROCEDURE Auth (IN username TEXT,IN accPassword TEXT, OUT userID INT)
       BEGIN
         SELECT Account.id INTO userID FROM Account
         WHERE (Account.txt_name = username) AND (Account.txt_password = accPassword) ;
       END//

delimiter ;

CALL Auth("Gabriel", "1234", @userID);

SELECT @userID;


CALL Auth("Josue", "hola", @userID);

SELECT @userID;

CALL Auth("Fernando", "23123", @userID);

SELECT @userID;


/*
Mirar TODOS los Procedimientos almacenados 

SELECT  ROUTINE_CATALOG, ROUTINE_SCHEMA, ROUTINE_NAME, ROUTINE_TYPE  FROM INFORMATION_SCHEMA.ROUTINES
  WHERE ROUTINE_TYPE = 'PROCEDURE';

*/
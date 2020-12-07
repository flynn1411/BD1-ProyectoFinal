USE BaseA;

/*DROP PROCEDURE Auth;*/

delimiter //

CREATE PROCEDURE Auth (IN username TEXT,IN accPassword TEXT, OUT userID INT)
       BEGIN
         SELECT Account.id INTO userID FROM Account
         WHERE (Account.txt_name = username) AND (Account.txt_password = accPassword) ;
       END//
delimiter ;

CALL Auth("Gabriel", "1234", @userID);

SELECT @userID;

delimiter //

/*DROP PROCEDURE GetRole;*/

CREATE PROCEDURE GetRole (IN username TEXT,IN accPassword TEXT, OUT typeAcc CHAR(8))
       BEGIN
         SELECT Role.txt_roleName INTO typeAcc FROM Account JOIN Role ON Account.id_role = Role.id
         WHERE (Account.txt_name = username) AND (Account.txt_password = accPassword) ;
       END//
delimiter ; 

CALL GetRole("Gabriel", "1234", @typeAcc);

SELECT @typeAcc;

/*
Mirar TODOS los Procedimientos almacenados 

SELECT  ROUTINE_CATALOG, ROUTINE_SCHEMA, ROUTINE_NAME, ROUTINE_TYPE  FROM INFORMATION_SCHEMA.ROUTINES
  WHERE ROUTINE_TYPE = 'PROCEDURE';
*/
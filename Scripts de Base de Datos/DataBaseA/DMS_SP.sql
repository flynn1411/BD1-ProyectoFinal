USE BaseA;

DROP PROCEDURE IF EXISTS Auth;
DROP PROCEDURE IF EXISTS GetRole;

delimiter //

CREATE PROCEDURE Auth (IN username TEXT,IN accPassword TEXT, OUT userID INT)
       BEGIN
         SELECT Account.id INTO userID FROM Account
         WHERE (Account.txt_name = username) AND ( BINARY Account.txt_password = accPassword);

         IF userID IS NOT NULL THEN
            INSERT INTO LogBook(accountId, actionId, elementId, tim_recordDate) VALUES(
                userID,
                4,
                3,
                NOW()
              );
          END IF;

       END//
delimiter ;

CALL Auth("Gabriel", "1234", @userID);
CALL Auth("Josue", "hola", @userID);
CALL Auth("Caleb", "0000", @userID);
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
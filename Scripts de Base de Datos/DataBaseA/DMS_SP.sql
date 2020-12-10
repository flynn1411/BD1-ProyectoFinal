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

          COMMIT;

       END//
delimiter ;

delimiter //

/*DROP PROCEDURE GetRole;*/

CREATE PROCEDURE GetRole (IN username TEXT,IN accPassword TEXT, OUT typeAcc CHAR(8))
       BEGIN
         SELECT Role.txt_roleName INTO typeAcc FROM Account JOIN Role ON Account.id_role = Role.id
         WHERE (Account.txt_name = username) AND (Account.txt_password = accPassword) ;
       END//

CREATE PROCEDURE GetDrawingByID (IN drawingID INT, OUT drawing_json JSON)
      BEGIN
        DECLARE drawingName TEXT;
        DECLARE accountID INT;
        
        SELECT jso_file INTO drawing_json FROM Drawing WHERE id = drawingID;        

        IF jso_file IS NOT NULL THEN


          SELECT Drawing.accountId INTO accountID FROM Drawing WHERE id=drawingID;
          SELECT Drawing.txt_fileName INTO drawingName FROM Drawing WHERE id=drawingID;

          INSERT INTO LogBook(accountId, actionId, elementId, txt_elementName, tim_recordDate) VALUES(
                  accountID,
                  1,
                  1,
                  drawingName,
                  NOW()
                );

        END IF;
        
        COMMIT;
      END//

delimiter ; 
/*
Mirar TODOS los Procedimientos almacenados 

SELECT  ROUTINE_CATALOG, ROUTINE_SCHEMA, ROUTINE_NAME, ROUTINE_TYPE  FROM INFORMATION_SCHEMA.ROUTINES
  WHERE ROUTINE_TYPE = 'PROCEDURE';
*/
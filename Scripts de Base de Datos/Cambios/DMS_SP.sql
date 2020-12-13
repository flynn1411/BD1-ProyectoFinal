USE BaseA;

DROP PROCEDURE IF EXISTS Auth_SP;
DROP PROCEDURE IF EXISTS GetRole_SP;
DROP PROCEDURE IF EXISTS CreateDrawing_SP;
DROP PROCEDURE IF EXISTS GetDrawingByID_SP;
DROP PROCEDURE IF EXISTS DeleteDrawingByID_SP;
DROP PROCEDURE IF EXISTS AddAccount_SP;
DROP PROCEDURE IF EXISTS UpdateAccount_SP;
DROP PROCEDURE IF EXISTS DeleteAccountByID_SP;
DROP PROCEDURE IF EXISTS UpdateConfigByAdmin_SP;
DROP PROCEDURE IF EXISTS UpdateConfigByUser_SP;

delimiter //

CREATE PROCEDURE Auth_SP (IN username TEXT,IN accPassword TEXT, OUT userID INT)
       BEGIN
         SELECT Account.id INTO userID FROM Account
         WHERE (BINARY Account.txt_name = HEX(AES_ENCRYPT(username, 'root')) ) AND ( BINARY Account.txt_password = HEX(AES_ENCRYPT(accPassword, 'root')) );

         IF userID IS NOT NULL THEN
            INSERT INTO LogBook(accountId, actionId, elementId, txt_elementName, tim_recordDate) VALUES(
                userID,
                4,
                3,
                CONCAT(username,'-AUTHED'),
                NOW()
              );
          COMMIT;

          END IF;


       END//
delimiter ;

delimiter //

/*DROP PROCEDURE GetRole;*/

CREATE PROCEDURE GetRole_SP (IN username TEXT,IN accPassword TEXT, OUT typeAcc CHAR(8))
       BEGIN
         SELECT AES_DECRYPT(UNHEX(Role.txt_roleName), 'root') INTO typeAcc FROM Account JOIN Role ON Account.id_role = Role.id
         WHERE (BINARY Account.txt_name = HEX(AES_ENCRYPT(username, 'root'))) AND (BINARY Account.txt_password = HEX(AES_ENCRYPT(accPassword, 'root'))) ;
       END//

CREATE PROCEDURE GetDrawingByID_SP (IN drawingID INT, OUT drawing_json JSON)
      BEGIN
        DECLARE drawingName TEXT;
        DECLARE accountID INT;

        SELECT Drawing.jso_file INTO drawing_json FROM Drawing WHERE Drawing.id = drawingID;        

        IF drawing_json IS NOT NULL THEN


          SELECT Drawing.accountId INTO accountID FROM Drawing WHERE id=drawingID;
          SELECT AES_DECRYPT(UNHEX(Drawing.txt_fileName), 'root') INTO drawingName FROM Drawing WHERE id=drawingID;

          INSERT INTO LogBook(accountId, actionId, elementId, txt_elementName, tim_recordDate) VALUES(
                  accountID,
                  1,
                  1,
                  AES_DECRYPT(UNHEX(drawingName), 'root'),
                  NOW()
                );
          COMMIT;

        END IF;
        
      END//


CREATE PROCEDURE CreateDrawing_SP(IN drawingName TEXT, IN userID INT, IN fileContents JSON, OUT exist INT)
      BEGIN
        SELECT Drawing.id INTO exist FROM Drawing WHERE (BINARY Drawing.txt_fileName = drawingName) AND (Drawing.accountId = userID);

        IF exist IS NULL THEN
          INSERT INTO Drawing (txt_fileName, tim_date, accountId, jso_file) VALUES (
            drawingName,
            NOW(),
            userID,
            fileContents
          );

          SELECT Drawing.id INTO exist FROM Drawing WHERE (BINARY Drawing.txt_fileName = HEX(AES_ENCRYPT(drawingName, 'root'))) AND (Drawing.accountId = userID);
          COMMIT;
        ELSE
          SELECT NULL INTO exist;

        END IF;

      END//

CREATE PROCEDURE DeleteDrawingByID_SP(IN drawingID INT)
      BEGIN
        DECLARE drawingExists INT;

        SELECT Drawing.id INTO drawingExists FROM Drawing WHERE BINARY drawingID = Drawing.id;
        
        IF drawingExists IS NOT NULL THEN
          DELETE FROM Drawing
          WHERE Drawing.id = drawingID;
          COMMIT;
        END IF;
        
      END//


CREATE PROCEDURE AddAccount_SP (IN username TEXT, IN accPassword TEXT, OUT valid INT)
      BEGIN
        SELECT Account.id INTO valid FROM Account WHERE (Account.txt_name = HEX(AES_ENCRYPT(username, 'root')) );

        IF valid IS NULL THEN
          INSERT INTO Account(txt_name, txt_password) 
          VALUES
          (
            username,
            accPassword
          );
          COMMIT;
        END IF;

      END//

CREATE PROCEDURE UpdateAccount_SP (IN affectedUser INT, IN username TEXT, IN accPassword TEXT, OUT exist INT)
  BEGIN

    SELECT Account.id INTO exist FROM Account WHERE (Account.txt_name = HEX(AES_ENCRYPT(username, 'root')) );

        IF exist IS NULL THEN
          UPDATE Account SET
            txt_name = username,
            txt_password = accPassword
          WHERE id = affectedUser;

          COMMIT;
        END IF;

    COMMIT;
  END//

CREATE PROCEDURE DeleteAccountByID_SP (IN accountID INT)
      BEGIN
        DECLARE accountExists INT;

        SELECT Account.id INTO accountExists FROM Account WHERE BINARY accountID = Account.id;
        
        IF accountExists IS NOT NULL THEN
          DELETE FROM Account
          WHERE Account.id = accountId;

          COMMIT;
        END IF;    
      END//

CREATE PROCEDURE UpdateConfigByAdmin_SP (IN affectedUserID INT, IN pencolor TEXT, IN fillcolor TEXT, IN radius TEXT, IN width TEXT)
  BEGIN
    DECLARE userName TEXT;

    UPDATE Config SET
      txt_penColor = pencolor,
      txt_fillColor = fillcolor,
      int_radius = radius,
      int_width = width
    WHERE
      accountID = affectedUserID;

    SELECT Account.txt_name INTO userName FROM Account WHERE (BINARY Account.id = affectedUserID);

    INSERT INTO LogBook (accountId, actionId, elementId, txt_elementName, tim_recordDate) VALUES (
      1,
      2,
      2,
      CONCAT(AES_DECRYPT(UNHEX(username), 'root'), '_configFile'),
      NOW()
    );
    COMMIT;
  END//


CREATE PROCEDURE UpdateConfigByUser_SP (IN affectedUserID INT, IN pencolor TEXT, IN fillcolor TEXT, IN radius TEXT, IN width TEXT)
  BEGIN
    UPDATE Config SET
      txt_penColor = pencolor,
      txt_fillColor = fillcolor,
      int_width = width,
      int_radius = radius
    WHERE
      accountID = affectedUserID;

    INSERT INTO LogBook (accountId, actionId, elementId, tim_recordDate) VALUES (
      affectedUserID,
      2,
      2,
      NOW()
    );
    COMMIT;
  END//

delimiter ; 
/*
Mirar TODOS los Procedimientos almacenados 

SELECT  ROUTINE_CATALOG, ROUTINE_SCHEMA, ROUTINE_NAME, ROUTINE_TYPE  FROM INFORMATION_SCHEMA.ROUTINES
  WHERE ROUTINE_TYPE = 'PROCEDURE';
*/
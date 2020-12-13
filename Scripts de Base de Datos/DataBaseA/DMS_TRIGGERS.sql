USE BaseA;

DROP TRIGGER IF EXISTS drawingCreated_trigger;
DROP TRIGGER IF EXISTS drawingModified_trigger;
DROP TRIGGER IF EXISTS drawingDeleted_trigger;
DROP TRIGGER IF EXISTS accountCreated_trigger;
DROP TRIGGER IF EXISTS accountModified_trigger;
DROP TRIGGER IF EXISTS accountDeleted_trigger;


/*Creamos este Trigger para que después que se inserte en la tabla Drawing, registrar cuando un usuario crea 
un dibujo nuevo, de esa forma poder insertar en la tabla LogBook(Bitácora) el id del usuario que creo el dibujo 
así poder identificarlo y además asignándole la fecha y hora actual de creación. */
delimiter $$

CREATE TRIGGER drawingCreated_trigger 
    AFTER INSERT 
    ON Drawing FOR EACH ROW
        BEGIN 
            INSERT INTO LogBook (accountId,actionId, elementId, txt_elementName, tim_recordDate) VALUES 
                (
                    NEW.accountId,
                    5,
                    1,
                    NEW.txt_fileName,
                    NOW()
                );
        END$$

/*delimiter ;        
/*Después que se actualicé, en este caso modiqué un dibujo por el usuario,se guardara en la tabla Drawing dicho cambio, e insertaremos en 
la tabla LogBook(Bitácora) registrando ese cambio, como una modificación. */
/*delimiter $$*/

CREATE TRIGGER drawingModified_trigger
    AFTER UPDATE
    ON Drawing FOR EACH ROW
        BEGIN
            INSERT INTO LogBook (accountId,actionId, elementId, txt_elementName, tim_recordDate) VALUES (
                NEW.accountId,
                2,
                1,
                NEW.txt_fileName,
                NOW()
            );
        END$$

CREATE TRIGGER drawingDeleted_trigger
    BEFORE DELETE
    ON Drawing FOR EACH ROW
        BEGIN
            INSERT INTO LogBook (accountId,actionId, elementId, txt_elementName, tim_recordDate) VALUES (
                1,
                3,
                1,
                OLD.txt_fileName,
                NOW()
            );
        END$$

/*delimiter ;*/

/*delimiter ;
/*Este Trigger lo definimos para que después de que se inserte en Account, registre ciertos 
atributos que hemos definido en la tabla LogBook(Bitácora) para así llevar un registro de algunas acciones del usuario*/
/*delimiter $$*/

CREATE TRIGGER accountCreated_trigger
    AFTER INSERT
    ON Account FOR EACH ROW
        BEGIN
            /*Se crea una archivo config para el usuario*/
            INSERT INTO Config (int_width, int_radius, accountId) VALUES(
                1,
                10,
                NEW.id
                );
                
            /*Se registra que el usuario se creó por parte del único administrador*/
            INSERT INTO LogBook (accountId, actionId, elementId, txt_elementName, tim_recordDate) VALUES
                (
                    1,
                    5,
                    3,
                    NEW.txt_name,
                    NOW()
                );
            /*BASE B*/
             /*Se crea una archivo config para el usuario
            INSERT INTO BaseB.Config (int_width, int_radius, accountId) VALUES(
                1,
                10,
                NEW.id
                );*/
                
           INSERT INTO BaseB.Account SELECT * FROM BaseA.Account WHERE BaseA.Account.id = NEW.id;
        END$$

CREATE TRIGGER accountModified_trigger
    AFTER UPDATE
    ON Account FOR EACH ROW
        BEGIN
            INSERT INTO LogBook (accountId, actionId, elementId, txt_elementName, tim_recordDate) VALUES (
                1,
                2,
                3,
                NEW.txt_name,
                NOW()
            );
        END$$

CREATE TRIGGER accountDeleted_trigger
    BEFORE DELETE
    ON Account FOR EACH ROW
        BEGIN
            INSERT INTO LogBook (accountId,actionId, elementId, txt_elementName, tim_recordDate) VALUES (
                1,
                3,
                3,
                OLD.txt_name,
                NOW()
            );
        END$$

delimiter ;

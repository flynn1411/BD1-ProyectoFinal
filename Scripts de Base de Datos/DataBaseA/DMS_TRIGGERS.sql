/*Creamos este Trigger para que después que se inserte en la tabla Drawing, registrar cuando un usuario crea 
un dibujo nuevo, de esa forma poder insertar en la tabla LogBook(Bitácora) el id del usuario que creo el dibujo 
así poder identificarlo y además asignándole la fecha y hora actual de creación. */
delimiter $$

CREATE TRIGGER drawingCreated_trigger 
    AFTER INSERT 
    ON Drawing FOR EACH ROW
        BEGIN 
            INSERT INTO LogBook (accountId,actionId, elementId,tim_recordDate) VALUES 
                (
                    NEW.accountId,
                    5,
                    1,
                    NOW()
                )$$
        END$$
        
/*Después que se actualicé, en este caso modiqué un dibujo por el usuario,se guardara en la tabla Drawing dicho cambio, e insertaremos en 
la tabla LogBook(Bitácora) registrando ese cambio, como una modificación. */
CREATE TRIGGER drawingModified_trigger
    AFTER UPDATE
    ON Drawing FOR EACH ROW
        BEGIN
            INSERT INTO LogBook () VALUES (
                NEW.accountId,
                2,
                1,
                NOW()
            )$$
        END$$

/*Este Trigger lo creamos para que después que se inserte en la tabla Account, se inserten datos por 
defecto en la tabla Config, cada usuario tendrá su propia configuración y es identificado mediante el id. */
CREATE TRIGGER createConfig_trigger
    AFTER INSERT
    ON Account FOR EACH ROW
        BEGIN
            INSERT INTO Config (int_width, int_radius, accountId) VALUES(
                1,
                10,
                NEW.id
                );
        END$$

/*Este Trigger lo definimos para que después de que se inserte en Account, registre ciertos 
atributos que hemos definido en la tabla LogBook(Bitácora) para así llevar un registro de algunas acciones del usuario*/
CREATE TRIGGER accountCreated_trigger
    AFTER INSERT
    ON Account FOR EACH ROW
        BEGIN
            INSERT INTO LogBook (accountId, actionId, elementId, tim_recordDate) VALUES
                (
                    1,
                    5,
                    3,
                    NOW()
                );
        END$$

delimiter ;

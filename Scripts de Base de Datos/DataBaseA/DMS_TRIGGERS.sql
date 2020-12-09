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
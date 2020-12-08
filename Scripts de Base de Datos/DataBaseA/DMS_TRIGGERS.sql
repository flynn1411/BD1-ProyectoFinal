delimiter $$

CREATE TRIGGER drawing_trigger 
    AFTER INSERT 
    ON Drawing FOR EACH ROW
        BEGIN 
            INSERT INTO LogBook (accountId,actionId, elementId,tim_recordDate) VALUES 
                (
                    NEW.accountId,
                    5,
                    1,
                    NOW()
                );
        END$$

delimiter ;
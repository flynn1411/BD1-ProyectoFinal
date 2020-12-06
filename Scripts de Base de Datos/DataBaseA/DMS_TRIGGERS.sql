CREATE TRIGGER  drawing_trigger 
    AFTER INSERT ON Drawing 
    FOR EACH ROW 
        INSERT INTO LogBook(accountId, tim_recordDate, id_elementId) VALUES(
            NEW.accountId,
            NEW.tim_date,
            1
        );
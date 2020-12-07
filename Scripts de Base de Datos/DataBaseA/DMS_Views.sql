USE BaseA

DROP VIEW IF EXISTS OperatorUsers;

CREATE VIEW OperatorUsers AS
    SELECT
        id,
        txt_name 
    FROM
        Account
    WHERE
        id_role = 2
    ORDER BY
        id ASC
;
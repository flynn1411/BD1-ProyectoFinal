DROP DATABASE IF EXISTS BaseA;
CREATE DATABASE BaseA CHARACTER SET utf8;

USE BaseA;

DROP TABLE IF EXISTS Role;
CREATE TABLE Role(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    txt_roleName CHAR(8) NOT NULL
);

INSERT INTO Role ( txt_roleName ) VALUES
    ("ADMIN"),
    ("OPERADOR")
;

DROP TABLE IF EXISTS Account;

CREATE TABLE Account(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    txt_name TEXT NOT NULL,
    txt_password TEXT NOT NULL,
    id_role INT NOT NULL DEFAULT 2,
    CONSTRAINT fk_id_role FOREIGN KEY (id_role) REFERENCES Role(id)
);

DROP TABLE IF EXISTS Config;

CREATE TABLE Config(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    txt_penColor CHAR(7) DEFAULT "#000000",
    txt_fillColor CHAR(7) DEFAULT "#000000",
    int_width INT DEFAULT 1,
    int_radius INT DEFAULT 10,
    accountId INT NOT NULL,
    CONSTRAINT fk_accountId FOREIGN KEY (accountId) REFERENCES Account(id) 
);

DROP TABLE IF EXISTS Drawing;

CREATE TABLE Drawing(
   id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
   txt_name TEXT,
   tim_date TIMESTAMP NOT NULL,
   accountId INT,
   jso_file JSON,
   CONSTRAINT fk_owner_Id FOREIGN KEY (accountId) REFERENCES Account(id)
);


CREATE TABLE Action(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    txt_actionName CHAR(15) NOT NULL
);
CREATE TABLE Element(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    txt_elementType CHAR(15) NOT NULL

);

DROP TABLE IF EXISTS Record;

CREATE TABLE Record(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    tim_recordDate TIMESTAMP NOT NULL,
    action CHAR(15) NOT NULL,
    txt_elementType CHAR(14) NOT NULL,
    accountId INT NOT NULL,
    actionId INT NOT NULL,
    id_elementId INT NOT NULL,
    CONSTRAINT fk_account_id FOREIGN KEY (accountId) REFERENCES Account(id),
    CONSTRAINT fk_actionId FOREIGN KEY (actionId) REFERENCES Action(id),
    CONSTRAINT fk_id_elementId FOREIGN KEY (id_elementId) REFERENCES Element(id)
);



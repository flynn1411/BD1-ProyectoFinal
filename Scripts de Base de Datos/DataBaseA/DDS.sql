DROP DATABASE IF EXISTS BaseA;
CREATE DATABASE BaseA CHACTER SET utf8;

USE BaseA;

CREATE TABLE Config(
    id INT AUTO_INCREMENT NOT NULL,
    txt_penColor TEXT NOT NULL,
    int_accountId INT NOT NULL,
    int_width INT NOT NULL,
    int_radius INT NOT NULL
);

DROP TABLE IF EXISTS Account;

CREATE TABLE Account(
    id INT AUTO_INCREMENT NOT NULL,
    txt_role TEXT NOT NULL,
    txt_name TEXT NOT NULL,
    txt_password TEXT NOT NULL
);

DROP TABLE IF EXISTS Drawing;

CREATE TABLE Drawing(
   int_accountID INT AUTO_INCREMENT NOT NULL,
   tim_date TIMESTAMP NOT NULL,
   jso_file JSON
);

DROP TABLE IF EXISTS Record;
CREATE TABLE Record(
    
);

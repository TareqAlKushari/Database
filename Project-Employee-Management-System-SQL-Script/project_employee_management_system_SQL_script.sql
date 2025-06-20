CREATE TABLE PROJECT (
    PNO         INTEGER   PRIMARY KEY,
    P_NAME      CHAR(30)  NOT NULL,
    PTYPE       CHAR(20)  NOT NULL,
    DURATION    INTEGER   NOT NULL
    );
DESCRIBE PROJECT;

CREATE TABLE EMPLOYEE (
    PNO              INTEGER  NOT NULL,
    ENO              INTEGER  PRIMARY KEY,
    E_NAME           CHAR(20) NOT NULL,
    QUALIFICATION    CHAR(15) NOT NULL,
    JOINDATE         DATE     NOT NULL,
    FOREIGN KEY (PNO) REFERENCES PROJECT(PNO) ON DELETE CASCADE
    );
    
DESCRIBE EMPLOYEE;

DROP TABLE RELATION cascade constraints;

CREATE TABLE RELATION (
    PNO                 INTEGER   NOT NULL,
    ENO                 INTEGER   NOT NULL,
    START_DATE          DATE      NOT NULL,
    NO_OF_HOUR_WORKED   INTEGER   NOT NULL,
    FOREIGN KEY (PNO) REFERENCES PROJECT(PNO) ON DELETE CASCADE,
    FOREIGN KEY (ENO) REFERENCES EMPLOYEE(ENO) ON DELETE CASCADE
    );
DESCRIBE RELATION;

INSERT INTO PROJECT VALUES(1, 'Inventory Management System', 'MS', 8);
INSERT INTO PROJECT VALUES(2, 'E-commerce Platform', 'WEB', 12);
INSERT INTO PROJECT VALUES(3, 'Student Records Management', 'MS', 9);
INSERT INTO PROJECT VALUES(4, 'College Data Management', 'MS', 20);
INSERT INTO PROJECT VALUES(5, 'Hospital Data Management', 'MS', 11);

SELECT * FROM PROJECT;

INSERT INTO EMPLOYEE VALUES(1, 1, 'Asma', 'Bachelors', SYSDATE);
INSERT INTO EMPLOYEE VALUES(2, 4, 'Mariam', 'Masters', SYSDATE);
INSERT INTO EMPLOYEE VALUES(3, 3, 'Awatf', 'Bachelors', SYSDATE);
INSERT INTO EMPLOYEE VALUES(4, 5, 'Kawthar', 'Masters', SYSDATE);
INSERT INTO EMPLOYEE VALUES(5, 2, 'Aljazi', 'Bachelors', SYSDATE);

SELECT * FROM EMPLOYEE;

INSERT INTO RELATION VALUES(1, 1, (SYSDATE-7), 12);
INSERT INTO RELATION VALUES(2, 4, (SYSDATE-3), 6);
INSERT INTO RELATION VALUES(3, 3, (SYSDATE-5), 8);
INSERT INTO RELATION VALUES(4, 5, (SYSDATE-1), 12);
INSERT INTO RELATION VALUES(5, 2, (SYSDATE-2), 8);

SELECT * FROM RELATION;

SELECT p.P_NAME, e.E_NAME
FROM PROJECT p
INNER JOIN EMPLOYEE e ON p.PNO = e.PNO;

SELECT E_NAME
FROM EMPLOYEE
WHERE E_NAME LIKE 'A%'
ORDER BY E_NAME;

SELECT E_NAME
FROM EMPLOYEE
ORDER BY ENO;

ALTER TABLE PROJECT MODIFY P_NAME VARCHAR(30);

DESCRIBE PROJECT;

UPDATE EMPLOYEE
SET QUALIFICATION = REPLACE(QUALIFICATION, 'Bachelors', 'Masters');

SELECT QUALIFICATION FROM EMPLOYEE;

UPDATE EMPLOYEE
SET E_NAME = CONCAT(UPPER(SUBSTR(E_NAME, 1, 1)), LOWER(SUBSTR(E_NAME, 2)));

SELECT E_NAME FROM EMPLOYEE;

SELECT *
FROM PROJECT
WHERE P_NAME LIKE '%Management%';

DELETE FROM PROJECT
WHERE PNO = (SELECT MAX(PNO) FROM PROJECT);

SELECT * FROM PROJECT;



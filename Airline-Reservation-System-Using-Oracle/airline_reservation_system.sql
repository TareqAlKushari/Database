--1.	Create:  use create statement to create 4 or 5 tables from your schema diagram includes their constraints:

DROP TABLE Customer cascade constraints;

CREATE TABLE Customer (
    Customer_ID    NUMBER   PRIMARY KEY,
    Fname          VARCHAR2(255) NOT NULL,
    Minit          VARCHAR2(255) NOT NULL,
    Lname          VARCHAR2(255) NOT NULL,
    Email          VARCHAR2(255) UNIQUE NOT NULL,
    Phone          VARCHAR2(20) NOT NULL,
    Address        VARCHAR2(255) NOT NULL
    );
    
DESCRIBE Customer;

DROP TABLE Flight cascade constraints;

CREATE TABLE Flight (
    Flight_ID         NUMBER   PRIMARY KEY,
    Flight_Name       VARCHAR2(255) NOT NULL,
    Flight_Number     INTEGER NOT NULL,
    Flight_Duration   NUMBER(10) NOT NULL,
    Departure         DATE NOT NULL,
    Arrival           DATE NOT NULL,
    Airplane_Number   NUMBER(10) NOT NULL
    );

DESCRIBE Flight;

DROP TABLE Reservation cascade constraints;

CREATE TABLE Reservation (
    Reservation_ID    NUMBER   PRIMARY KEY,
    Customer_ID       NUMBER NOT NULL,
    Flight_ID         NUMBER NOT NULL,
    Reserve_Date      DATE NOT NULL,
    Reserve_Type      VARCHAR2(255) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) ON DELETE CASCADE,
    FOREIGN KEY (Flight_ID) REFERENCES Flight(Flight_ID) ON DELETE CASCADE
    );

DESCRIBE Reservation;

DROP TABLE Ticket cascade constraints;

CREATE TABLE Ticket (
    Ticket_ID       NUMBER   PRIMARY KEY,
    Reservation_ID  NUMBER NOT NULL,
    Ticket_Type     VARCHAR2(255) NOT NULL,
    Seat_Number     INTEGER UNIQUE NOT NULL,
    Price           NUMBER(10,2) NOT NULL,
    Ticket_Date     DATE NOT NULL,
    FOREIGN KEY (Reservation_ID) REFERENCES Reservation(Reservation_ID) ON DELETE CASCADE
    );
    
DESCRIBE Ticket;

--ALTER TABLE Reservation ADD CONSTRAINT fk_flight FOREIGN KEY (Flight_ID) REFERENCES Flight (Flight_ID);

--DESCRIBE Reservation;

--2.	Insert: add at least 5 rows for each diagram considering the constraints between two tables:

INSERT INTO Customer VALUES(1, 'Tareq', 'Mohammed', 'Al-Kushari', 'tareq.al.kushari@gmail.com', '773350540', 'Yemen-Sanaa');
INSERT INTO Customer VALUES(2, 'Ammar', 'Ahmad', 'Al-Hashidi', 'ammar.al.hashidi@gmail.com', '774965495', 'Yemen-Sanaa');
INSERT INTO Customer VALUES(3, 'Tah', 'Mohammed', 'Al-Kushari', 'tah.al.kushari@gmail.com', '773350430', 'Yemen-Sanaa');
INSERT INTO Customer VALUES(4, 'Mohammed', 'Aref', 'Al-Sanawi', 'mohammed.al.sanawi@gmail.com', '771137261', 'Yemen-Sanaa');
INSERT INTO Customer VALUES(5, 'Abdulrahman', '##', 'Al-Badawi', 'abdulrahman.al.badawi@gmail.com', '000000000', 'Yemen-Sanaa');

SELECT * FROM Customer;

INSERT INTO Flight VALUES(1, 'Spain', 101, 11, (SYSDATE+1), ((SYSDATE+1)+11/24), 3);
INSERT INTO Flight VALUES(2, 'Spain', 101, 11, (SYSDATE+1), ((SYSDATE+1)+11/24), 3);
INSERT INTO Flight VALUES(3, 'Egyptian', 993, 8, (SYSDATE+1), ((SYSDATE+1)+8/24), 1);
INSERT INTO Flight VALUES(4, 'Egyptian', 993, 8, (SYSDATE+1), ((SYSDATE+1)+8/24), 1);
INSERT INTO Flight VALUES(5, 'Italy', 208, 16, (SYSDATE+1), ((SYSDATE+1)+16/24), 4);
INSERT INTO Flight VALUES(6, 'Egyptian', 999, 8, (SYSDATE+5), ((SYSDATE+5)+8/24), 2);
INSERT INTO Flight VALUES(7, 'Egyptian', 999, 8, (SYSDATE+5), ((SYSDATE+5)+8/24), 2);
INSERT INTO Flight VALUES(8, 'Italy', 209, 16, (SYSDATE+10), ((SYSDATE+10)+16/24), 3);

SELECT * FROM Flight;


--DELETE FROM Reservation;

INSERT INTO Reservation VALUES(1, 1, 1, SYSDATE, 'VIP');
INSERT INTO Reservation VALUES(2, 2, 2, SYSDATE, 'VIP');
INSERT INTO Reservation VALUES(3, 3, 3, SYSDATE, 'Normal');
INSERT INTO Reservation VALUES(4, 4, 4, SYSDATE, 'Normal');
INSERT INTO Reservation VALUES(5, 5, 5, SYSDATE, 'VIP');
INSERT INTO Reservation VALUES(6, 1, 6, SYSDATE, 'Normal');
INSERT INTO Reservation VALUES(7, 2, 7, SYSDATE, 'Normal');
INSERT INTO Reservation VALUES(8, 1, 8, SYSDATE, 'VIP');

SELECT * FROM Reservation;

INSERT INTO Ticket VALUES(1, 1, 'VIP', 41, 800.00, SYSDATE);
INSERT INTO Ticket VALUES(2, 2, 'VIP', 117, 800.00, SYSDATE);
INSERT INTO Ticket VALUES(3, 3, 'Normal', 250, 400.00, SYSDATE);
INSERT INTO Ticket VALUES(4, 4, 'Normal', 270, 400.00, SYSDATE);
INSERT INTO Ticket VALUES(5, 5, 'VIP', 311, 800.00, SYSDATE);
INSERT INTO Ticket VALUES(6, 6, 'Normal', 277, 400.00, SYSDATE);
INSERT INTO Ticket VALUES(7, 7, 'Normal', 283, 400.00, SYSDATE);
INSERT INTO Ticket VALUES(8, 8, 'VIP', 517, 800.00, SYSDATE);

SELECT * FROM Ticket;

select * from Reservation
WHERE customer_id =2 ;

select flight_id from Reservation 
where customer_id = 2;

--3.	Select: use select statement to retrieve the data from each table. Include the following:
--      a.	Retrieve some columns with (alias) 

SELECT Fname AS Name,
        Email My_Email,
        Phone "Phone Number"
FROM Customer;

SELECT flight_name AS Name,
        departure Flight_Date,
        flight_number "Flight Number"
FROM Flight;

SELECT reserve_date AS Reservation_Date,
        reserve_type Reservation_Type,
        customer_id "Customer ID"
FROM Reservation;

SELECT ticket_type AS Type,
        price Ticket_Price,
        seat_number "Seat Number"
FROM Ticket;



--    b. Retrieve some rows using “where” statement include (like statement)

SELECT Fname
FROM Customer
WHERE Fname LIKE 'A%';

SELECT *
FROM Flight
WHERE flight_name LIKE '_p%';

SELECT reservation_id,reserve_type,reserve_date
FROM Reservation
WHERE reserve_type LIKE '%P';

SELECT ticket_id, ticket_type, ticket_date
FROM Ticket
WHERE ticket_type LIKE '%rm%';


--4.	Update: Edit values of some tables data using the update statement (includes where):

UPDATE Customer
SET fname = 'TAREQ', minit = 'MOHAMMED'
WHERE customer_id=1;

UPDATE Flight
SET flight_name = 'SPAIN', flight_duration = flight_duration+2
WHERE flight_id=1;

UPDATE Reservation
SET reserve_type = 'vip'
WHERE customer_id=2;

UPDATE Ticket
SET ticket_type = 'vip', price = price+200
WHERE reservation_id=2;



--5.	delete: delete some rows (includes where):

DELETE FROM Customer 
WHERE customer_id>3;

DELETE FROM Flight
WHERE flight_id>5;

DELETE FROM Reservation
WHERE reservation_id>5;

DELETE FROM Ticket
WHERE ticket_id>5;


--6.	use select statement to show the data after modifying the state of the database:

SELECT * FROM Customer;

SELECT * FROM Flight;

SELECT * FROM Reservation;

SELECT * FROM Ticket;

--7. Using JOIN

-- Create the Students table
CREATE TABLE Students (
  RollNo INT PRIMARY KEY, -- Choose RollNo as the primary key
  NAME VARCHAR(50),
  Address VARCHAR(50),
  Level INT
);

-- Insert some data into the Students table
INSERT INTO Students VALUES
(101, 'Asayel', 'Jeddah', 1),
(102, 'Joud', 'Riyadh', 2),
(103, 'Fatima', 'Dammam', 1),
(104, 'Hassan', 'Taif', 2),
(105, 'Laila', 'Medina', 1);

-- Display all the data from the Students table
SELECT * FROM Students;

-- Create the Subjects table
CREATE TABLE Subjects (
  SCode VARCHAR(10) PRIMARY KEY, -- Choose SCode as the primary key
  SName VARCHAR(30)
);

-- Insert some data into the Subjects table
INSERT INTO Subjects VALUES
('MATH101', 'Mathematics'),
('ENG102', 'English'),
('CS103', 'Computer Science'),
('PYT104', 'Python'),
('DAT105', 'Database');

-- Display all the data from the Subjects table
SELECT * FROM Subjects;

-- Create the relation table
CREATE TABLE Relation (
  RollNo INT,
  SCode VARCHAR(10),
  Marks INT,
  FOREIGN KEY (RollNo) REFERENCES Students(RollNo), -- Define the foreign key constraint for RollNo
  FOREIGN KEY (SCode) REFERENCES Subjects(SCode) -- Define the foreign key constraint for SCode
);

-- Insert some data into the Relation table
INSERT INTO Relation VALUES
(101, 'MATH101', 90),
(101, 'ENG102', 85),
(101, 'CS103', 95),
(102, 'MATH101', 80),
(102, 'PYT104', 75),
(103, 'ENG102', 88),
(103, 'CS103', 92),
(103, 'DAT105', 86),
(104, 'PYT104', 82),
(104, 'DAT105', 79),
(105, 'MATH101', 84),
(105, 'ENG102', 91),
(105, 'CS103', 89);

-- Display all the data from the Relation table
SELECT * FROM Relation;

-- Insert some data into the Subjects table
INSERT INTO Subjects VALUES
('ADM106','Administrative'),
('ARD107','Art & Design');

-- Display all names beginning with the letter 'A' of table two
SELECT SName FROM Subjects
WHERE SName LIKE 'A%';

-- Delete the last record in the third table
DELETE FROM Relation
WHERE RollNo = 105 AND SCode = 'CS103';

-- Show the data of the Relation table
SELECT * FROM Relation;

-- Calculate the highest, lowest and average value of the column marks of table three
SELECT MAX(Marks) AS Highest, MIN(Marks) AS Lowest, AVG(Marks) AS Average FROM Relation;

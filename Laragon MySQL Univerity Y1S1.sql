-- Create database --
CREATE DATABASE university;
USE university;


-- Add in values for tables --

CREATE TABLE Academic (
Acad_ID INT UNSIGNED,
Acad_Title ENUM('Dr', 'Prof', 'Mr', 'Mrs', 'Miss', 'Ms'),
Acad_FName VARCHAR(255) NOT NULL,
Acad_LName 	VARCHAR(255) NOT NULL,
Acad_Position ENUM('Teaching Fellow', 'Lecturer', 'Senior Teaching Fellow', 'Senior Lecturer', 'Reader', 'Professor'),
Acad_Age TINYINT,
Acad_Gender ENUM('M', 'F'),
Acad_Salary DECIMAL (15, 2),
Acad_Office VARCHAR(2),
Acad_Phone VARCHAR(4) DEFAULT '0000',
Acad_Email VARCHAR(255),
Acad_Dept INT UNSIGNED,
CHECK (Acad_Age > 21),
PRIMARY KEY (Acad_ID),
FOREIGN KEY (Acad_Dept) REFERENCES Department (Dept_No));
INSERT INTO Academic VALUES (111111,'Prof', 'Helen', 'Treharne', 'Professor', 45, 'F', 80000.00, '12', '3161', 'h.treharne@surrey.ac.uk', 010);
INSERT INTO Academic VALUES (111112,'Prof', 'Steve', 'Schnieder', 'Professor', 55, 'M', 90000.00, '08', '2357', 's.schneider@surrey.ac.uk', 010);
INSERT INTO Academic VALUES (111113,'Prof', 'Paul', 'Krause', 'Professor', 60, 'M', 100000.00, '32', '8907', 'p.krause@surrey.ac.uk', 010);
INSERT INTO Academic VALUES (111114,'Dr', 'Mark', 'Manulis', 'Reader', 43, 'M', 70000.00, '29', '6058', 'm.manulis@surrey.ac.uk', 010);
INSERT INTO Academic VALUES (111115,'Dr', 'Lee', 'Gillam', 'Reader', 44, 'M', 65000.00, '25', '0000', 'l.gillam@surrey.ac.uk', 010);
INSERT INTO Academic VALUES (111116,'Dr', 'Lilian', 'Tang', 'Reader', 45, 'F', 65000.00, '10', '0000', 'l.gillam@surrey.ac.uk', 010);
INSERT INTO Academic VALUES (111117,'Dr', 'Frank', 'Guerin', 'Senior Lecturer', 38, 'M', 55000.00, '17', '9195', 'f.guerin@surrey.ac.uk', 010);
INSERT INTO Academic VALUES (111118,'Dr', 'Brijesh', 'Dongol', 'Senior Lecturer', 36, 'M', 60000.00, '09', '2233', 'b.dongol@surrey.ac.uk', 010);
INSERT INTO Academic VALUES (111119,'Dr', 'Yunpeng', 'Li', 'Lecturer', 28, 'M', 45000.00, '14', '1324', 'yunpeng.li@surrey.ac.uk', 010);
INSERT INTO Academic VALUES (111120,'Dr', 'Zhenhua', 'Feng', 'Lecturer', 32, 'M', 47000.00, '18', '7845', 'z.feng@surrey.ac.uk', 010);
INSERT INTO Academic VALUES (111121,'Dr', 'Yongxin', 'Yang', 'Lecturer', 29, 'M', 45000.00, '39', '1324', 'yongxin.yang@surrey.ac.uk', 020);
INSERT INTO Academic VALUES (111122,'Dr', 'Stefan', 'Wesemayer', 'Teaching Fellow', 34, 'M', 50000.00, '07', '3632', 's.wesemayer@surrey.ac.uk', 010);
INSERT INTO Academic VALUES (111123,'Dr', 'Joey', 'Lam', 'Teaching Fellow', 30, 'F', 45000.00, '13', '3423', 'j.lam@surrey.ac.uk', 010);
INSERT INTO Academic VALUES (111124,'Dr', 'Mariam', 'Cirovic', 'Teaching Fellow', 35, 'F', 40000.00, '13', '6343', 'm.cirovic@surrey.ac.uk', 010);
INSERT INTO Academic VALUES (111125,'Dr', 'Andrew', 'Crossan', 'Senior Teaching Fellow', 40, 'M', 60000.00, '02', '3399', 'a.crossan@surrey.ac.uk', 010);
INSERT INTO Academic VALUES (111126,'Prof', 'Mark', 'Plumbly', 'Professor', 55, 'M', 120000.00, '03', '9120', 'm.plumbley@surrey.ac.uk', 020);
INSERT INTO Academic VALUES (111127,'Prof', 'David', 'Carey', 'Professor', 54, 'M', 120000.00, '09', '9768', 'david.carey@surrey.ac.uk', 020);
INSERT INTO Academic VALUES (111128,'Prof', 'Justin', 'Read', 'Professor', 60, 'M', 120000.00, '01', '1234', 'j.read@surrey.ac.uk', 030);


CREATE TABLE Qualification (
Academic 	INT UNSIGNED,
Qual_Name 	VARCHAR(255),
PRIMARY KEY(Academic, Qual_Name),
FOREIGN KEY (Academic) REFERENCES Academic(Acad_ID)
ON DELETE CASCADE);
INSERT INTO Qualification VALUES (111111,'PhD');
INSERT INTO Qualification VALUES (111111,'MBCS');
INSERT INTO Qualification VALUES (111112,'PhD');
INSERT INTO Qualification VALUES (111112,'FBCS');
INSERT INTO Qualification VALUES (111113,'PhD');
INSERT INTO Qualification VALUES (111113,'CMath');
INSERT INTO Qualification VALUES (111113,'FIMA');
INSERT INTO Qualification VALUES (111115,'MBCS');
INSERT INTO Qualification VALUES (111125,'MBCS');
INSERT INTO Qualification VALUES (111126,'FIET');
INSERT INTO Qualification VALUES (111126,'FIEEE');
INSERT INTO Qualification VALUES (111127,'CEng');
INSERT INTO Qualification VALUES (111127,'FInstP');
INSERT INTO Qualification VALUES (111127,'FIET');


CREATE TABLE Department (
Dept_No INT UNSIGNED,
Dept_Name VARCHAR(255) NOT NULL,
Dept_Location VARCHAR(5),
HOD INT UNSIGNED,
HOD_Start DATE,
PRIMARY KEY(Dept_No),
UNIQUE (Dept_Name));
INSERT INTO Department VALUES (010, 'Department of Computer Science', 'BB 02', 111114, '2020-08-20');
INSERT INTO Department VALUES (020, 'Department of Electronics and Electrical Engineering', 'BB 01', 111127, '2018-08-20');
INSERT INTO Department VALUES (030, 'Department of Physics', 'BB 03', 111128, '2017-08-20');


CREATE TABLE Admin_Role (
Academic 	INT UNSIGNED,
Role 		ENUM('Director of Learning and Teaching', 'Deputy Director of Learning and Teaching','Director of Research', 'Director of PGR Studies', 'Year Coordinator', 'Exam Officer', 'Chair of Exams Board', 'Head of Research Group', 'Head of Department', 'Director of Centre', 'Deputy Director of Centre', 'Dean', 'Associate Dean', 'Vice Chancellor', 'Deputy Vice Chancellor', 'Pro Vice Chancellor', 'Head of School', 'Programme leader', 'Final Year Project Coordinator'),
PRIMARY KEY 	(Academic, Role),
FOREIGN KEY 	(Academic) REFERENCES Academic(Acad_ID)
);
INSERT INTO Admin_Role VALUES (111111,'Year Coordinator');
INSERT INTO Admin_Role VALUES (111111,'Head of Research Group');
INSERT INTO Admin_Role VALUES (111112,'Year Coordinator');
INSERT INTO Admin_Role VALUES (111113,'Programme leader');
INSERT INTO Admin_Role VALUES (111114,'Head of Department');
INSERT INTO Admin_Role VALUES (111115,'Director of PGR Studies');
INSERT INTO Admin_Role VALUES (111118,'Final Year Project Coordinator');
INSERT INTO Admin_Role VALUES (111119,'Year Coordinator');
INSERT INTO Admin_Role VALUES (111120,'Year Coordinator');
INSERT INTO Admin_Role VALUES (111122,'Year Coordinator');
INSERT INTO Admin_Role VALUES (111122,'Deputy Director of Learning and Teaching');
INSERT INTO Admin_Role VALUES (111123,'Year Coordinator');
INSERT INTO Admin_Role VALUES (111124,'Year Coordinator');
INSERT INTO Admin_Role VALUES (111125,'Director of Learning and Teaching');
INSERT INTO Admin_Role VALUES (111125,'Programme leader');
INSERT INTO Admin_Role VALUES (111126,'Head of School');
INSERT INTO Admin_Role VALUES (111127,'Head of Department');
INSERT INTO Admin_Role VALUES (111128,'Head of Department');


CREATE TABLE Course (
Crs_Code 	INT UNSIGNED NOT NULL,
Crs_Title 	VARCHAR(255) NOT NULL,
Crs_Enrollment INT UNSIGNED,
Crs_Dept	INT UNSIGNED NOT NULL,
Crs_Lead 	INT UNSIGNED UNIQUE,
PRIMARY KEY (Crs_code),
FOREIGN KEY (Crs_Dept) REFERENCES Department (Dept_No)
ON DELETE CASCADE,
FOREIGN KEY (Crs_Lead) REFERENCES Academic (Acad_ID)
ON DELETE RESTRICT);

INSERT INTO Course VALUES 
(100,'BSc Computer Science', 100, 010, 111125),
(101,'BSc Computer Information Technology', 20, 010, 111122),
(200, 'MSc Data Science', 100, 010, 111113),
(201, 'MSc Security', 50, 010, 111112),
(110, 'BEng Electronics', 100, 020, 111127),
(111, 'BEng Electrical Engineering', 100, 020, 111121),
(210, 'MSc Electrical Engineering', 100, 020, 111126),
(211, 'MSc Physics', 100, 020, 111128);


CREATE TABLE Student_Email (
Stu_URN 	INT UNSIGNED NOT NULL,
Stu_Email   VARCHAR(255),
PRIMARY KEY (Stu_URN, Stu_Email),
FOREIGN KEY (Stu_URN) REFERENCES Student(URN)
ON DELETE CASCADE);
INSERT INTO Student_Email VALUES
(612345, 'j.smith@surrey.ac.uk'),
(612345, 'j.smith@gmail.com'),
(612346, 'p.gervais@surrey.ac.uk'),
(612347, 'p.o-Hara@surrey.ac.uk'),
(612348, 'i.ogunsola@surrey.ac.uk'),
(612348, 'iyabo.ogun20@yahoo.com'),
(612349, 'o.sharif@surrey.ac.uk'),
(612350, 'y.guo@surrey.ac.uk');


CREATE TABLE Module(
Mod_Code VARCHAR(50) NOT NULL,
Mod_Title VARCHAR(100),
Mod_Sem VARCHAR(50),
Mod_Type VARCHAR(50),
PRIMARY KEY(Mod_Code));
INSERT INTO Module(Mod_Code, Mod_Title, Mod_Sem, Mod_Type) VALUES 
("COM1031", "COMPUTER LOGIC", "1", "Compulsory"),
("COM1026", "FOUNDATIONS OF COMPUTING", "1", "Compulsory"),
("COM1027", "PROGRAMMING FUNDAMENTALS", "1", "Compulsory"),
("COM1025", "WEB AND DATABASE SYSTEMS", "1", "Compulsory"),
("COM1029", "DATA STRUCTURES AND ALGORITHMS", "2", "Compulsory"),
("COM1033", "FOUNDATIONS OF COMPUTING II", "2", "Compulsory"),
("COM1032", "OPERATING SYSTEMS", "2", "Compulsory"),
("COM1028", "SOFTWARE ENGINEERING", "2", "Core");


CREATE TABLE Module_Assessment(
Mod_Code  VARCHAR(50) NOT NULL,
Assess_No INT,
Assess_Type VARCHAR(50),
Assess_Weight INT,
PRIMARY KEY(Mod_Code, Assess_No),
FOREIGN KEY (Mod_Code) REFERENCES Module(Mod_Code));
INSERT INTO Module_Assessment(Mod_Code, Assess_No, Assess_Type, Assess_Weight) VALUES
("COM1031", "1", "Coursework", "40"),
("COM1031", "2", "Examination", "40"),
("COM1026", "1", "School-timetabled exam/test", "30"),
("COM1026", "2", "Examination", "70"),
("COM1027", "21", "Practical based assessment", "20"),
("COM1027", "2", "Practical based assessment", "20"),
("COM1027", "3", "Coursework", "20"),
("COM1025", "1", "School-timetabled exam/test", "30"),
("COM1025", "2", "Coursework", "70");


CREATE TABLE Module_Text(
Mod_Code  VARCHAR(50) NOT NULL,
Mod_Text VARCHAR(255),
PRIMARY KEY(Mod_Code, Mod_Text),
FOREIGN KEY (Mod_Code) REFERENCES Module(Mod_Code));
INSERT INTO Module_Text(Mod_Code, Mod_Text) VALUES
("COM1025", "Database principles : fundamentals of design, implementation, and management."),
("COM1025", "Head first PHP & MySQL"),
("COM1026", "Discrete mathematics for computing"),
("COM1026", "The B-method: an introduction"),
("COM1027", "Java: a beginner's guide / Herbert Schildt"),
("COM1027", "The elements of Java style"),
("COM1031", "Digital design and computer architecture [electronic resource]"),
("COM1031", "Digital Design and Computer Architecture: ARM Edition");


CREATE TABLE BCS_Member (
Memb_NO 	INT UNSIGNED NOT NULL,
Memb_Title 	ENUM('Dr', 'Prof', 'Mr', 'Mrs', 'Miss', 'Ms'),
Memb_FName 	VARCHAR(255) NOT NULL,
Memb_LName 	VARCHAR(255) NOT NULL,
Memb_Type 	ENUM('Student', 'Professional', 'Fellow', 'Associate'),
Memb_Gender 	ENUM('M', 'F'),
Memb_Email 	VARCHAR(255) NOT NULL,
Memb_Affil VARCHAR(255) NOT NULL,
PRIMARY KEY (Memb_NO));
INSERT INTO BCS_Member VALUES
(101, 'Prof', 'Helen', 'Treharne', 'Fellow', 'F', 'h.treharne@surrey.ac.uk', 'University of Surrey'),
(102, 'Prof', 'Steve', 'Schnieder', 'Fellow', 'M', 's.schneider@surrey.ac.uk', 'University of Surrey'),
(103, 'Prof', 'David', 'Carey', 'Fellow', 'M', 'david.carey@surrey.ac.uk', 'University of Surrey'),
(104, 'Dr', 'Lee', 'Gillam', 'Professional', 'M', 'l.gillam@surrey.ac.uk', 'University of Surrey'),
(105, 'Dr', 'Mariam', 'Cirovic', 'Associate', 'F', 'm.cirovic@surrey.ac.uk', 'University of Surrey'),
(106, 'Dr', 'Yongxin', 'Yang', 'Associate', 'M', 'yongxin.yang@surrey.ac.uk', 'University of Surrey'),
(107, 'Dr', 'Frank', 'Guerin', 'Professional', 'M', 'f.guerin@surrey.ac.uk', 'University of Surrey'),
(108, 'Mr', 'Costas', 'Spiliotis', 'Student', 'M', 'c.spiliotis@surrey.ac.uk', 'University of Surrey'),
(109, 'Mr','Patrick', 'O-Hara', 'Student', 'M', 'p.o-hara@surrey.ac.uk', 'University of Surrey'),
(110, 'Miss', 'Yunli', 'Guo', 'Student', 'F', 'y.guo@surrey.ac.uk', 'University of Surrey'),
(111, 'Miss', 'Sue', 'Smith', 'Student', 'F', 'sue.smith@surrey.ac.uk', 'University of Surrey'),
(112, 'Mr', 'Jack', 'Ball', 'Student', 'M', 'j.ball@southampton.ac.uk', 'University of Southampton'),
(113, 'Dr', 'Simon', 'Reeve','Fellow', 'M', 's.reeve@southampton.ac.uk', 'University of Southampton'),
(114, 'Dr', 'Sarah', 'Graham', 'Professional', 'F', 's.graham@ucl.ac.uk', 'UCL'),
(115, 'Miss', 'Aisha', 'Ahmed', 'Student', 'F', 'a.ahmed@ucl.ac.uk', 'UCL');

------- SQL QUERIES -------

-- SQL JOIN Practice --

/*Converting a WHERE clause into a JOIN clause*/
SELECT CONCAT_WS(' ', Acad_FName, Acad_LName) AS 'Full Name'
FROM Academic, Admin_Role
WHERE (Academic.Acad_ID = Admin_Role.Academic) AND Admin_Role.Role = 'Head of Department';

SELECT CONCAT (Acad_FName, ' ', Acad_LName) AS 'Full Name'
FROM Academic
INNER JOIN Admin_Role
ON Academic.Acad_ID = Admin_Role.Academic
WHERE Admin_Role.Role = 'Head of Department';

-- The CONCAT() function combines the given 
-- values without any separator while the CONCAT_WS()
-- function combines them according to the specified 
-- separator

-- Let’s say we want to retrieve the names of all the Academics
-- and for those who have admin roles, then the admin roles as well. We need to do a LEFT OUTER JOIN
-- here, with the Academic table on the left of the JOIN clause and the Admin_Role table on the Right
-- of the JOIN clause. It is a LEFT OUTER JOIN because there will be some rows that do not match in the
-- right table because not all Academics have Admin Roles. So, we want to list ALL the Academics and
-- include the admin roles for those that have them.

SELECT CONCAT (Acad_FName, ' ', Acad_LName) AS 'Full Name', Admin_Role.Role 
FROM Academic 
LEFT OUTER JOIN Admin_Role 
ON Academic.Acad_ID = Admin_Role.Academic;


-- You can use the following subquery to get the name of the academic who is director of Teaching and
-- Learning:
SELECT CONCAT (Acad_FName, ' ', Acad_LName) AS 'Academic Name' 
FROM Academic WHERE Acad_ID = 
(Select Academic FROM Admin_Role WHERE Role = "Director of Learning and Teaching");

-- Give Mark Plumbly a pay rise
UPDATE Academic 
SET Acad_Salary = 150000.00 
WHERE Acad_LName = "Plumbly";

-- Find the Admin Role of the Academic that has the highest salary
SELECT Role FROM Admin_Role 
WHERE Academic = (SELECT Acad_ID FROM Academic 
WHERE Acad_Salary = (SELECT MAX(Acad_Salary) FROM Academic));


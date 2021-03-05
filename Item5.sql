-- Christopher Shane Lynn
-- CISS 202 DEA Introduction to Databases
-- Dropbox08 – Case Study (Item5)
-- 02/28/2021

--Start. Please run item 4 to create the dataase before running item 5.  
--This command connects to the correct database before running these items.
USE PLS;
GO

--Q1.  Insert a family with one guardian and two children
INSERT INTO Customer.Family (LastNameCh, HomePhone, CellPhone, Email, HomeAddress, HomeCity, HomeState, HomeZip)
	VALUES ('Chen', '2021112233', '2021112234', 'chen1234@gmail.com', '101 Chinaberry St', 'Peking', 'OH', '50505');
INSERT INTO Customer.Guardian (FirstName, LastName, HomePhone, CellPhone, Email, FamilyId)
	VALUES ('Li', 'Major', '2021212134', '2021212134', 'li1234@gmail.com', 1);
INSERT INTO Customer.Student (FirstName, LastName, Gender, Relationship, BirthDate, FamilyId)
	VALUES ('Alice', 'Chen', 'Female', 'Daughter', '20101010', 1), ('Tom', 'Chen', 'Male', 'Son', '20120922', 1);

--Q2.	Insert one instructor and two courses taught by that instructor
INSERT INTO School.Instructor (FirstName, LastName, HomePhone, CellPhone, Email, Contact, HireDate)
	VALUES ('Bruce', 'Lee', '2021231234', '2021241222', 'brucelee123@gmail.com', 'Anna Lee', '20170104');
INSERT INTO School.Course (Title, MeetDay, MeetTime, StartDate, EndDate, SeatCap, InstructorId)
	VALUES ('Kong Fu Step 1', 'Saturdays', '5:00-5:30PM', '20170701', '20170801', 10, 1),
			('Chinese Classic Music 1', 'Sundays', '5:30-6:00PM', '20170701', '20170801', 15, 1);

--Q3.	Enroll students to classes.  Enroll Alice to Bruce Lee's KongFu Step 1 (CourseId 1) and Chinese Classic Music (CourseId 2)
--		Next, enroll Tom to Bruce Lee's Chinese Classic Music 1 (CourseId 2)
INSERT INTO Customer.Enrollment (StudentId, CourseId)
	VALUES (1, 1), (1, 2), (2, 2); 

--Q4.	Display all students who enrolled in a specific course.  Display all the students from Chinese Classic Music 1 (CourseId 2)
SELECT Student.StudentId, Student.FirstName + ' ' + Student.LastName AS "Student Name", Course.Title
FROM Customer.Student JOIN Customer.Enrollment
	ON Student.StudentId = Enrollment.StudentId
		JOIN School.Course 
		ON Enrollment.CourseId = Course.CourseId
WHERE Course.CourseId = 2;

--Q5.	Assign grades to students who enrolled in a course.  Show those in Chinese Classic Music, Alice (StudentId 1) A, Tom (StudentId 2) C
UPDATE Customer.Enrollment
	SET Grade = 'A'
	WHERE StudentId = 1 AND CourseId = 2;
UPDATE Customer.Enrollment
	SET Grade = 'C'
	WHERE StudentId = 2 AND CourseId = 2;

--Q6.	Display total number of students enrolled in a specific course
--		Show the students registered for Chinese Classic Music (CourseId 2)
SELECT COUNT(*) AS "Number of students in Chinese Classic Music"
FROM Customer.Enrollment
WHERE CourseId = 2;

--Show the tables after all of the updates.
SELECT *
FROM Customer.Family;

SELECT *
FROM Customer.Guardian;

SELECT *
FROM Customer.Student;

SELECT *
FROM School.Instructor;

SELECT *
FROM School.Course;

SELECT *
FROM Customer.Enrollment;


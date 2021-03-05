-- Christopher Shane Lynn
-- CISS 202 DEA Introduction to Databases
-- Dropbox08 – Case Study (Item4)
-- 02/28/2021

--Create the physical design of the database for the Panda Language School

--Connect to the master database for initial setup
USE master;

--Setup a check to drop the database if it already exists to avoid errors
IF DB_ID(N'PLS') IS NOT NULL DROP DATABASE PLS;

--Create the new database for PLS
CREATE DATABASE PLS;
GO

--Connect to the new database
USE PLS;
GO

--Create the containers (schemas) for each of the tables
CREATE SCHEMA Customer AUTHORIZATION dbo;
GO
CREATE SCHEMA School AUTHORIZATION dbo;
GO

--Create the table that holds family data
CREATE TABLE Customer.Family
(
	FamilyId		INT				NOT NULL	IDENTITY,
	LastNameCh		NVARCHAR(25)	NOT NULL,
	HomePhone		NVARCHAR(15)	NOT NULL,						
	CellPhone		NVARCHAR(15)	NULL,						
	Email			NVARCHAR(50)	NOT NULL,					
	HomeAddress		NVARCHAR(50)	NULL,
	HomeCity		NVARCHAR(25)	NULL,
	HomeState		NVARCHAR(20)	NULL,
	HomeZip			NVARCHAR(10)	NULL,
	CONSTRAINT PK_Family PRIMARY KEY (FamilyId)
);

--Create the table that holds guardian data
CREATE TABLE Customer.Guardian
(
	GuardianId		INT				NOT NULL	IDENTITY,
	FirstName		NVARCHAR(25)	NOT NULL,
	LastName		NVARCHAR(25)	NOT NULL,
	HomePhone		NVARCHAR(15)	NOT NULL,						
	CellPhone		NVARCHAR(15)	NULL,						
	Email			NVARCHAR(50)	NOT NULL,					
	HomeAddress		NVARCHAR(50)	NULL,
	HomeCity		NVARCHAR(25)	NULL,
	HomeState		NVARCHAR(20)	NULL,
	HomeZip			NVARCHAR(10)	NULL,
	FamilyId		INT				NOT NULL,
	CONSTRAINT PK_Guardian PRIMARY KEY (GuardianId),
	CONSTRAINT FK_Guardian_Family FOREIGN KEY (FamilyId) REFERENCES Customer.Family (FamilyId)
);

--Create the table that holds student data
CREATE TABLE Customer.Student
(
	StudentId		INT				NOT NULL	IDENTITY,
	FirstName		NVARCHAR(25)	NOT NULL,
	LastName		NVARCHAR(25)	NOT NULL,
	Gender			NVARCHAR(15)	NULL,
	Relationship	NVARCHAR(15)	NOT NULL,
	HomePhone		NVARCHAR(15)	NULL,						
	CellPhone		NVARCHAR(15)	NULL,						
	Email			NVARCHAR(50)	NULL,					
	BirthDate		DATE			NOT NULL,
	Note			NVARCHAR(1000)	NULL,					
	FamilyId		INT				NOT NULL,
	CONSTRAINT PK_Student PRIMARY KEY (StudentId),
	CONSTRAINT FK_Student_Family FOREIGN KEY (FamilyId) REFERENCES Customer.Family (FamilyId)
);

--Create the table that holds instructor data
CREATE TABLE School.Instructor
(
	InstructorId	INT				NOT NULL	IDENTITY,
	FirstName		NVARCHAR(25)	NOT NULL,
	LastName		NVARCHAR(25)	NOT NULL,
	HomeAddress		NVARCHAR(50)	NULL,
	HomeCity		NVARCHAR(25)	NULL,
	HomeState		NVARCHAR(20)	NULL,
	HomeZip			NVARCHAR(10)	NULL,
	HomePhone		NVARCHAR(15)	NOT NULL,						
	CellPhone		NVARCHAR(15)	NULL,						
	Email			NVARCHAR(50)	NOT NULL,
	Contact			NVARCHAR(20)	NOT NULL,
	HireDate		DATE			NOT NULL,
	[Type]			NVARCHAR(10)	NULL,
	CONSTRAINT PK_Instructor PRIMARY KEY (InstructorId)
);

--Create the table that holds course data
CREATE TABLE School.Course
(
	CourseId		INT				NOT NULL	IDENTITY,
	Title			NVARCHAR(50)	NOT NULL,
	MeetDay			NVARCHAR(30)	NULL,
	MeetTime		NVARCHAR(30)	NULL,
	StartDate		DATE			NULL,
	EndDate			DATE			NULL,
	SeatCap			INT				NULL,
	InstructorId	INT				NULL,						
	CONSTRAINT PK_Course PRIMARY KEY (CourseId),
	CONSTRAINT FK_Course_Instructor FOREIGN KEY (InstructorId) REFERENCES School.Instructor (InstructorId),
	CONSTRAINT CHK_StartEndDate CHECK (StartDate < EndDate)

);


--Create the table that holds enrollment data
CREATE TABLE Customer.Enrollment
(
	EnrollId		INT				NOT NULL	IDENTITY,
	Grade			NCHAR(1)		NULL,
	StudentId		INT				NOT NULL,					
	CourseId		INT				NOT NULL,
	CONSTRAINT PK_Enrollment PRIMARY KEY (EnrollId),
	CONSTRAINT FK_Enrollment_Student FOREIGN KEY (StudentId) REFERENCES Customer.Student (StudentId),
	CONSTRAINT FK_Enrollment_Course FOREIGN KEY (CourseId) REFERENCES School.Course (CourseId)
);

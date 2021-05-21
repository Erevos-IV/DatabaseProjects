-- Creating a college database.
-- Considering i have been given to create a database for my college without putting any record inside.
-- Designing and Creating the database.


CREATE DATABASE College;
USE College;

CREATE TABLE Programs(
	ProgramID INT  NOT NULL AUTO_INCREMENT,
    Title VARCHAR(40) NOT NULL, 
    Duration VARCHAR(10) NOT NULL, 
    Description TEXT NOT NULL,
    
    PRIMARY KEY(ProgramID)


) AUTO_INCREMENT =100 ENGINE = InnoDB;


CREATE TABLE Students(
	-- This should be The students id card.
	StudentID VARCHAR(25) NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    -- A student could be from different country example (+30) 1234567890
    Phone INT(15) NOT NULL,
    E_Mail VARCHAR(25) NOT NULL,
    ProgramID INT NOT NULL,
    SignDate DATE NOT NULL,
    
    PRIMARY KEY(StudentID),
    FOREIGN KEY(ProgramID) REFERENCES Programs(ProgramID)
	
) AUTO_INCREMENT = 100 ENGINE = InnoDB;

CREATE TABLE Offices(
	OfficeID INT NOT NULL AUTO_INCREMENT,
    Title VARCHAR(40) NOT NULL,
    Country VARCHAR(40) NOT NULL,
    City VARCHAR(40) NOT NULL,
    Address VARCHAR(40) NOT NULL,
    Phone INT NOT NULL,
    
    PRIMARY KEY(OfficeID)
) AUTO_INCREMENT = 100 ENGINE = InnoDB;

CREATE TABLE Specialities(
	SpecialityID INT NOT NULL AUTO_INCREMENT,
    Title VARCHAR(40) NOT NULL,
    Description TEXT NOT NULL,
    
	PRIMARY KEY(SpecialityID)
) AUTO_INCREMENT = 100 ENGINE = InnoDB;

CREATE TABLE Semesters(
	SemesterID INT(2) NOT NULL AUTO_INCREMENT,
    Title VARCHAR(15) NOT NULL,
    StartingDate DATE NOT NULL,
    EndingDate DATE NOT NULL,
    
    PRIMARY KEY(SemesterID)
);

CREATE TABLE Exams(
	ExamID INT NOT NULL AUTO_INCREMENT,
    SemesterID INT(2) NOT NULL,
    ExamDate DATE NOT NULL,
    ProgramID  INT NOT NULL,
    
    PRIMARY KEY(ExamID),
    FOREIGN KEY(SemesterID) REFERENCES Semesters(SemesterID),
    FOREIGN KEY(ProgramID) REFERENCES Programs(ProgramID)
);

CREATE TABLE ExamDetails(
	EDID INT NOT NULL AUTO_INCREMENT,
    ExamID INT NOT NULL,
    StudentID VARCHAR(25) NOT NULL,
    Grade FLOAT NOT NULL,
    
    PRIMARY KEY(EDID),
    FOREIGN KEY(ExamID) REFERENCES Exams(ExamID),
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID)
) AUTO_INCREMENT = 100 ENGINE = InnoDB;

CREATE TABLE Employees(
	-- EmployeeID should be their ID card number.
	EmployeeID VARCHAR(25) NOT NULL ,
    FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
    Phone INT(15) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    HireDate DATE NOT NULL,
    SpecialityID INT NOT NULL,
    Salary FLOAT NOT NULL,
    ReportsTo VARCHAR(50) NOT NULL,
    OfficeID INT NOT NULL,
    
    PRIMARY KEY(EmployeeID),
    FOREIGN KEY(SpecialityID) REFERENCES Specialities(SpecialityID),
    FOREIGN KEY(OfficeID) REFERENCES Offices(OfficeID)

) ENGINE = InnoDB;

CREATE TABLE Payments(
	PaymentID INT NOT NULL AUTO_INCREMENT,
    StudentID VARCHAR(25) NOT NULL,
    PaymentDate DATE NOT NULL,
	TotalAmount FLOAT NOT NULL,
    PaymentTypeID INT NOT NULL,
    
    PRIMARY KEY(PaymentID),
    FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY(PaymentTypeID) REFERENCES PaymentTypes(PaymentTypeID)
 ) ENGINE = InnoDB;
 
 CREATE TABLE PaymentTypes(
	PaymentTypeID INT NOT NULL AUTO_INCREMENT,
    -- Could be a Card or Cash
    Title VARCHAR(15) NOT NULL,
 
	PRIMARY KEY(PaymentTypeID)
 ) ENGINE = InnoDB;
 

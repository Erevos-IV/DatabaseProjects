-- Creating the database
CREATE DATABASE Hospital;
USE Hospital;

-- Creating the tables.
CREATE TABLE Employees(
	EmployeeID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    GenderID INT NOT NULL,
    City VARCHAR(25) NOT NULL,
    Address VARCHAR(25) NOT NULL,
    TypeID INT NOT NULL,
    DepartmentID INT NOT NULL,
    PRIMARY KEY(EmployeeID),
    FOREIGN KEY(TypeID) REFERENCES EmployeeTypes(TypeID),
	FOREIGN KEY(DepartmentID) REFERENCES Departments(DepartmentID),
    FOREIGN KEY(GenderID) REFERENCES Genders(GenderID)
    
);

-- Doctors, Nurses, Secretaries, Managers and more.
CREATE TABLE EmployeeTypes(
	TypeID INT NOT NULL AUTO_INCREMENT,
    Title VARCHAR(50) NOT NULL,
    PRIMARY KEY(TypeID)
);

-- The departments of the hospital
CREATE TABLE Departments(
	DepartmentID INT NOT NULL AUTO_INCREMENT,
    Name VARCHAR(45) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Address VARCHAR(50) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Email VARCHAR(35) NOT NULL,
    
    PRIMARY KEY(DepartmentID)
);

-- Creating the table for patients.
CREATE TABLE Patients(
	PatientID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Phone VARCHAR(50) NOT NULL,
    -- Unique number used to identify people.
    AMKA INT(10) NOT NULL,
    DateOfBirth DATETIME NOT NULL,
    GenderID INT NOT NULL,
    
    PRIMARY KEY(PatientID),
    FOREIGN KEY(GenderID) REFERENCES Genders(GenderID)
);

-- Creating the table for appointments.
CREATE TABLE Appointments(
	AppID INT NOT NULL AUTO_INCREMENT,
    PatientID  INT NOT NULL,
    DateOfAppointment DATE NOT NULL,
    EmployeeID INT NOT NULL,
    -- Comments will be used to write the reason.
    Comments TEXT NOT NULL,
    
    PRIMARY KEY(AppID),
    FOREIGN KEY(PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY(EmployeeID) REFERENCES Employees(EmployeeID)
    
);

-- Creating the table of genres. 
CREATE TABLE Genders(
	GenderID INT NOT NULL AUTO_INCREMENT,
    GenderTitle VARCHAR(25) NOT NULL,
    Comments TEXT,
    
    PRIMARY KEY(GenderID)
);

-- Emergency circumstances (Calls).
CREATE TABLE EmergencyCircumstance(
	ECID INT NOT NULL AUTO_INCREMENT,
    PatientID INT NOT NULL,
    EmployeeID INT NOT NULL,
    DepartmentID INT NOT NULL,
    DateOfOccurance DATETIME NOT NULL,
    Description TEXT NOT NULL,
    
    PRIMARY KEY(ECID),
    FOREIGN KEY(PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY(EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY(DepartmentID) REFERENCES Departments(DepartmentID)
);
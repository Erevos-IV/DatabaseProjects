-- Creating basic Stored Procedures to get basic information.
-- Using the College database.

USE college;

-- Getting every student.
DELIMITER //
CREATE PROCEDURE GetAllStudents()
	Begin
    SELECT *
    FROM Students;
    
    end //
DELIMITER ;

CALL GetAllStudents();

-- Getting every employee.
DELIMITER //
CREATE PROCEDURE GetAllEmployees()
	BEGIN
    
    SELECT * 
    FROM Employees;
    
    END //
DELIMITER ;

CALL GetAllEmployees();


-- Getting Every Study Program.

DELIMITER //
CREATE PROCEDURE GetAllPrograms()
	BEGIN
    
    SELECT * 
    FROM Programs;
    
    END //
DELIMITER ;

CALL GetAllPrograms();


-- Getting Employees Per Given Office.
DELIMITER //
CREATE PROCEDURE GetEmployeesPerOffice(IN OfficeName VARCHAR(35))
	BEGIN
    SELECT emp.EmployeeID, CONCAT(emp.FirstName, ' ' ,emp.LastName) AS FullName, emp.Phone, emp.Email, emp.ReportsTo, offi.Title
    FROM employees AS emp INNER JOIN Offices as offi USING(OfficeID)
    WHERE offi.Title = OfficeName;
    END //
DELIMITER ;

CALL GetEMployeesPerOffice('Sales');



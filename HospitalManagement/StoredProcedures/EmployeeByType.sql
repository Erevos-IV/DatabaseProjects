-- Using the Hospital Database.
USE Hospital;

-- Procedure to get every employee by their type (etc. Doctors, Secretaties, Nurses).
DELIMITER //
CREATE PROCEDURE EmployeeByType(IN WhatType VARCHAR(50))
	BEGIN
    
    SELECT emp.EmployeeID, CONCAT(emp.FirstName, ' ', emp.LastName) AS 'Full Name', emp.Age, emp.City, emp.Address, dep.Name AS Department
    FROM employees AS emp
    INNER JOIN departments AS dep USING(DepartmentID)
    INNER JOIN employeetypes AS empt
    WHERE empt.Title = WhatType
    ORDER BY emp.EmployeeID;
    
    END //
DELIMITER ;

-- Calling the procedure
CALL EmployeeByType('Nurse');

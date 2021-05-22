-- Using the Hospital Database.
USE Hospital;

-- Procedure to get every employee.
DELIMITER //
CREATE PROCEDURE EmployeeReport()
	BEGIN
    
    SELECT emp.EmployeeID, CONCAT(emp.FirstName, ' ', emp.LastName) AS 'Full Name', emp.Age, gen.GenderTitle, emp.City, emp.Address, dep.Name
    FROM employees AS emp
    INNER JOIN genders AS gen USING(GenderID)
    INNER JOIN departments AS dep USING(DepartmentID)
    ORDER BY dep.Name, emp.EmployeeID;
    
    END //
DELIMITER ;

-- Calling the procedure
CALL EmployeeReport();
-- Using College Database
USE college;

-- This procedure will give us a full report of all employees ordered by Office.
DELIMITER //
CREATE PROCEDURE EmployeeReport()
	BEGIN
    
    SELECT emp.EmployeeID, CONCAT(emp.FirstName, ' ', emp.LastName) AS FullName, emp.Phone, emp.Email, emp.HireDate, spe.Title, emp.ReportsTo, off.OfficeID
    FROM employees AS emp
    INNER JOIN offices AS off USING(OfficeID)
    INNER JOIN specialities AS spe USING(SpecialityID)
    ORDER BY off.Title;
  
	END //
DELIMITER ;

CALL EmployeeReport();


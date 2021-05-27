-- Using The College database.
USE college;

-- Creating a table to catch the updates.
CREATE TABLE EmployeeChanges(
	user VARCHAR(80),
    action VARCHAR(20),
    changes VARCHAR(200),
    stamp  TIMESTAMP
);

-- Creating trigger to catch any insert into employees and payment tables.
DELIMITER //
CREATE TRIGGER EmployeeTriggerToCatchChanges
AFTER INSERT ON employees
FOR EACH ROW
	BEGIN
		DECLARE changes VARCHAR(200);
        
        SET changes = CONCAT(NEW.EmployeeID,', ',
			     NEW.FirstName,', ',
                             NEW.LastName,', ',
                             NEW.Phone,', ',
                             NEW.Email,', ',
                             NEW.HireDate,', ',
                             NEW.SpecialityID,', ',
                             NEW.Salary, ', ',
                             NEW.ReportsTo,', ',
                             NEW.OfficeID,', ');
                             
		INSERT INTO employeeChanges
        VALUES (CURRENT_USER(), 'INSERT', changes, CURRENT_TIMESTAMP());
	END //
DELIMITER ;


-- Creating the table to store any changes from payment table.
CREATE TABLE PaymentChanges(
	user VARCHAR(80),
    action VARCHAR(20),
    changes VARCHAR(200),
    stamp  TIMESTAMP
);

-- Creating trigger to catch any insert into payment table.
DELIMITER //
CREATE TRIGGER PaymentsTriggerToCatchChanges
AFTER INSERT ON payments
FOR EACH ROW
	BEGIN
		DECLARE changes VARCHAR(200);
        
        SET changes = CONCAT(NEW.PaymentID,', ',
			     NEW.StudentID,', ',
                             NEW.PaymentDate,', ',
                             NEW.TotalAmount,', ',
                             NEW.PaymentTypeID);
                          
		INSERT INTO paymentchanges
        VALUES (CURRENT_USER(), 'INSERT', changes, CURRENT_TIMESTAMP());
	END //
DELIMITER ;

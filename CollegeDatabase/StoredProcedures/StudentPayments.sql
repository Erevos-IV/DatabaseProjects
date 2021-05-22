-- Using College Database
USE college;

-- This procedure will give us all the payments of a specific student.
DELIMITER //
CREATE PROCEDURE StudentPayments(IN FirstName VARCHAR(50), IN LastName VARCHAR(50))
	BEGIN
	SELECT stu.StudentID, CONCAT(stu.FirstName, ' ', stu.LastNAme) AS 'Full Name', stu.Phone, stu.E_Mail, pay.PaymentDate, pay.TotalAmount, payt.Title
    FROM students AS stu
    INNER JOIN payments AS pay USING(StudentID)
    INNER JOIN paymenttypes as payt USING(PaymentTypeID)
    WHERE stu.FirstName = FirstName 
    AND stu.LastName = LastName;
    
	END //
DELIMITER ;

CALL StudentPayments('Bill','Goysetis');


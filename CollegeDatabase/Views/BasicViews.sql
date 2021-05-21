
-- View to have every student.
CREATE VIEW Students
AS
SELECT * 
FROM students;

-- View of all payments per student.
CREATE VIEW StudentPayments
AS
SELECT stu.StudentID, CONCAT(stu.FirstName,' ', stu.LastName) AS FullName, stu.Phone, pay.PaymentDate, payt.Title
FROM students as stu 
	 INNER JOIN Payments as pay USING(StudentID)
     INNER JOIN paymentTypes as payt USING(PaymentTypeID)
ORDER BY pay.PaymentDate;


-- View of all employees with their speciality.
CREATE VIEW Employees_View
AS
SELECT emp.EmployeeID, CONCAT(emp.FirstName, ' ',emp.LastName) AS FullName, emp.Phone, emp.Email, spe.Title AS Speciality, offi.Title AS Office
FROM employees AS emp 
	INNER JOIN specialities as spe USING(SpecialityID)
    INNER JOIN Offices AS offi USING(OfficeID)
ORDER BY offi.Title;

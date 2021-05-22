-- Using College Database
USE college;

-- This procedure will give us the exams details of a given student.
DELIMITER //
CREATE PROCEDURE StudentExams (IN StuName VARCHAR(50))
	BEGIN
    
    SELECT stu.StudentID, CONCAT(stu.FirstName, ' ', stu.LastName) AS Name, stu.Phone, ex.ExamDate, exd.Grade
    FROM students AS stu 
    INNER JOIN exams AS ex USING(ProgramID)
    INNER JOIN examdetails as exd USING(StudentID)
    WHERE stu.FirstName = StuName;
    
	END //
DELIMITER ;

-- Calling the procedure.
CALL StudentExams("Bill");

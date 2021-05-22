-- Using College Database
USE college;

-- This procedure will give us the exams details of a given student.
DELIMITER //
CREATE PROCEDURE StudentExams (IN StuFName VARCHAR(50), IN StuLName VARCHAR(50))
	BEGIN
    
    SELECT stu.StudentID, CONCAT(stu.FirstName, ' ', stu.LastName) AS Name, stu.Phone, ex.ExamDate, exd.Grade
    FROM students AS stu 
    INNER JOIN exams AS ex USING(ProgramID)
    INNER JOIN examdetails as exd USING(StudentID)
    WHERE stu.FirstName = StuFName
    AND stu.LastName = StuLName;
    
	END //
DELIMITER ;

DROP PROCEDURE IF EXISTS StudentExams;

-- Calling the procedure.
CALL StudentExams("Bill", "Goysetis");
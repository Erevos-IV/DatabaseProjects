-- Using college database
USE college;

-- Procedure to see the result of every student's grade per course. (If he has passes or no)
DELIMITER //
CREATE PROCEDURE StudentsPassingGrade(OUT Result VARCHAR(40))
	BEGIN
    -- Declaring my variables
    DECLARE GRADE INT DEFAULT 0;
    
    -- SELECT STATEMENT
    SELECT stu.StudentID, stu.FirstName, stu.LastName, exa.ExamDate, exad.Grade INTO GRADE
    FROM Students AS stu 
    JOIN exams AS exa USING(StudentID)
    JOIN examdetails AS exad USING(ExamID);
    
    
    -- IF STATEMENT AND OUTPUTProductsBoughtByCustomers
    IF GRADE > 50 THEN
    SET Result = 'You have succesfully passed';
    
    ELSE 
    SET Result = 'You have failed';
    
    END IF;
    
    END //
    

DELIMITER ;

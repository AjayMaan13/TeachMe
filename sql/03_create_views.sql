-- DBS211 Final Project
--
-- Online Education Platform
-- (TeachMe)
--
-- Advanced Queries and Business Reports

-- Set autocommit to OFF to ensure all operations are explicit

-- Business Reports for TeachMe Online Education Platform

SET AUTOCOMMIT OFF;

-- View 1: Course Enrollment Summary
CREATE VIEW vwCourseEnrollmentSummary AS
SELECT 
    C.CourseID AS Course_ID,
    C.Title AS Course_Title,
    (SELECT COUNT(E.UserID)
     FROM Enrollments E
     WHERE C.CourseID = E.CourseID) AS Total_Enrollments,
    C.Price AS Course_Price
FROM 
    Courses C
GROUP BY 
    C.CourseID, C.Title, C.Price;

-- Purpose: This view provides a summary of enrollments for each course.

-- Q. How the business will benefit from having the report:-
--    It helps management identify which courses are popular and generate more revenue, 
--    enabling better allocation of resources toward high-demand courses.


SELECT * FROM vwCourseEnrollmentSummary;

-- View 2: Student Performance Overview
CREATE VIEW vwStudentPerformanceOverview AS
SELECT 
    U.UserID AS Student_ID,
    U.FirstName || ' ' || U.LastName AS Student_Name,
    AVG(S.Score) AS Average_Score,
    COUNT(S.ScoreID) AS Total_Tests_Taken
FROM 
    Users U, Scores S
WHERE                   -- Using WHERE instead of JOIN
    U.UserID = S.UserID
AND 
    U.Role = 'Student'
GROUP BY 
    U.UserID, U.FirstName, U.LastName;
 
    
-- Purpose: This view provides an overview of student performance by calculating the average score across all tests taken by each student.

-- Q. How the business will benefit from having the report:-
--    It aids educators in identifying students who may need additional support or 
--    resources to improve their performance.



-- View 3: Course Feedback Ratings
CREATE VIEW vwCourseFeedbackRatings AS
SELECT 
    CourseID AS Course_ID,
    Title AS Course_Title,
    ROUND(AVG(F.Rating), 2) AS Average_Rating,
    COUNT(F.FeedbackID) AS Total_Feedbacks
FROM 
    Courses C
JOIN 
    CourseFeedback F USING (CourseID) -- USING clause
GROUP BY 
    CourseID, Title;
    


-- Purpose: This view summarizes the average ratings for each course along with the total number of feedbacks.
-- Q. How the business will benefit from having the report:-
--    It is vital for course administrators to understand student satisfaction and make necessary improvements to enhance course quality.




-- View 4: Instructor Course Load
CREATE VIEW vwInstructorCourseLoad AS
SELECT 
    U.UserID AS Instructor_ID,
    U.FirstName || ' ' || U.LastName AS Instructor_Name,
    COUNT(C.CourseID) AS Total_Courses_Taught
FROM 
    Users U
JOIN 
    Courses C ON U.UserID = C.InstructorID
WHERE 
    U.Role = 'Instructor'
GROUP BY 
    U.UserID, U.FirstName, U.LastName;

-- Purpose: This view presents the number of courses taught by each instructor.
-- Q. How the business will benefit from having the report:-
--    It assists in evaluating instructor workload and helps in identifying if 
--    certain instructors are overloaded or underutilized, leading to better resource management.


-- View 5: Revenue Generation from Advertisements
CREATE VIEW vwAdvertisementRevenue AS
SELECT 
    A.AdID AS Advertisement_ID,
    A.AdTitle AS Advertisement_Title,
    (SELECT SUM(ASub.Revenue) 
     FROM Advertisements ASub 
     WHERE A.AdID = ASub.AdID) AS Total_Revenue
FROM 
    Advertisements A;

-- Purpose: This view provides an overview of revenue generated from advertisements.
-- Q. How the business will benefit from having the report:-
--    It enables the business to assess the effectiveness of its advertising strategies, 
--    guiding future advertising campaigns and budget allocations to maximize revenue.

COMMIT;


--- Extra code

SELECT 
    Student_ID,
    Student_Name,
    Average_Score,
    Total_Tests_Taken
FROM 
    (
        SELECT 
            U.UserID AS Student_ID,
            U.FirstName || ' ' || U.LastName AS Student_Name,
            AVG(S.Score) AS Average_Score,
            COUNT(S.ScoreID) AS Total_Tests_Taken
        FROM 
            Users U, Scores S
        WHERE
            U.UserID = S.UserID
        AND 
            U.Role = 'Student'
        GROUP BY 
            U.UserID, U.FirstName, U.LastName
    ) 
WHERE 
    Average_Score > 50;


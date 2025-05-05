-- DBS211 Final Project
--
-- Online Education Platform
-- (TeachMe)
--
-- Advanced Queries and Business Reports

-- Set autocommit to OFF to ensure all operations are explicit
SET AUTOCOMMIT OFF;

-- =================================================================
-- SECTION 1: ADVANCED ANALYTICAL QUERIES
-- =================================================================

-- Query 1: Most Popular Courses by Industry
-- Purpose: Identify which courses are most popular in each industry
-- Business Value: Helps in strategic course development and marketing
SELECT 
    C.Industry,
    C.CourseID,
    C.Title,
    COUNT(E.EnrollmentID) AS EnrollmentCount,
    RANK() OVER (PARTITION BY C.Industry ORDER BY COUNT(E.EnrollmentID) DESC) AS PopularityRank
FROM 
    Courses C
LEFT JOIN 
    Enrollments E ON C.CourseID = E.CourseID
WHERE 
    C.Industry IS NOT NULL
GROUP BY 
    C.Industry, C.CourseID, C.Title
ORDER BY 
    C.Industry, PopularityRank;

-- Query 2: Instructor Performance Dashboard
-- Purpose: Evaluate instructor performance based on multiple metrics
-- Business Value: Identifies top-performing instructors for recognition and improvement opportunities
SELECT 
    U.UserID,
    U.FirstName || ' ' || U.LastName AS InstructorName,
    COUNT(DISTINCT C.CourseID) AS CourseCount,
    COUNT(DISTINCT E.EnrollmentID) AS TotalEnrollments,
    ROUND(AVG(CF.Rating), 2) AS AverageRating,
    ROUND(SUM(C.Price * (SELECT COUNT(*) FROM Enrollments E2 WHERE E2.CourseID = C.CourseID)), 2) AS EstimatedRevenue
FROM 
    Users U
JOIN 
    Courses C ON U.UserID = C.InstructorID
LEFT JOIN 
    Enrollments E ON C.CourseID = E.CourseID
LEFT JOIN 
    CourseFeedback CF ON C.CourseID = CF.CourseID
WHERE 
    U.Role = 'Instructor'
GROUP BY 
    U.UserID, U.FirstName, U.LastName
ORDER BY 
    EstimatedRevenue DESC;

-- Query 3: Student Engagement Analysis
-- Purpose: Identify how engaged students are across different courses
-- Business Value: Helps in identifying at-risk students and improving retention
SELECT 
    U.UserID,
    U.FirstName || ' ' || U.LastName AS StudentName,
    COUNT(DISTINCT E.CourseID) AS EnrolledCourses,
    COUNT(DISTINCT S.TestID) AS TestsCompleted,
    ROUND(AVG(S.Score), 2) AS AverageScore,
    COUNT(DISTINCT CASE WHEN S.Score >= 70 THEN S.TestID END) AS TestsPassed,
    COUNT(DISTINCT Cert.CertificationID) AS CertificationsEarned
FROM 
    Users U
LEFT JOIN 
    Enrollments E ON U.UserID = E.UserID
LEFT JOIN 
    Tests T ON E.CourseID = T.CourseID
LEFT JOIN 
    Scores S ON U.UserID = S.UserID AND T.TestID = S.TestID
LEFT JOIN 
    Certifications Cert ON U.UserID = Cert.UserID AND E.CourseID = Cert.CourseID
WHERE 
    U.Role = 'Student'
GROUP BY 
    U.UserID, U.FirstName, U.LastName
ORDER BY 
    EnrolledCourses DESC, AverageScore DESC;

-- Query 4: Course Completion Rates
-- Purpose: Calculate completion rates for all courses
-- Business Value: Identifies courses that may need restructuring or improvement
SELECT 
    C.CourseID,
    C.Title,
    COUNT(DISTINCT E.UserID) AS EnrolledStudents,
    COUNT(DISTINCT Cert.UserID) AS CompletedStudents,
    CASE 
        WHEN COUNT(DISTINCT E.UserID) = 0 THEN 0
        ELSE ROUND((COUNT(DISTINCT Cert.UserID) / COUNT(DISTINCT E.UserID)) * 100, 2)
    END AS CompletionRate
FROM 
    Courses C
LEFT JOIN 
    Enrollments E ON C.CourseID = E.CourseID
LEFT JOIN 
    Certifications Cert ON C.CourseID = Cert.CourseID AND E.UserID = Cert.UserID
GROUP BY 
    C.CourseID, C.Title
ORDER BY 
    CompletionRate DESC;

-- Query 5: Revenue Analysis by Month
-- Purpose: Track revenue trends over time
-- Business Value: Helps in financial planning and identifying seasonal trends
SELECT 
    TO_CHAR(E.EnrollmentDate, 'YYYY-MM') AS Month,
    COUNT(E.EnrollmentID) AS Enrollments,
    ROUND(SUM(C.Price), 2) AS CourseRevenue,
    (
        SELECT ROUND(SUM(Ad.Revenue), 2)
        FROM Advertisements Ad
        WHERE TO_CHAR(SYSDATE, 'YYYY-MM') = TO_CHAR(E.EnrollmentDate, 'YYYY-MM')
    ) AS AdRevenue,
    ROUND(SUM(C.Price), 2) + NVL(
        (
            SELECT ROUND(SUM(Ad.Revenue), 2)
            FROM Advertisements Ad
            WHERE TO_CHAR(SYSDATE, 'YYYY-MM') = TO_CHAR(E.EnrollmentDate, 'YYYY-MM')
        ), 0
    ) AS TotalRevenue
FROM 
    Enrollments E
JOIN 
    Courses C ON E.CourseID = C.CourseID
GROUP BY 
    TO_CHAR(E.EnrollmentDate, 'YYYY-MM')
ORDER BY 
    Month;

-- =================================================================
-- SECTION 2: ADVANCED ANALYTICAL VIEWS
-- =================================================================

-- View 1: Comprehensive Course Analytics
-- Purpose: Provide a complete overview of course performance metrics
CREATE OR REPLACE VIEW vwCourseAnalytics AS
SELECT 
    C.CourseID,
    C.Title,
    C.Industry,
    U.FirstName || ' ' || U.LastName AS InstructorName,
    C.Price,
    C.IsCertified,
    COUNT(DISTINCT E.EnrollmentID) AS TotalEnrollments,
    ROUND(AVG(CF.Rating), 2) AS AverageRating,
    COUNT(DISTINCT CF.FeedbackID) AS FeedbackCount,
    COUNT(DISTINCT T.TestID) AS TestCount,
    ROUND(AVG(S.Score), 2) AS AverageTestScore,
    COUNT(DISTINCT Cert.CertificationID) AS CertificationsIssued,
    ROUND(SUM(Ad.Revenue), 2) AS AdvertisementRevenue,
    ROUND(C.Price * COUNT(DISTINCT E.EnrollmentID), 2) AS CourseRevenue,
    ROUND(C.Price * COUNT(DISTINCT E.EnrollmentID) + NVL(SUM(Ad.Revenue), 0), 2) AS TotalRevenue
FROM 
    Courses C
LEFT JOIN 
    Users U ON C.InstructorID = U.UserID
LEFT JOIN 
    Enrollments E ON C.CourseID = E.CourseID
LEFT JOIN 
    CourseFeedback CF ON C.CourseID = CF.CourseID
LEFT JOIN 
    Tests T ON C.CourseID = T.CourseID
LEFT JOIN 
    Scores S ON T.TestID = S.TestID
LEFT JOIN 
    Certifications Cert ON C.CourseID = Cert.CourseID
LEFT JOIN 
    Advertisements Ad ON C.CourseID = Ad.CourseID
GROUP BY 
    C.CourseID, C.Title, C.Industry, U.FirstName, U.LastName, C.Price, C.IsCertified;

-- View 2: Student Learning Progress
-- Purpose: Track student progress across all enrolled courses
CREATE OR REPLACE VIEW vwStudentLearningProgress AS
SELECT 
    U.UserID,
    U.FirstName || ' ' || U.LastName AS StudentName,
    C.CourseID,
    C.Title AS CourseTitle,
    COUNT(DISTINCT T.TestID) AS TotalCourseTests,
    COUNT(DISTINCT S.TestID) AS CompletedTests,
    CASE 
        WHEN COUNT(DISTINCT T.TestID) = 0 THEN 0
        ELSE ROUND((COUNT(DISTINCT S.TestID) / COUNT(DISTINCT T.TestID)) * 100, 2)
    END AS ProgressPercentage,
    ROUND(AVG(S.Score), 2) AS AverageScore,
    CASE 
        WHEN C.IsCertified = 'Y' AND EXISTS (
            SELECT 1 FROM Certifications Cert 
            WHERE Cert.UserID = U.UserID AND Cert.CourseID = C.CourseID
        ) THEN 'Certified'
        WHEN ProgressPercentage = 100 THEN 'Completed'
        WHEN ProgressPercentage > 0 THEN 'In Progress'
        ELSE 'Not Started'
    END AS Status
FROM 
    Users U
JOIN 
    Enrollments E ON U.UserID = E.UserID
JOIN 
    Courses C ON E.CourseID = C.CourseID
LEFT JOIN 
    Tests T ON C.CourseID = T.CourseID
LEFT JOIN 
    Scores S ON T.TestID = S.TestID AND U.UserID = S.UserID
WHERE 
    U.Role = 'Student'
GROUP BY 
    U.UserID, U.FirstName, U.LastName, C.CourseID, C.Title, C.IsCertified;

-- View 3: Industry Trend Analysis
-- Purpose: Analyze course popularity and performance by industry
CREATE OR REPLACE VIEW vwIndustryTrends AS
SELECT 
    C.Industry,
    COUNT(DISTINCT C.CourseID) AS TotalCourses,
    COUNT(DISTINCT E.EnrollmentID) AS TotalEnrollments,
    ROUND(AVG(C.Price), 2) AS AveragePrice,
    ROUND(AVG(CF.Rating), 2) AS AverageRating,
    COUNT(DISTINCT CASE WHEN C.IsCertified = 'Y' THEN C.CourseID END) AS CertifiedCourses,
    COUNT(DISTINCT Cert.CertificationID) AS CertificationsIssued,
    ROUND(SUM(C.Price * (SELECT COUNT(*) FROM Enrollments E2 WHERE E2.CourseID = C.CourseID)), 2) AS TotalRevenue
FROM 
    Courses C
LEFT JOIN 
    Enrollments E ON C.CourseID = E.CourseID
LEFT JOIN 
    CourseFeedback CF ON C.CourseID = CF.CourseID
LEFT JOIN 
    Certifications Cert ON C.CourseID = Cert.CourseID
WHERE 
    C.Industry IS NOT NULL
GROUP BY 
    C.Industry
ORDER BY 
    TotalEnrollments DESC;

-- =================================================================
-- SECTION 3: COMPLEX BUSINESS REPORTS
-- =================================================================

-- Report 1: Instructor Performance Report
-- Purpose: Comprehensive evaluation of instructor effectiveness
SELECT 
    U.UserID AS InstructorID,
    U.FirstName || ' ' || U.LastName AS InstructorName,
    COUNT(DISTINCT C.CourseID) AS TotalCourses,
    ROUND(AVG(CF.Rating), 2) AS AverageRating,
    (
        SELECT COUNT(DISTINCT E2.UserID)
        FROM Courses C2
        JOIN Enrollments E2 ON C2.CourseID = E2.CourseID
        WHERE C2.InstructorID = U.UserID
    ) AS TotalStudents,
    (
        SELECT ROUND(AVG(S2.Score), 2)
        FROM Courses C2
        JOIN Tests T2 ON C2.CourseID = T2.CourseID
        JOIN Scores S2 ON T2.TestID = S2.TestID
        WHERE C2.InstructorID = U.UserID
    ) AS AverageStudentScore,
    ROUND(SUM(C.Price * (SELECT COUNT(*) FROM Enrollments E3 WHERE E3.CourseID = C.CourseID)), 2) AS TotalRevenue,
    RANK() OVER (ORDER BY ROUND(AVG(CF.Rating), 2) DESC) AS RatingRank
FROM 
    Users U
JOIN 
    Courses C ON U.UserID = C.InstructorID
LEFT JOIN 
    CourseFeedback CF ON C.CourseID = CF.CourseID
WHERE 
    U.Role = 'Instructor'
GROUP BY 
    U.UserID, U.FirstName, U.LastName
ORDER BY 
    AverageRating DESC, TotalRevenue DESC;

-- Report 2: Student Achievement Report
-- Purpose: Track student performance across platform
-- Business Value: Identify high-performing students and learning patterns
SELECT 
    U.UserID,
    U.FirstName || ' ' || U.LastName AS StudentName,
    COUNT(DISTINCT E.CourseID) AS EnrolledCourses,
    ROUND(AVG(S.Score), 2) AS AverageScore,
    (
        SELECT COUNT(DISTINCT S1.TestID)
        FROM Scores S1
        WHERE S1.UserID = U.UserID AND S1.Score >= S1.PassingMarks
    ) AS TestsPassed,
    (
        SELECT COUNT(DISTINCT S2.TestID)
        FROM Scores S2
        WHERE S2.UserID = U.UserID
    ) AS TotalTestsTaken,
    CASE 
        WHEN TotalTestsTaken = 0 THEN 0
        ELSE ROUND((TestsPassed / TotalTestsTaken) * 100, 2)
    END AS PassRate,
    COUNT(DISTINCT Cert.CertificationID) AS CertificationsEarned,
    (
        SELECT MAX(S3.Score)
        FROM Scores S3
        WHERE S3.UserID = U.UserID
    ) AS HighestScore,
    (
        SELECT AVG(CF.Rating)
        FROM CourseFeedback CF
        WHERE CF.UserID = U.UserID
    ) AS AverageFeedbackGiven
FROM 
    Users U
LEFT JOIN 
    Enrollments E ON U.UserID = E.UserID
LEFT JOIN 
    Tests T ON E.CourseID = T.CourseID
LEFT JOIN 
    Scores S ON U.UserID = S.UserID AND T.TestID = S.TestID
LEFT JOIN 
    Certifications Cert ON U.UserID = Cert.UserID
WHERE 
    U.Role = 'Student'
GROUP BY 
    U.UserID, U.FirstName, U.LastName
ORDER BY 
    AverageScore DESC, CertificationsEarned DESC;

-- Report 3: Course Performance Analytics
-- Purpose: Deep analysis of course effectiveness and financial performance
-- Business Value: Identify improvement opportunities and revenue drivers
SELECT 
    C.CourseID,
    C.Title,
    U.FirstName || ' ' || U.LastName AS InstructorName,
    C.Industry,
    C.Price,
    C.IsCertified,
    COUNT(DISTINCT E.EnrollmentID) AS Enrollments,
    ROUND(AVG(CF.Rating), 2) AS AverageRating,
    COUNT(DISTINCT CF.FeedbackID) AS FeedbackCount,
    (
        SELECT COUNT(DISTINCT T2.TestID)
        FROM Tests T2
        WHERE T2.CourseID = C.CourseID
    ) AS TestCount,
    (
        SELECT ROUND(AVG(S2.Score), 2)
        FROM Tests T2
        JOIN Scores S2 ON T2.TestID = S2.TestID
        WHERE T2.CourseID = C.CourseID
    ) AS AverageTestScore,
    (
        SELECT COUNT(DISTINCT S3.UserID)
        FROM Tests T3
        JOIN Scores S3 ON T3.TestID = S3.TestID
        WHERE T3.CourseID = C.CourseID AND S3.Score >= S3.PassingMarks
    ) AS StudentsPassedTests,
    COUNT(DISTINCT Cert.CertificationID) AS CertificationsIssued,
    ROUND(SUM(Ad.Revenue), 2) AS AdRevenue,
    ROUND(C.Price * COUNT(DISTINCT E.EnrollmentID), 2) AS CourseRevenue,
    ROUND(C.Price * COUNT(DISTINCT E.EnrollmentID) + NVL(SUM(Ad.Revenue), 0), 2) AS TotalRevenue,
    CASE 
        WHEN COUNT(DISTINCT E.EnrollmentID) = 0 THEN 0
        ELSE ROUND((COUNT(DISTINCT Cert.CertificationID) / COUNT(DISTINCT E.EnrollmentID)) * 100, 2)
    END AS CompletionRate
FROM 
    Courses C
JOIN 
    Users U ON C.InstructorID = U.UserID
LEFT JOIN 
    Enrollments E ON C.CourseID = E.CourseID
LEFT JOIN 
    CourseFeedback CF ON C.CourseID = CF.CourseID
LEFT JOIN 
    Certifications Cert ON C.CourseID = Cert.CourseID
LEFT JOIN 
    Advertisements Ad ON C.CourseID = Ad.CourseID
GROUP BY 
    C.CourseID, C.Title, U.FirstName, U.LastName, C.Industry, C.Price, C.IsCertified
ORDER BY 
    TotalRevenue DESC, AverageRating DESC;

-- Report 4: Platform Financial Performance
-- Purpose: Comprehensive financial analysis across the platform
-- Business Value: Track overall financial health and identify growth opportunities
SELECT 
    TO_CHAR(E.EnrollmentDate, 'YYYY-MM') AS Month,
    COUNT(DISTINCT E.EnrollmentID) AS Enrollments,
    COUNT(DISTINCT E.UserID) AS NewStudents,
    ROUND(SUM(C.Price), 2) AS CourseRevenue,
    (
        SELECT ROUND(SUM(Ad.Revenue), 2)
        FROM Advertisements Ad
        WHERE TO_CHAR(SYSDATE, 'YYYY-MM') = TO_CHAR(E.EnrollmentDate, 'YYYY-MM')
    ) AS AdRevenue,
    ROUND(SUM(C.Price), 2) + NVL(
        (
            SELECT ROUND(SUM(Ad.Revenue), 2)
            FROM Advertisements Ad
            WHERE TO_CHAR(SYSDATE, 'YYYY-MM') = TO_CHAR(E.EnrollmentDate, 'YYYY-MM')
        ), 0
    ) AS TotalRevenue,
    ROUND(AVG(C.Price), 2) AS AverageCoursePrice,
    (
        SELECT COUNT(DISTINCT C2.CourseID)
        FROM Courses C2
        WHERE TO_CHAR(SYSDATE, 'YYYY-MM') = TO_CHAR(E.EnrollmentDate, 'YYYY-MM')
    ) AS NewCoursesAdded,
    ROUND(
        (TotalRevenue - LAG(TotalRevenue) OVER (ORDER BY TO_CHAR(E.EnrollmentDate, 'YYYY-MM'))) / 
        NULLIF(LAG(TotalRevenue) OVER (ORDER BY TO_CHAR(E.EnrollmentDate, 'YYYY-MM')), 0) * 100, 
    2) AS RevenueGrowthPercentage
FROM 
    Enrollments E
JOIN 
    Courses C ON E.CourseID = C.CourseID
GROUP BY 
    TO_CHAR(E.EnrollmentDate, 'YYYY-MM')
ORDER BY 
    Month;

-- Report 5: User Acquisition and Retention Analysis
-- Purpose: Track user acquisition patterns and retention metrics
-- Business Value: Optimize marketing efforts and improve user retention strategies
SELECT 
    TO_CHAR(E.EnrollmentDate, 'YYYY-MM') AS Month,
    COUNT(DISTINCT E.UserID) AS NewUsers,
    (
        SELECT COUNT(DISTINCT U1.UserID)
        FROM Users U1
        WHERE U1.Role = 'Student' 
        AND TO_CHAR(SYSDATE, 'YYYY-MM') = TO_CHAR(E.EnrollmentDate, 'YYYY-MM')
    ) AS TotalStudents,
    (
        SELECT COUNT(DISTINCT U2.UserID)
        FROM Users U2
        WHERE U2.Role = 'Instructor' 
        AND TO_CHAR(SYSDATE, 'YYYY-MM') = TO_CHAR(E.EnrollmentDate, 'YYYY-MM')
    ) AS TotalInstructors,
    (
        SELECT COUNT(DISTINCT E2.UserID)
        FROM Enrollments E2
        WHERE TO_CHAR(E2.EnrollmentDate, 'YYYY-MM') = TO_CHAR(ADD_MONTHS(E.EnrollmentDate, -1), 'YYYY-MM')
        AND EXISTS (
            SELECT 1
            FROM Enrollments E3
            WHERE E3.UserID = E2.UserID
            AND TO_CHAR(E3.EnrollmentDate, 'YYYY-MM') = TO_CHAR(E.EnrollmentDate, 'YYYY-MM')
        )
    ) AS RetainedUsers,
    CASE 
        WHEN COUNT(DISTINCT E.UserID) = 0 THEN 0
        ELSE ROUND((RetainedUsers / COUNT(DISTINCT E.UserID)) * 100, 2)
    END AS RetentionRate,
    (
        SELECT AVG(CF.Rating)
        FROM CourseFeedback CF
        WHERE TO_CHAR(SYSDATE, 'YYYY-MM') = TO_CHAR(E.EnrollmentDate, 'YYYY-MM')
    ) AS AverageSatisfactionRating,
    (
        SELECT COUNT(DISTINCT Cert.CertificationID)
        FROM Certifications Cert
        WHERE TO_CHAR(Cert.CertificationDate, 'YYYY-MM') = TO_CHAR(E.EnrollmentDate, 'YYYY-MM')
    ) AS CertificationsIssued
FROM 
    Enrollments E
GROUP BY 
    TO_CHAR(E.EnrollmentDate, 'YYYY-MM')
ORDER BY 
    Month;

-- =================================================================
-- SECTION 4: INTERACTIVE DASHBOARD QUERIES
-- =================================================================

-- Dashboard Query 1: Course Performance Snapshot
-- Purpose: Real-time overview of course performance for dashboard display
SELECT 
    C.CourseID,
    C.Title,
    C.Industry,
    U.FirstName || ' ' || U.LastName AS InstructorName,
    COUNT(DISTINCT E.EnrollmentID) AS Enrollments,
    ROUND(AVG(CF.Rating), 2) AS Rating,
    ROUND(AVG(S.Score), 2) AS AvgScore,
    COUNT(DISTINCT Cert.CertificationID) AS Certifications,
    ROUND(C.Price * COUNT(DISTINCT E.EnrollmentID), 2) AS Revenue
FROM 
    Courses C
JOIN 
    Users U ON C.InstructorID = U.UserID
LEFT JOIN 
    Enrollments E ON C.CourseID = E.CourseID
LEFT JOIN 
    CourseFeedback CF ON C.CourseID = CF.CourseID
LEFT JOIN 
    Tests T ON C.CourseID = T.CourseID
LEFT JOIN 
    Scores S ON T.TestID = S.TestID
LEFT JOIN 
    Certifications Cert ON C.CourseID = Cert.CourseID
GROUP BY 
    C.CourseID, C.Title, C.Industry, U.FirstName, U.LastName
ORDER BY 
    Enrollments DESC, Rating DESC;

-- Dashboard Query 2: User Activity Monitor
-- Purpose: Track recent user activity for platform monitoring
SELECT 
    U.UserID,
    U.FirstName || ' ' || U.LastName AS UserName,
    U.Role,
    (
        SELECT MAX(E.EnrollmentDate)
        FROM Enrollments E
        WHERE E.UserID = U.UserID
    ) AS LastActivity,
    (
        SELECT COUNT(*)
        FROM Enrollments E
        WHERE E.UserID = U.UserID
    ) AS TotalEnrollments,
    (
        SELECT COUNT(*)
        FROM Scores S
        WHERE S.UserID = U.UserID
    ) AS TestsTaken,
    (
        SELECT COUNT(*)
        FROM CourseFeedback CF
        WHERE CF.UserID = U.UserID
    ) AS FeedbacksSubmitted,
    (
        SELECT COUNT(*)
        FROM Certifications C
        WHERE C.UserID = U.UserID
    ) AS CertificationsEarned,
    ROUND(SYSDATE - LastActivity) AS DaysSinceLastActivity
FROM 
    Users U
ORDER BY 
    DaysSinceLastActivity;

-- Dashboard Query 3: Revenue Trend Analyzer
-- Purpose: Visualize revenue trends for executive dashboard
SELECT 
    TO_CHAR(E.EnrollmentDate, 'YYYY-MM') AS Month,
    COUNT(DISTINCT E.EnrollmentID) AS Enrollments,
    ROUND(SUM(C.Price), 2) AS CourseRevenue,
    (
        SELECT ROUND(SUM(Ad.Revenue), 2)
        FROM Advertisements Ad
        WHERE TO_CHAR(SYSDATE, 'YYYY-MM') = TO_CHAR(E.EnrollmentDate, 'YYYY-MM')
    ) AS AdRevenue,
    ROUND(SUM(C.Price), 2) + NVL(
        (
            SELECT ROUND(SUM(Ad.Revenue), 2)
            FROM Advertisements Ad
            WHERE TO_CHAR(SYSDATE, 'YYYY-MM') = TO_CHAR(E.EnrollmentDate, 'YYYY-MM')
        ), 0
    ) AS TotalRevenue,
    ROUND(
        (TotalRevenue - LAG(TotalRevenue) OVER (ORDER BY TO_CHAR(E.EnrollmentDate, 'YYYY-MM'))) / 
        NULLIF(LAG(TotalRevenue) OVER (ORDER BY TO_CHAR(E.EnrollmentDate, 'YYYY-MM')), 0) * 100,
    2) AS MonthlyGrowth
FROM 
    Enrollments E
JOIN 
    Courses C ON E.CourseID = C.CourseID
GROUP BY 
    TO_CHAR(E.EnrollmentDate, 'YYYY-MM')
ORDER BY 
    Month;

-- Dashboard Query 4: Industry Performance Comparison
-- Purpose: Compare performance across different industries
SELECT 
    C.Industry,
    COUNT(DISTINCT C.CourseID) AS CourseCount,
    COUNT(DISTINCT E.EnrollmentID) AS EnrollmentCount,
    ROUND(AVG(CF.Rating), 2) AS AverageRating,
    ROUND(AVG(S.Score), 2) AS AverageTestScore,
    COUNT(DISTINCT Cert.CertificationID) AS CertificationsIssued,
    ROUND(SUM(C.Price * (SELECT COUNT(*) FROM Enrollments E2 WHERE E2.CourseID = C.CourseID)), 2) AS TotalRevenue,
    ROUND(TotalRevenue / NULLIF(CourseCount, 0), 2) AS RevenuePerCourse,
    ROUND(TotalRevenue / NULLIF(EnrollmentCount, 0), 2) AS RevenuePerEnrollment
FROM 
    Courses C
LEFT JOIN 
    Enrollments E ON C.CourseID = E.CourseID
LEFT JOIN 
    CourseFeedback CF ON C.CourseID = CF.CourseID
LEFT JOIN 
    Tests T ON C.CourseID = T.CourseID
LEFT JOIN 
    Scores S ON T.TestID = S.TestID
LEFT JOIN 
    Certifications Cert ON C.CourseID = Cert.CourseID
WHERE 
    C.Industry IS NOT NULL
GROUP BY 
    C.Industry
ORDER BY 
    TotalRevenue DESC;

-- Dashboard Query 5: Platform Health Metrics
-- Purpose: Key performance indicators for platform health monitoring
SELECT 
    (SELECT COUNT(*) FROM Users WHERE Role = 'Student') AS TotalStudents,
    (SELECT COUNT(*) FROM Users WHERE Role = 'Instructor') AS TotalInstructors,
    (SELECT COUNT(*) FROM Courses) AS TotalCourses,
    (SELECT COUNT(*) FROM Enrollments) AS TotalEnrollments,
    (SELECT COUNT(*) FROM Tests) AS TotalTests,
    (SELECT COUNT(*) FROM Scores) AS TotalTestsCompleted,
    (SELECT COUNT(*) FROM Certifications) AS TotalCertifications,
    (SELECT ROUND(AVG(Rating), 2) FROM CourseFeedback) AS AveragePlatformRating,
    (SELECT ROUND(AVG(Score), 2) FROM Scores) AS AverageTestScore,
    (
        SELECT ROUND(SUM(C.Price * (SELECT COUNT(*) FROM Enrollments E WHERE E.CourseID = C.CourseID)), 2)
        FROM Courses C
    ) AS TotalCourseRevenue,
    (SELECT ROUND(SUM(Revenue), 2) FROM Advertisements) AS TotalAdRevenue,
    TotalCourseRevenue + TotalAdRevenue AS TotalPlatformRevenue,
    (
        SELECT ROUND((COUNT(DISTINCT Cert.CertificationID) / NULLIF(COUNT(DISTINCT E.EnrollmentID), 0)) * 100, 2)
        FROM Enrollments E
        LEFT JOIN Certifications Cert ON E.CourseID = Cert.CourseID AND E.UserID = Cert.UserID
    ) AS OverallCompletionRate
FROM 
    DUAL;

COMMIT;
-- End of SQL Queries and Reports
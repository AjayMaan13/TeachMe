-- =========================================================
-- TeachMe Online Education Platform - Database Cleanup Script
-- =========================================================

-- First drop all views
DROP VIEW vwCourseEnrollmentSummary;
DROP VIEW vwStudentPerformanceOverview;
DROP VIEW vwCourseFeedbackRatings;
DROP VIEW vwInstructorCourseLoad;
DROP VIEW vwAdvertisementRevenue;

-- Delete all data from tables (if you want to keep the structure but remove data)
-- Uncomment these if you just want to clear data without dropping tables

DELETE FROM certifications;
DELETE FROM coursefeedback;
DELETE FROM advertisements;
DELETE FROM scores;
DELETE FROM enrollments;
DELETE FROM tests;
DELETE FROM courses;
DELETE FROM profiles;
DELETE FROM users;


-- Drop tables in reverse order of dependencies
DROP TABLE certifications;
DROP TABLE coursefeedback;
DROP TABLE advertisements;
DROP TABLE scores;
DROP TABLE tests;
DROP TABLE enrollments;
DROP TABLE courses;
DROP TABLE profiles;
DROP TABLE users;

COMMIT;
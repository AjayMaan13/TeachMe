-- DBS211 Final Project
--
-- Online Education Platform
-- (TeachMe)
--
-- Advanced Queries and Business Reports

-- Set autocommit to OFF to ensure all operations are explicit


SET AUTOCOMMIT OFF;


-- Inserting Entries into Users Table
INSERT ALL
    INTO Users (UserID, FirstName, LastName, Email, Password, Role) VALUES (1, 'John', 'Doe', 'john.doe@example.com', 'password1', 'Student')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role) VALUES (2, 'Jane', 'Smith', 'jane.smith@example.com', 'password2', 'Instructor')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role) VALUES (3, 'Alice', 'Johnson', 'alice.johnson@example.com', 'password3', 'Student')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role) VALUES (4, 'Bob', 'Brown', 'bob.brown@example.com', 'password4', 'Instructor')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role) VALUES (5, 'Charlie', 'Williams', 'charlie.williams@example.com', 'password5', 'Student')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role) VALUES (6, 'David', 'Jones', 'david.jones@example.com', 'password6', 'Instructor')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role) VALUES (7, 'Eve', 'Miller', 'eve.miller@example.com', 'password7', 'Student')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role) VALUES (8, 'Frank', 'Davis', 'frank.davis@example.com', 'password8', 'Instructor')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role) VALUES (9, 'Grace', 'Garcia', 'grace.garcia@example.com', 'password9', 'Student')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role) VALUES (10, 'Hank', 'Martinez', 'hank.martinez@example.com', 'password10', 'Instructor')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role) VALUES (11, 'Ivy', 'Robinson', 'ivy.robinson@example.com', 'password11', 'Student')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role) VALUES (12, 'Jack', 'Clark', 'jack.clark@example.com', 'password12', 'Instructor')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role) VALUES (13, 'Kathy', 'Rodriguez', 'kathy.rodriguez@example.com', 'password13', 'Student')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role) VALUES (14, 'Liam', 'Lewis', 'liam.lewis@example.com', 'password14', 'Instructor')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role) VALUES (15, 'Mona', 'Lee', 'mona.lee@example.com', 'password15', 'Student')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role) VALUES (16, 'Nick', 'Walker', 'nick.walker@example.com', 'password16', 'Instructor')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role) VALUES (17, 'Olivia', 'Hall', 'olivia.hall@example.com', 'password17', 'Student')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role) VALUES (18, 'Paul', 'Allen', 'paul.allen@example.com', 'password18', 'Instructor')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role) VALUES (19, 'Quinn', 'Young', 'quinn.young@example.com', 'password19', 'Student')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role) VALUES (20, 'Rachel', 'Hernandez', 'rachel.hernandez@example.com', 'password20', 'Instructor')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role) VALUES (21, 'Sam', 'King', 'sam.king@example.com', 'password21', 'Student')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role) VALUES (22, 'Tina', 'Wright', 'tina.wright@example.com', 'password22', 'Instructor')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role) VALUES (23, 'Uma', 'Lopez', 'uma.lopez@example.com', 'password23', 'Student')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role) VALUES (24, 'Victor', 'Hill', 'victor.hill@example.com', 'password24', 'Instructor')
    INTO Users (UserID, FirstName, LastName, Email, Password, Role) VALUES (25, 'Wendy', 'Scott', 'wendy.scott@example.com', 'password25', 'Student')
SELECT * FROM dual;


-- Inserting Entries into Profiles Table
INSERT ALL
    INTO Profiles (ProfileID, UserID, Bio, Industry) VALUES (1, 1, 'Enthusiastic learner and educator.', 'Education')
    INTO Profiles (ProfileID, UserID, Bio, Industry) VALUES (2, 2, 'Passionate about science and technology.', 'Technology')
    INTO Profiles (ProfileID, UserID, Bio, Industry) VALUES (3, 3, 'Loves exploring new ideas and concepts.', 'Research')
    INTO Profiles (ProfileID, UserID, Bio, Industry) VALUES (4, 4, 'Avid reader and writer.', 'Literature')
    INTO Profiles (ProfileID, UserID, Bio, Industry) VALUES (5, 5, 'Adventurer and sports enthusiast.', 'Sports')
    INTO Profiles (ProfileID, UserID, Bio, Industry) VALUES (6, 6, 'Culinary artist with a love for travel.', 'Culinary')
    INTO Profiles (ProfileID, UserID, Bio, Industry) VALUES (7, 7, 'Tech guru and gamer.', 'Gaming')
    INTO Profiles (ProfileID, UserID, Bio, Industry) VALUES (8, 8, 'Art lover and photography enthusiast.', 'Arts')
    INTO Profiles (ProfileID, UserID, Bio, Industry) VALUES (9, 9, 'Fitness fanatic and health coach.', 'Health')
    INTO Profiles (ProfileID, UserID, Bio, Industry) VALUES (10, 10, 'Creative writer and storyteller.', 'Writing')
    INTO Profiles (ProfileID, UserID, Bio, Industry) VALUES (11, 11, 'Environmental activist and nature lover.', 'Environmental')
    INTO Profiles (ProfileID, UserID, Bio, Industry) VALUES (12, 12, 'Business strategist with a passion for innovation.', 'Business')
    INTO Profiles (ProfileID, UserID, Bio, Industry) VALUES (13, 13, 'Music enthusiast and aspiring musician.', 'Music')
    INTO Profiles (ProfileID, UserID, Bio, Industry) VALUES (14, 14, 'Tech enthusiast and software developer.', 'Technology')
    INTO Profiles (ProfileID, UserID, Bio, Industry) VALUES (15, 15, 'Community organizer and volunteer.', 'Non-profit')
    INTO Profiles (ProfileID, UserID, Bio, Industry) VALUES (16, 16, 'History buff and travel blogger.', 'Travel')
    INTO Profiles (ProfileID, UserID, Bio, Industry) VALUES (17, 17, 'Fashion lover and stylist.', 'Fashion')
    INTO Profiles (ProfileID, UserID, Bio, Industry) VALUES (18, 18, 'Data analyst and statistician.', 'Data')
    INTO Profiles (ProfileID, UserID, Bio, Industry) VALUES (19, 19, 'Pet lover and animal rights advocate.', 'Animal Welfare')
    INTO Profiles (ProfileID, UserID, Bio, Industry) VALUES (20, 20, 'Fitness trainer and wellness coach.', 'Health')
    INTO Profiles (ProfileID, UserID, Bio, Industry) VALUES (21, 21, 'Digital marketer with a knack for storytelling.', 'Marketing')
    INTO Profiles (ProfileID, UserID, Bio, Industry) VALUES (22, 22, 'Blockchain enthusiast and crypto investor.', 'Finance')
    INTO Profiles (ProfileID, UserID, Bio, Industry) VALUES (23, 23, 'Volunteer firefighter and emergency responder.', 'Public Service')
    INTO Profiles (ProfileID, UserID, Bio, Industry) VALUES (24, 24, 'Cultural historian and museum curator.', 'Culture')
    INTO Profiles (ProfileID, UserID, Bio, Industry) VALUES (25, 25, 'Public speaker and motivator.', 'Motivation')
SELECT * FROM dual;

-- Inserting Entries into Courses Table
INSERT ALL
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price) VALUES (1, 2, 'Math 101', 'Basic Mathematics', 'Mathematics', 'Y', 100.00)
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price) VALUES (2, 4, 'Physics 101', 'Basic Physics', 'Physics', 'Y', 100.00)
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price) VALUES (3, 6, 'Chemistry 101', 'Basic Chemistry', 'Chemistry', 'N', 100.00)
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price) VALUES (4, 8, 'Biology 101', 'Basic Biology', 'Biology', 'Y', 100.00)
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price) VALUES (5, 10, 'English 101', 'Basic English', 'English', 'N', 100.00)
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price) VALUES (6, 12, 'History 101', 'Basic History', 'History', 'Y', 100.00)
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price) VALUES (7, 14, 'Geography 101', 'Basic Geography', 'Geography', 'N', 100.00)
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price) VALUES (8, 16, 'Computer Science 101', 'Basic Computer Science', 'Computer Science', 'Y', 100.00)
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price) VALUES (9, 18, 'Art 101', 'Basic Art', 'Art', 'N', 100.00)
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price) VALUES (10, 20, 'Music 101', 'Basic Music', 'Music', 'Y', 100.00)
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price) VALUES (11, 2, 'Math 102', 'Advanced Mathematics', 'Mathematics', 'Y', 150.00)
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price) VALUES (12, 4, 'Physics 102', 'Advanced Physics', 'Physics', 'N', 150.00)
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price) VALUES (13, 6, 'Chemistry 102', 'Advanced Chemistry', 'Chemistry', 'Y', 150.00)
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price) VALUES (14, 8, 'Biology 102', 'Advanced Biology', 'Biology', 'N', 150.00)
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price) VALUES (15, 10, 'English 102', 'Advanced English', 'English', 'Y', 150.00)
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price) VALUES (16, 12, 'History 102', 'Advanced History', 'History', 'N', 150.00)
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price) VALUES (17, 14, 'Geography 102', 'Advanced Geography', 'Geography', 'Y', 150.00)
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price) VALUES (18, 16, 'Computer Science 102', 'Advanced Computer Science', 'Computer Science', 'N', 150.00)
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price) VALUES (19, 18, 'Art 102', 'Advanced Art', 'Art', 'Y', 150.00)
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price) VALUES (20, 20, 'Music 102', 'Advanced Music', 'Music', 'N', 150.00)
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price) VALUES (21, 2, 'Math 103', 'Calculus', 'Mathematics', 'Y', 200.00)
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price) VALUES (22, 4, 'Physics 103', 'Quantum Physics', 'Physics', 'Y', 200.00)
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price) VALUES (23, 6, 'Chemistry 103', 'Organic Chemistry', 'Chemistry', 'N', 200.00)
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price) VALUES (24, 8, 'Biology 103', 'Genetics', 'Biology', 'Y', 200.00)
    INTO Courses (CourseID, InstructorID, Title, Description, Industry, IsCertified, Price) VALUES (25, 10, 'English 103', 'Literature', 'English', 'N', 200.00)
SELECT * FROM dual;

-- Inserting Entries into Enrollments Table
INSERT ALL
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (1, 1, 1, TO_DATE('2024-01-01', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (2, 1, 2, TO_DATE('2024-01-02', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (3, 1, 3, TO_DATE('2024-01-03', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (4, 2, 4, TO_DATE('2024-01-04', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (5, 3, 2, TO_DATE('2024-01-05', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (6, 3, 5, TO_DATE('2024-01-06', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (7, 4, 6, TO_DATE('2024-01-07', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (8, 5, 1, TO_DATE('2024-01-08', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (9, 6, 3, TO_DATE('2024-01-09', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (10, 7, 7, TO_DATE('2024-01-10', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (11, 8, 4, TO_DATE('2024-01-11', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (12, 9, 5, TO_DATE('2024-01-12', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (13, 10, 6, TO_DATE('2024-01-13', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (14, 11, 1, TO_DATE('2024-01-14', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (15, 12, 8, TO_DATE('2024-01-15', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (16, 13, 10, TO_DATE('2024-01-16', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (17, 14, 2, TO_DATE('2024-01-17', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (18, 15, 4, TO_DATE('2024-01-18', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (19, 16, 9, TO_DATE('2024-01-19', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (20, 17, 3, TO_DATE('2024-01-20', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (21, 18, 7, TO_DATE('2024-01-21', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (22, 19, 10, TO_DATE('2024-01-22', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (23, 20, 12, TO_DATE('2024-01-23', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (24, 21, 5, TO_DATE('2024-01-24', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (25, 22, 2, TO_DATE('2024-01-25', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (26, 23, 4, TO_DATE('2024-01-26', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (27, 24, 6, TO_DATE('2024-01-27', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (28, 25, 1, TO_DATE('2024-01-28', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (29, 3, 11, TO_DATE('2024-01-29', 'YYYY-MM-DD'))
    INTO Enrollments (EnrollmentID, UserID, CourseID, EnrollmentDate) VALUES (30, 5, 14, TO_DATE('2024-01-30', 'YYYY-MM-DD'))
SELECT * FROM dual;




-- Inserting Entries into Tests Table
INSERT ALL
    INTO Tests (TestID, CourseID, TestTitle, TestDescription) VALUES (1, 1, 'Midterm for Math 101', 'Midterm exam for Math 101')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription) VALUES (2, 2, 'Midterm for Physics 101', 'Midterm exam for Physics 101')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription) VALUES (3, 3, 'Midterm for Chemistry 101', 'Midterm exam for Chemistry 101')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription) VALUES (4, 4, 'Midterm for Biology 101', 'Midterm exam for Biology 101')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription) VALUES (5, 5, 'Midterm for English 101', 'Midterm exam for English 101')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription) VALUES (6, 6, 'Midterm for History 101', 'Midterm exam for History 101')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription) VALUES (7, 7, 'Midterm for Geography 101', 'Midterm exam for Geography 101')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription) VALUES (8, 8, 'Midterm for Computer Science 101', 'Midterm exam for Computer Science 101')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription) VALUES (9, 9, 'Midterm for Art 101', 'Midterm exam for Art 101')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription) VALUES (10, 10, 'Midterm for Music 101', 'Midterm exam for Music 101')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription) VALUES (11, 11, 'Midterm for Math 102', 'Midterm exam for Math 102')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription) VALUES (12, 12, 'Midterm for Physics 102', 'Midterm exam for Physics 102')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription) VALUES (13, 13, 'Midterm for Chemistry 102', 'Midterm exam for Chemistry 102')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription) VALUES (14, 14, 'Midterm for Biology 102', 'Midterm exam for Biology 102')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription) VALUES (15, 15, 'Midterm for English 102', 'Midterm exam for English 102')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription) VALUES (16, 16, 'Midterm for History 102', 'Midterm exam for History 102')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription) VALUES (17, 17, 'Midterm for Geography 102', 'Midterm exam for Geography 102')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription) VALUES (18, 18, 'Midterm for Computer Science 102', 'Midterm exam for Computer Science 102')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription) VALUES (19, 19, 'Midterm for Art 102', 'Midterm exam for Art 102')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription) VALUES (20, 20, 'Midterm for Music 102', 'Midterm exam for Music 102')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription) VALUES (21, 21, 'Midterm for Math 103', 'Midterm exam for Math 103')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription) VALUES (22, 22, 'Midterm for Physics 103', 'Midterm exam for Physics 103')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription) VALUES (23, 23, 'Midterm for Chemistry 103', 'Midterm exam for Chemistry 103')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription) VALUES (24, 24, 'Midterm for Biology 103', 'Midterm exam for Biology 103')
    INTO Tests (TestID, CourseID, TestTitle, TestDescription) VALUES (25, 25, 'Midterm for English 103', 'Midterm exam for English 103')
SELECT * FROM dual;


-- Inserting Entries into Scores Table
INSERT ALL
    INTO Scores (ScoreID, TestID, UserID, Score) VALUES (1, 1, 1, 85)
    INTO Scores (ScoreID, TestID, UserID, Score) VALUES (2, 2, 3, 90)
    INTO Scores (ScoreID, TestID, UserID, Score) VALUES (3, 3, 5, 95)
    INTO Scores (ScoreID, TestID, UserID, Score) VALUES (4, 4, 7, 80)
    INTO Scores (ScoreID, TestID, UserID, Score) VALUES (5, 5, 9, 70)
    INTO Scores (ScoreID, TestID, UserID, Score) VALUES (6, 6, 11, 60)
    INTO Scores (ScoreID, TestID, UserID, Score) VALUES (7, 7, 13, 50)
    INTO Scores (ScoreID, TestID, UserID, Score) VALUES (8, 8, 15, 95)
    INTO Scores (ScoreID, TestID, UserID, Score) VALUES (9, 9, 17, 75)
    INTO Scores (ScoreID, TestID, UserID, Score) VALUES (10, 10, 19, 85)
    INTO Scores (ScoreID, TestID, UserID, Score) VALUES (11, 11, 21, 65)
    INTO Scores (ScoreID, TestID, UserID, Score) VALUES (12, 12, 23, 55)
    INTO Scores (ScoreID, TestID, UserID, Score) VALUES (13, 13, 25, 100)
    INTO Scores (ScoreID, TestID, UserID, Score) VALUES (14, 14, 1, 90)
    INTO Scores (ScoreID, TestID, UserID, Score) VALUES (15, 15, 3, 95)
    INTO Scores (ScoreID, TestID, UserID, Score) VALUES (16, 16, 5, 80)
    INTO Scores (ScoreID, TestID, UserID, Score) VALUES (17, 17, 7, 70)
    INTO Scores (ScoreID, TestID, UserID, Score) VALUES (18, 18, 9, 60)
    INTO Scores (ScoreID, TestID, UserID, Score) VALUES (19, 19, 11, 50)
    INTO Scores (ScoreID, TestID, UserID, Score) VALUES (20, 20, 13, 95)
    INTO Scores (ScoreID, TestID, UserID, Score) VALUES (21, 21, 15, 75)
    INTO Scores (ScoreID, TestID, UserID, Score) VALUES (22, 22, 17, 85)
    INTO Scores (ScoreID, TestID, UserID, Score) VALUES (23, 23, 19, 65)
    INTO Scores (ScoreID, TestID, UserID, Score) VALUES (24, 24, 21, 55)
    INTO Scores (ScoreID, TestID, UserID, Score) VALUES (25, 25, 23, 100)
SELECT * FROM dual;


-- Inserting Entries into Certifications Table
INSERT ALL
    INTO Certifications (CertificationID, CourseID, UserID, CertificationDate) VALUES (1, 1, 1, TO_DATE('2024-01-10', 'YYYY-MM-DD'))
    INTO Certifications (CertificationID, CourseID, UserID, CertificationDate) VALUES (2, 2, 2, TO_DATE('2024-02-15', 'YYYY-MM-DD'))
    INTO Certifications (CertificationID, CourseID, UserID, CertificationDate) VALUES (3, 4, 3, TO_DATE('2024-03-20', 'YYYY-MM-DD'))
    INTO Certifications (CertificationID, CourseID, UserID, CertificationDate) VALUES (4, 6, 4, TO_DATE('2024-04-25', 'YYYY-MM-DD'))
    INTO Certifications (CertificationID, CourseID, UserID, CertificationDate) VALUES (5, 8, 5, TO_DATE('2024-05-30', 'YYYY-MM-DD'))
    INTO Certifications (CertificationID, CourseID, UserID, CertificationDate) VALUES (6, 10, 6, TO_DATE('2024-06-05', 'YYYY-MM-DD'))
    INTO Certifications (CertificationID, CourseID, UserID, CertificationDate) VALUES (7, 11, 1, TO_DATE('2024-07-10', 'YYYY-MM-DD'))
    INTO Certifications (CertificationID, CourseID, UserID, CertificationDate) VALUES (8, 13, 2, TO_DATE('2024-08-15', 'YYYY-MM-DD'))
    INTO Certifications (CertificationID, CourseID, UserID, CertificationDate) VALUES (9, 15, 3, TO_DATE('2024-09-20', 'YYYY-MM-DD'))
    INTO Certifications (CertificationID, CourseID, UserID, CertificationDate) VALUES (10, 17, 4, TO_DATE('2024-10-25', 'YYYY-MM-DD'))
    INTO Certifications (CertificationID, CourseID, UserID, CertificationDate) VALUES (11, 19, 5, TO_DATE('2024-11-30', 'YYYY-MM-DD'))
    INTO Certifications (CertificationID, CourseID, UserID, CertificationDate) VALUES (12, 21, 6, TO_DATE('2024-12-15', 'YYYY-MM-DD'))
    INTO Certifications (CertificationID, CourseID, UserID, CertificationDate) VALUES (13, 22, 1, TO_DATE('2025-01-05', 'YYYY-MM-DD'))
    INTO Certifications (CertificationID, CourseID, UserID, CertificationDate) VALUES (14, 24, 2, TO_DATE('2025-01-15', 'YYYY-MM-DD'))
    INTO Certifications (CertificationID, CourseID, UserID, CertificationDate) VALUES (15, 1, 3, TO_DATE('2025-02-10', 'YYYY-MM-DD'))
    INTO Certifications (CertificationID, CourseID, UserID, CertificationDate) VALUES (16, 2, 4, TO_DATE('2025-02-20', 'YYYY-MM-DD'))
    INTO Certifications (CertificationID, CourseID, UserID, CertificationDate) VALUES (17, 4, 5, TO_DATE('2025-03-15', 'YYYY-MM-DD'))
    INTO Certifications (CertificationID, CourseID, UserID, CertificationDate) VALUES (18, 6, 6, TO_DATE('2025-03-25', 'YYYY-MM-DD'))
    INTO Certifications (CertificationID, CourseID, UserID, CertificationDate) VALUES (19, 8, 1, TO_DATE('2025-04-05', 'YYYY-MM-DD'))
    INTO Certifications (CertificationID, CourseID, UserID, CertificationDate) VALUES (20, 10, 2, TO_DATE('2025-04-15', 'YYYY-MM-DD'))
SELECT * FROM dual;




-- Inserting Entries into Advertisements Table
INSERT ALL
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue) VALUES (1, 1, 'Learn Python', 'Get started with Python programming!', 500.00)
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue) VALUES (2, 2, 'JavaScript Essentials', 'Master JavaScript for web development.', 600.00)
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue) VALUES (3, 3, 'Data Science Bootcamp', 'Become a data scientist in 12 weeks.', 800.00)
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue) VALUES (4, 4, 'Digital Marketing', 'Learn the secrets of digital marketing.', 300.00)
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue) VALUES (5, 5, 'Graphic Design Basics', 'Start your journey in graphic design.', 200.00)
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue) VALUES (6, 6, 'AI and Machine Learning', 'Dive into AI and machine learning.', 750.00)
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue) VALUES (7, 7, 'Cloud Computing', 'Understanding cloud computing concepts.', 400.00)
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue) VALUES (8, 8, 'Blockchain Fundamentals', 'Learn the basics of blockchain.', 500.00)
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue) VALUES (9, 9, 'Cybersecurity Essentials', 'Protect yourself in the digital world.', 600.00)
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue) VALUES (10, 10, 'Photography for Beginners', 'Capture stunning photos with ease.', 350.00)
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue) VALUES (11, 11, 'Web Development', 'Build your own website from scratch.', 700.00)
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue) VALUES (12, 12, 'SEO Strategies', 'Improve your website’s search ranking.', 450.00)
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue) VALUES (13, 13, 'Public Speaking', 'Become a confident speaker.', 500.00)
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue) VALUES (14, 14, 'Financial Literacy', 'Manage your finances effectively.', 300.00)
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue) VALUES (15, 15, 'Creative Writing', 'Unleash your writing potential.', 250.00)
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue) VALUES (16, 16, 'Excel for Professionals', 'Master Excel for your career.', 400.00)
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue) VALUES (17, 17, 'Project Management', 'Learn the fundamentals of project management.', 500.00)
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue) VALUES (18, 18, 'Leadership Skills', 'Enhance your leadership abilities.', 600.00)
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue) VALUES (19, 19, 'Mobile App Development', 'Create your own mobile app.', 800.00)
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue) VALUES (20, 20, 'Game Development', 'Start creating your own games.', 700.00)
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue) VALUES (21, 21, 'Virtual Reality Basics', 'Explore the world of VR.', 600.00)
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue) VALUES (22, 22, 'Introduction to Sociology', 'Understand societal structures.', 350.00)
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue) VALUES (23, 23, 'Philosophy 101', 'Dive into philosophical concepts.', 300.00)
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue) VALUES (24, 24, 'Cooking Basics', 'Learn to cook delicious meals.', 200.00)
    INTO Advertisements (AdID, CourseID, AdTitle, AdDescription, Revenue) VALUES (25, 25, 'Travel Photography', 'Capture the essence of your travels.', 400.00)
SELECT * FROM dual;


-- Inserting Entries into CourseFeedback Table
INSERT ALL
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Comments, Rating) VALUES (1, 1, 1, 'Great course!', 5)
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Comments, Rating) VALUES (2, 1, 2, 'Very informative.', 4)
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Comments, Rating) VALUES (3, 2, 3, 'Good content, but too long.', 3)
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Comments, Rating) VALUES (4, 2, 4, 'Learned a lot!', 5)
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Comments, Rating) VALUES (5, 3, 5, 'Could be better.', 2)
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Comments, Rating) VALUES (6, 3, 6, 'Excellent!', 5)
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Comments, Rating) VALUES (7, 4, 7, 'Very useful.', 4)
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Comments, Rating) VALUES (8, 4, 8, 'I enjoyed it.', 4)
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Comments, Rating) VALUES (9, 5, 9, 'Not what I expected.', 3)
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Comments, Rating) VALUES (10, 5, 10, 'Would recommend!', 5)
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Comments, Rating) VALUES (11, 6, 11, 'Very engaging.', 5)
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Comments, Rating) VALUES (12, 6, 12, 'Too fast-paced.', 3)
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Comments, Rating) VALUES (13, 7, 13, 'Great instructor!', 5)
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Comments, Rating) VALUES (14, 7, 14, 'Content was relevant.', 4)
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Comments, Rating) VALUES (15, 8, 15, 'Learned practical skills.', 5)
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Comments, Rating) VALUES (16, 8, 16, 'Needs more examples.', 3)
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Comments, Rating) VALUES (17, 9, 17, 'Good balance of theory and practice.', 4)
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Comments, Rating) VALUES (18, 9, 18, 'Had some technical issues.', 2)
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Comments, Rating) VALUES (19, 10, 19, 'Overall, a good experience.', 4)
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Comments, Rating) VALUES (20, 10, 20, 'Would take another course!', 5)
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Comments, Rating) VALUES (21, 1, 21, 'Fantastic!', 5)
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Comments, Rating) VALUES (22, 2, 22, 'Very helpful.', 4)
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Comments, Rating) VALUES (23, 3, 23, 'Interesting material.', 3)
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Comments, Rating) VALUES (24, 4, 24, 'Good structure.', 4)
    INTO CourseFeedback (FeedbackID, CourseID, UserID, Comments, Rating) VALUES (25, 5, 25, 'Could use improvement.', 2)
SELECT * FROM dual;


COMMIT;

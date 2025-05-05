-- DBS211 Final Project
--
-- Online Education Platform
-- (TeachMe)
--
-- Advanced Queries and Business Reports

-- Set autocommit to OFF to ensure all operations are explicit

-- Table Creation for Final Project

SET AUTOCOMMIT OFF;

-- Users Table
CREATE TABLE Users (
    UserID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(50) NOT NULL,
    LastName VARCHAR2(50) NOT NULL,
    Email VARCHAR2(100) NOT NULL UNIQUE,
    Password VARCHAR2(255) NOT NULL,
    Role VARCHAR2(20) NOT NULL CHECK (Role IN ('Student', 'Instructor'))
);

-- Profiles Table
CREATE TABLE Profiles (
    ProfileID NUMBER PRIMARY KEY,
    UserID NUMBER NOT NULL,
    Bio VARCHAR2(125),
    Industry VARCHAR2(50),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Courses Table
CREATE TABLE Courses (
    CourseID NUMBER PRIMARY KEY,
    InstructorID NUMBER NOT NULL,
    Title VARCHAR2(100) NOT NULL UNIQUE,
    Description VARCHAR2(125),
    Industry VARCHAR2(50),
    IsCertified CHAR(1) DEFAULT 'N' CHECK (IsCertified IN ('Y', 'N')),
    Price NUMBER(10,2) DEFAULT 0.00 NOT NULL,
    FOREIGN KEY (InstructorID) REFERENCES Users(UserID)
);

-- Enrollments Table
CREATE TABLE Enrollments (
    EnrollmentID NUMBER PRIMARY KEY,
    CourseID NUMBER NOT NULL,
    UserID NUMBER NOT NULL,
    EnrollmentDate DATE DEFAULT SYSDATE NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Tests Table
CREATE TABLE Tests (
    TestID NUMBER PRIMARY KEY,
    CourseID NUMBER NOT NULL,
    TestTitle VARCHAR2(100) NOT NULL UNIQUE,
    TestDescription VARCHAR2(255),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Scores Table
CREATE TABLE Scores (
    ScoreID NUMBER PRIMARY KEY,
    TestID NUMBER NOT NULL,
    UserID NUMBER NOT NULL,
    Score NUMBER(5,2) CHECK (Score BETWEEN 0 AND 100),
    MaximumMarks NUMBER(5,2) DEFAULT 100.00 NOT NULL, -- Maximum marks for the test
    PassingMarks NUMBER(5,2) DEFAULT 0.00 NOT NULL, -- Marks required to pass the test
    FOREIGN KEY (TestID) REFERENCES Tests(TestID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Advertisements Table
CREATE TABLE Advertisements (
    AdID NUMBER PRIMARY KEY,
    CourseID NUMBER NOT NULL,
    AdTitle VARCHAR2(100) NOT NULL UNIQUE,
    AdDescription VARCHAR2(255),
    Revenue NUMBER(10,2) DEFAULT 0.00 NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- CourseFeedback Table
CREATE TABLE CourseFeedback (
    FeedbackID NUMBER PRIMARY KEY,
    CourseID NUMBER NOT NULL,
    UserID NUMBER NOT NULL,
    Rating NUMBER(1) CHECK (Rating BETWEEN 1 AND 5),
    Comments VARCHAR2(125),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Certifications Table
CREATE TABLE Certifications (
    CertificationID NUMBER PRIMARY KEY,
    CourseID NUMBER NOT NULL,
    UserID NUMBER NOT NULL,
    CertificationDate DATE DEFAULT SYSDATE NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);


COMMIT;

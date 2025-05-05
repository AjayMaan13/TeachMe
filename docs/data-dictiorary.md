# Data Dictionary - TeachMe Online Education Platform

This document provides a detailed description of the database schema for the TeachMe online education platform, including tables, columns, data types, constraints, and relationships.

## 1. Users Table

Stores information about all users of the platform, including both students and instructors.

| Column | Data Type | Size | Default | PK/FK | Required | Range | Description | Constraints |
|--------|-----------|------|---------|-------|----------|-------|-------------|-------------|
| UserID | NUMBER | - | - | PK | Yes | - | Unique identifier for each user | UNIQUE |
| FirstName | VARCHAR2 | 50 | - | - | Yes | - | User's first name | - |
| LastName | VARCHAR2 | 50 | - | - | Yes | - | User's last name | - |
| Email | VARCHAR2 | 100 | - | - | Yes | - | User's email address | UNIQUE |
| Password | VARCHAR2 | 255 | - | - | Yes | - | User's password (hashed in production) | - |
| Role | VARCHAR2 | 20 | - | - | Yes | - | User's role in the system | CHECK (Role IN ('Student', 'Instructor')) |

### Indexes
- PRIMARY KEY on UserID
- UNIQUE INDEX on Email

### Relationships
- One-to-one with Profiles
- One-to-many with Enrollments
- One-to-many with Courses (as Instructor)
- One-to-many with Scores
- One-to-many with CourseFeedback
- One-to-many with Certifications

## 2. Profiles Table

Contains additional profile information for users.

| Column | Data Type | Size | Default | PK/FK | Required | Range | Description | Constraints |
|--------|-----------|------|---------|-------|----------|-------|-------------|-------------|
| ProfileID | NUMBER | - | - | PK | Yes | - | Unique identifier for each profile | UNIQUE |
| UserID | NUMBER | - | - | FK | Yes | - | Reference to Users table | REFERENCES Users(UserID) |
| Bio | VARCHAR2 | 125 | - | - | No | - | User's biography | - |
| ProfilePicture | VARCHAR2 | - | - | - | No | - | URL to profile picture | - |
| Industry | VARCHAR2 | 50 | - | - | No | - | User's industry | - |

### Indexes
- PRIMARY KEY on ProfileID
- FOREIGN KEY on UserID

### Relationships
- One-to-one with Users

## 3. Courses Table

Stores information about all courses available on the platform.

| Column | Data Type | Size | Default | PK/FK | Required | Range | Description | Constraints |
|--------|-----------|------|---------|-------|----------|-------|-------------|-------------|
| CourseID | NUMBER | - | - | PK | Yes | - | Unique identifier for each course | UNIQUE |
| InstructorID | NUMBER | - | - | FK | Yes | - | Reference to Users table | REFERENCES Users(UserID) |
| Title | VARCHAR2 | 100 | - | - | Yes | - | Course title | UNIQUE |
| Description | VARCHAR2 | 125 | - | - | No | - | Course description | - |
| Industry | VARCHAR2 | 50 | - | - | No | - | Course industry category | - |
| IsCertified | CHAR | 1 | 'N' | - | Yes | - | Indicates if course offers certification | CHECK (IsCertified IN ('Y', 'N')) |
| Price | NUMBER | 10,2 | 0.00 | - | Yes | - | Course price | - |

### Indexes
- PRIMARY KEY on CourseID
- FOREIGN KEY on InstructorID
- INDEX on Industry for searching

### Relationships
- Many-to-one with Users (Instructor)
- One-to-many with Enrollments
- One-to-many with Tests
- One-to-many with Advertisements
- One-to-many with CourseFeedback
- One-to-many with Certifications

## 4. Enrollments Table

Tracks student enrollments in courses.

| Column | Data Type | Size | Default | PK/FK | Required | Range | Description | Constraints |
|--------|-----------|------|---------|-------|----------|-------|-------------|-------------|
| EnrollmentID | NUMBER | - | - | PK | Yes | - | Unique identifier for each enrollment | UNIQUE |
| CourseID | NUMBER | - | - | FK | Yes | - | Reference to Courses table | REFERENCES Courses(CourseID) |
| UserID | NUMBER | - | - | FK | Yes | - | Reference to Users table | REFERENCES Users(UserID) |
| EnrollmentDate | DATE | - | SYSDATE | - | Yes | - | Date of enrollment | - |

### Indexes
- PRIMARY KEY on EnrollmentID
- FOREIGN KEY on CourseID
- FOREIGN KEY on UserID

### Relationships
- Many-to-one with Users
- Many-to-one with Courses

## 5. Tests Table

Contains information about tests associated with courses.

| Column | Data Type | Size | Default | PK/FK | Required | Range | Description | Constraints |
|--------|-----------|------|---------|-------|----------|-------|-------------|-------------|
| TestID | NUMBER | - | - | PK | Yes | - | Unique identifier for each test | UNIQUE |
| CourseID | NUMBER | - | - | FK | Yes | - | Reference to Courses table | REFERENCES Courses(CourseID) |
| TestTitle | VARCHAR2 | 100 | - | - | Yes | - | Test title | UNIQUE |
| TestDescription | VARCHAR2 | 255 | - | - | No | - | Test description | - |

### Indexes
- PRIMARY KEY on TestID
- FOREIGN KEY on CourseID

### Relationships
- Many-to-one with Courses
- One-to-many with Scores

## 6. Scores Table

Records student scores on tests.

| Column | Data Type | Size | Default | PK/FK | Required | Range | Description | Constraints |
|--------|-----------|------|---------|-------|----------|-------|-------------|-------------|
| ScoreID | NUMBER | - | - | PK | Yes | - | Unique identifier for each score record | UNIQUE |
| TestID | NUMBER | - | - | FK | Yes | - | Reference to Tests table | REFERENCES Tests(TestID) |
| UserID | NUMBER | - | - | FK | Yes | - | Reference to Users table | REFERENCES Users(UserID) |
| Score | NUMBER | 5,2 | - | - | Yes | 0-100 | Student's score | CHECK (Score BETWEEN 0 AND 100) |
| MaximumMarks | NUMBER | 5,2 | 100.00 | - | Yes | - | Maximum possible marks | - |
| PassingMarks | NUMBER | 5,2 | 0.00 | - | Yes | - | Marks required to pass | - |

### Indexes
- PRIMARY KEY on ScoreID
- FOREIGN KEY on TestID
- FOREIGN KEY on UserID

### Relationships
- Many-to-one with Tests
- Many-to-one with Users

## 7. Advertisements Table

Manages advertisements associated with courses.

| Column | Data Type | Size | Default | PK/FK | Required | Range | Description | Constraints |
|--------|-----------|------|---------|-------|----------|-------|-------------|-------------|
| AdID | NUMBER | - | - | PK | Yes | - | Unique identifier for each advertisement | UNIQUE |
| CourseID | NUMBER | - | - | FK | Yes | - | Reference to Courses table | REFERENCES Courses(CourseID) |
| AdTitle | VARCHAR2 | 100 | - | - | Yes | - | Advertisement title | UNIQUE |
| AdDescription | VARCHAR2 | 255 | - | - | No | - | Advertisement description | - |
| Revenue | NUMBER | 10,2 | 0.00 | - | Yes | - | Revenue generated from advertisement | - |

### Indexes
- PRIMARY KEY on AdID
- FOREIGN KEY on CourseID

### Relationships
- Many-to-one with Courses

## 8. CourseFeedback Table

Stores student feedback and ratings for courses.

| Column | Data Type | Size | Default | PK/FK | Required | Range | Description | Constraints |
|--------|-----------|------|---------|-------|----------|-------|-------------|-------------|
| FeedbackID | NUMBER | - | - | PK | Yes | - | Unique identifier for each feedback | UNIQUE |
| CourseID | NUMBER | - | - | FK | Yes | - | Reference to Courses table | REFERENCES Courses(CourseID) |
| UserID | NUMBER | - | - | FK | Yes | - | Reference to Users table | REFERENCES Users(UserID) |
| Rating | NUMBER | 1 | - | - | Yes | 1-5 | Course rating (1-5 stars) | CHECK (Rating BETWEEN 1 AND 5) |
| Comments | VARCHAR2 | 125 | - | - | No | - | Feedback comments | - |

### Indexes
- PRIMARY KEY on FeedbackID
- FOREIGN KEY on CourseID
- FOREIGN KEY on UserID

### Relationships
- Many-to-one with Courses
- Many-to-one with Users

## 9. Certifications Table

Tracks course certifications awarded to students.

| Column | Data Type | Size | Default | PK/FK | Required | Range | Description | Constraints |
|--------|-----------|------|---------|-------|----------|-------|-------------|-------------|
| CertificationID | NUMBER | - | - | PK | Yes | - | Unique identifier for each certification | UNIQUE |
| CourseID | NUMBER | - | - | FK | Yes | - | Reference to Courses table | REFERENCES Courses(CourseID) |
| UserID | NUMBER | - | - | FK | Yes | - | Reference to Users table | REFERENCES Users(UserID) |
| CertificationDate | DATE | - | SYSDATE | - | Yes | - | Date certification was awarded | - |

### Indexes
- PRIMARY KEY on CertificationID
- FOREIGN KEY on CourseID
- FOREIGN KEY on UserID

### Relationships
- Many-to-one with Courses
- Many-to-one with Users

## Entity Relationship Diagram

For a visual representation of these tables and their relationships, please refer to the ERD.png file in the docs directory.
# Business Rules - TeachMe Online Education Platform

This document outlines the business rules that govern the TeachMe online education platform database. These rules ensure data integrity, maintain logical relationships between entities, and support the platform's operational requirements.

## 1. User Management

### 1.1 User and Profiles
- Each user must have one and only one profile.
- Each profile must belong to one and only one user.
- User deletion must cascade to profile deletion.
- Email addresses must be unique across all users.
- Users must have either 'Student' or 'Instructor' role.

### 1.2 User Authentication
- Passwords must be stored securely (in production environment, these would be hashed).
- Email addresses serve as unique identifiers for authentication.

## 2. Course Management

### 2.1 Course Creation and Ownership
- Each course must have exactly one instructor (user with 'Instructor' role).
- Course titles must be unique across the platform.
- Courses must have a non-negative price.
- Courses can optionally be marked as certification-eligible.

### 2.2 User, Enrollments, and Courses
- Each user can have zero or many enrollments.
- Each enrollment must belong to one and only one user.
- Each course can have zero or many enrollments.
- Each enrollment must be for one and only one course.
- A user cannot enroll in the same course more than once.

## 3. Assessment System

### 3.1 Course and Tests
- Each course can have zero or many tests.
- Each test must belong to one and only one course.
- Test titles must be unique across the platform.

### 3.2 Tests and Scores
- Each test can have zero or many scores (one per student).
- Each score must be associated with exactly one test.
- Scores must be within the valid range (0-100).
- A student can only have one score entry per test.

### 3.3 Scores and Users
- Each user (student) can have zero or many scores.
- Each score must belong to one and only one user.
- Only users with 'Student' role can have scores.

## 4. Feedback and Rating System

### 4.1 Course and Feedback
- Each course can receive zero or many feedbacks.
- Each feedback must be for one and only one course.
- Feedback ratings must be between 1 and 5.
- A user can provide only one feedback per course.
- A user must be enrolled in a course to provide feedback.

## 5. Advertisement System

### 5.1 Course and Advertisement
- Each course can have zero or many advertisements.
- Each advertisement must be for one and only one course.
- Advertisement titles must be unique.
- Advertisement revenue must be non-negative.

## 6. Certification System

### 6.1 Certifications
- Each course can have zero or many certifications issued.
- Each certification must belong to one and only one course.
- Each user can receive zero or many certifications.
- Each certification must be issued to one and only one user.
- A certification can only be issued for courses where IsCertified = 'Y'.
- A user must complete all tests in a course to be eligible for certification.
- A user cannot receive multiple certifications for the same course.

## 7. Data Integrity Rules

### 7.1 Deletion Rules
- Deleting a user should cascade to delete associated profiles, enrollments, scores, feedbacks, and certifications.
- Deleting a course should cascade to delete associated enrollments, tests, advertisements, feedbacks, and certifications.
- Deleting a test should cascade to delete all associated scores.

### 7.2 Update Rules
- Updates to UserID, CourseID, and TestID in primary tables should cascade to related tables.
- Course price updates should not affect existing enrollments.

## 8. Business Operation Rules

### 8.1 Revenue Calculation
- Platform revenue is calculated from course enrollments and advertisement revenue.
- Course revenue is calculated by multiplying the number of enrollments by the course price.
- Total revenue is the sum of course revenue and advertisement revenue.

### 8.2 Performance Metrics
- Student performance is measured by average test scores.
- Course effectiveness is measured by completion rates and average scores.
- Instructor performance is evaluated by enrollment numbers, student ratings, and completion rates.

These business rules form the foundation of the TeachMe platform's database design and operations, ensuring data consistency and supporting the platform's educational mission.
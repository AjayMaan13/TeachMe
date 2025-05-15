# 🎓 TeachMe Online Education Platform - Database Project

[![Oracle](https://img.shields.io/badge/Oracle-12c+-red.svg)](https://www.oracle.com/database/)
[![Docker](https://img.shields.io/badge/Docker-Containerized-blue.svg)](https://www.docker.com/)
[![SQL](https://img.shields.io/badge/SQL-Advanced-brightgreen.svg)](https://en.wikipedia.org/wiki/SQL)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

> **Comprehensive database design for an online education platform featuring advanced SQL programming, business intelligence, and containerized deployment**

---

## 📋 Project Overview

**TeachMe** is a sophisticated database system powering an online education platform that connects instructors and students through diverse courses. The project demonstrates advanced database design principles, complex SQL queries, and modern deployment practices using Docker containerization.

**🗓️ Development Timeline:** 2024 - 2025  
**👨‍💻 Developer:** Ajaypartap Singh Maan  
**📧 Contact:** ajayapsmaanm13@gmail.com  

---

## 🛠️ Technologies & Skills Demonstrated

### **Database Technologies**
- **Oracle Database 12c+** - Enterprise-grade relational database system
- **Oracle XE (Express Edition)** - Lightweight version for development
- **SQL*Plus** - Oracle's command-line interface for database interaction
- **PL/SQL** - Oracle's procedural extension to SQL (demonstrated in views)

### **Containerization & DevOps**
- **Docker** - Containerization for consistent development environments
- **Docker Compose** - Multi-service application orchestration
- **Oracle Container Registry** - Official Oracle Docker images
- **Volume Management** - Persistent data storage across container lifecycles

### **Database Design & Architecture**
- **Entity-Relationship Modeling** - Complete ER diagram design
- **Database Normalization** - 3NF compliance for data integrity
- **Referential Integrity** - Foreign key constraints and cascading rules
- **Schema Design** - Logical and physical database structure
- **Index Optimization** - Strategic indexing for performance

### **Advanced SQL Programming**
- **Data Definition Language (DDL)** - Table creation, constraints, indexes
- **Data Manipulation Language (DML)** - Complex INSERT, UPDATE, DELETE operations
- **Data Query Language (DQL)** - Advanced SELECT queries with joins
- **Window Functions** - RANK(), ROW_NUMBER(), LAG(), analytics
- **Aggregate Functions** - COUNT(), SUM(), AVG(), MIN(), MAX()
- **Subqueries** - Correlated and non-correlated subqueries
- **Common Table Expressions (CTEs)** - Complex data analysis
- **Views and Materialized Views** - Business intelligence layer

### **Business Intelligence & Analytics**
- **Analytical Views** - Pre-computed business metrics
- **Complex Reporting** - Multi-dimensional data analysis
- **Performance Dashboards** - Real-time KPI monitoring
- **Trend Analysis** - Time-series data analysis
- **Revenue Analytics** - Financial reporting and analysis

### **Software Engineering Practices**
- **Version Control** - Git for code management
- **Documentation** - Comprehensive technical documentation
- **Script Organization** - Modular SQL script structure
- **Error Handling** - Robust database operations
- **Data Integrity** - Constraints and validation rules

---

## 🏗️ Database Architecture

### **Entity Relationship Model**
```
Users (1:1) Profiles
Users (1:M) Courses (as Instructor)
Users (1:M) Enrollments (as Student)
Courses (1:M) Tests
Tests (1:M) Scores
Courses (1:M) Advertisements
Courses (1:M) CourseFeedback
Courses (1:M) Certifications
```

### **Core Tables & Relationships**
- **Users** - Central user management (students & instructors)
- **Profiles** - Extended user information and bios
- **Courses** - Course catalog with pricing and certification options
- **Enrollments** - Student-course enrollment tracking
- **Tests** - Assessment management system
- **Scores** - Student performance tracking
- **Advertisements** - Course marketing and revenue
- **CourseFeedback** - Rating and review system
- **Certifications** - Achievement tracking system

---

## ✨ Key Features & Functionality

### **📊 Business Intelligence**
- **Course Performance Analytics** - Enrollment trends, completion rates
- **Student Progress Tracking** - Performance metrics, certification tracking
- **Instructor Evaluation** - Course load, ratings, revenue generation
- **Financial Reporting** - Revenue analysis, growth tracking
- **Industry Insights** - Cross-industry performance comparisons

### **🔍 Advanced Querying**
- **Complex Joins** - Multi-table relationships and data aggregation
- **Window Functions** - Ranking, running totals, moving averages
- **Analytical Functions** - Statistical analysis and trend detection
- **Subquery Optimization** - Efficient nested query structures
- **Performance Tuning** - Query optimization and index utilization

### **📈 Reporting System**
- **Real-time Dashboards** - Live KPI monitoring
- **Financial Reports** - Revenue tracking and forecasting
- **Academic Analytics** - Student performance and course effectiveness
- **Trend Analysis** - Historical data patterns and predictions
- **Executive Summaries** - High-level business metrics

---

## 🚀 Installation & Deployment

### **Prerequisites**
```bash
# Docker & Docker Compose
docker --version
docker-compose --version

# Minimum System Requirements
- 4GB RAM (for Oracle XE container)
- 10GB free disk space
- Windows/Linux/macOS compatibility
```

### **Quick Start with Docker**
```bash
# Clone the repository
git clone https://github.com/yourusername/teachme-education-db.git
cd teachme-education-db

# Start the containerized database
docker-compose up -d

# Monitor initialization (first run takes 5-10 minutes)
docker logs -f teachme-oracle-db

# Verify the setup
docker exec -it teachme-oracle-db sqlplus system/teachme123@//localhost:1521/TEACHMEPDB
```

### **Database Connection Details**
```
Host: localhost
Port: 1521
Service Name: TEACHMEPDB
Username: system
Password: teachme123
```

### **Manual SQL Execution**
```bash
# Run individual SQL scripts
docker exec -it teachme-oracle-db bash -c "sqlplus system/teachme123@//localhost:1521/TEACHMEPDB @/opt/oracle/scripts/startup/01_create_tables.sql"

# Execute queries interactively
docker exec -it teachme-oracle-db sqlplus system/teachme123@//localhost:1521/TEACHMEPDB
```

---

## 📂 Project Structure

```
teachme-online-education-db/
├── 📁 docs/                    # Documentation
│   ├── ERD.png                 # Entity Relationship Diagram
│   ├── business-rules.md       # Business logic documentation
│   └── data-dictiorary.md      # Schema documentation
├── 📁 sql/                     # SQL Scripts
│   ├── 00_run_scripts.sh       # Automated setup script
│   ├── 01_create_tables.sql    # DDL statements
│   ├── 02_insert_sample_data.sql # Sample data population
│   ├── 03_create_views.sql     # Business intelligence views
│   ├── 04_queries_reports.sql  # Complex analytical queries
│   └── 05_drop_all.sql         # Cleanup script
├── 📁 reports/                 # Business Reports
│   └── business-reports.md     # Report descriptions
├── Dockerfile                  # Container configuration
├── docker-compose.yml          # Service orchestration
└── README.md                   # Project documentation
```

---

## 💡 Technical Highlights

### **Advanced SQL Techniques**
```sql
-- Window Functions for Analytics
SELECT 
    CourseID,
    Revenue,
    RANK() OVER (ORDER BY Revenue DESC) AS RevenueRank,
    LAG(Revenue) OVER (ORDER BY Month) AS PreviousMonthRevenue
FROM MonthlyRevenue;

-- Complex Subqueries
SELECT 
    InstructorName,
    (SELECT AVG(Rating) FROM CourseFeedback CF 
     WHERE CF.CourseID IN 
        (SELECT CourseID FROM Courses C WHERE C.InstructorID = I.UserID)
    ) AS AverageRating
FROM Users I WHERE Role = 'Instructor';

-- Analytical Views
CREATE VIEW vwCourseAnalytics AS
SELECT 
    c.CourseID,
    COUNT(DISTINCT e.UserID) AS TotalStudents,
    AVG(cf.Rating) AS AverageRating,
    SUM(c.Price * enrollment_count) AS TotalRevenue
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID;
```

### **Business Intelligence Features**
- **Performance Metrics** - Course effectiveness, student engagement
- **Revenue Analytics** - Financial tracking, growth analysis
- **Predictive Insights** - Trend analysis and forecasting
- **Executive Dashboards** - High-level KPI visualization
- **Drill-down Capabilities** - Detailed data exploration

### **Data Quality & Integrity**
- **Referential Integrity** - Foreign key constraints
- **Data Validation** - Check constraints and triggers
- **Normalization** - 3NF compliance for data consistency
- **Transaction Management** - ACID properties maintenance

---

## 📊 Sample Analytics & Reports

### **Course Performance Dashboard**
```sql
SELECT 
    CourseTitle,
    TotalEnrollments,
    AverageRating,
    CompletionRate,
    TotalRevenue
FROM vwCourseAnalytics
ORDER BY TotalRevenue DESC;
```

### **Student Achievement Report**
```sql
SELECT 
    StudentName,
    AVG(Score) AS AverageScore,
    COUNT(CertificationID) AS CertificationsEarned,
    PassRate
FROM vwStudentPerformanceOverview
WHERE AverageScore > 85;
```

### **Financial Performance Metrics**
- Monthly revenue trends
- Course profitability analysis
- Advertisement ROI tracking
- Student acquisition costs

---

## 🎯 Learning Outcomes & Skills

### **Database Management**
- **Schema Design** - Logical and physical database modeling
- **Performance Optimization** - Query tuning and indexing strategies
- **Data Integrity** - Constraint design and validation
- **Backup & Recovery** - Data protection strategies
- **Scalability Planning** - Growth-oriented design patterns

### **Business Analysis**
- **Requirements Gathering** - Stakeholder need assessment
- **Data Modeling** - Business process to database mapping
- **KPI Development** - Metric definition and tracking
- **Reporting Design** - Business intelligence solutions

### **Modern Development Practices**
- **Containerization** - Application deployment with Docker
- **Infrastructure as Code** - Automated environment setup
- **Version Control** - Git-based development workflow
- **Documentation** - Technical and business documentation

---

## 🚀 Future Enhancements & Roadmap

### **Technical Improvements**
- **Stored Procedures** - Advanced business logic implementation
- **Triggers** - Automated data processing and auditing
- **Partitioning** - Large table performance optimization
- **Replication** - High availability and disaster recovery
- **Security Enhancement** - Advanced authentication and authorization

### **Business Features**
- **Machine Learning Integration** - Predictive analytics
- **Real-time Analytics** - Stream processing capabilities
- **API Development** - RESTful services for application integration
- **Mobile Support** - Cross-platform accessibility
- **Advanced Reporting** - Interactive dashboards and visualizations

### **Scalability Solutions**
- **Microservices Architecture** - Distributed system design
- **NoSQL Integration** - Hybrid database solutions
- **Cloud Migration** - AWS/Azure deployment strategies
- **Performance Monitoring** - Real-time system health tracking

---

## 📈 Business Impact & Value

### **Educational Platform Benefits**
- **Course Management** - Streamlined content delivery
- **Student Tracking** - Comprehensive progress monitoring
- **Revenue Optimization** - Data-driven pricing strategies
- **Quality Assurance** - Feedback-based course improvement

### **Data-Driven Insights**
- **Enrollment Patterns** - Course popularity trends
- **Performance Analytics** - Student success metrics
- **Financial Intelligence** - Revenue optimization opportunities
- **Operational Efficiency** - Resource allocation optimization

---

## 📞 Contact & Professional Links

**Ajaypartap Singh Maan**  
📧 **Email:** ajayapsmaanm13@gmail.com  
💼 **LinkedIn:** [Ajaypartap Singh Maan](https://linkedin.com/in/ajaypartap-singh-maan)  
🐙 **GitHub:** [@AjayMaan13](https://github.com/AjayMaan13)  

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 📚 Documentation

For detailed technical documentation, please refer to:
- [Business Rules](docs/business-rules.md) - Platform governance and constraints
- [Data Dictionary](docs/data-dictiorary.md) - Complete schema reference
- [Business Reports](reports/business-reports.md) - Available analytics and reports

---


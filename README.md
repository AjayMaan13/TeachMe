# TeachMe Online Education Platform - Database Project

## Overview
TeachMe is an online education platform designed to connect instructors and students through a diverse range of courses. This repository contains the complete database implementation that powers the platform, supporting user management, course catalog, enrollments, assessments, advertisements, and certification features.

## Project Structure
```
teachme-online-education-db/
│
├── Dockerfile                  # Docker configuration
├── docker-compose.yml          # Docker Compose configuration
├── README.md                    # Project documentation
├── docs/                        # Documentation files
│   ├── ERD.png                  # Entity Relationship Diagram
│   ├── BusinessRules.md         # Business rules documentation
│   └── DataDictionary.md        # Detailed table and column descriptions
│
├── sql/                         # SQL scripts
│   ├── 00_run_scripts.sh        # Script to run SQL files in order
│   ├── 01_create_tables.sql     # Table creation scripts
│   ├── 02_insert_sample_data.sql# Sample data insertion
│   ├── 03_create_views.sql      # Business report views
│   ├── 04_queries_reports.sql   # Advanced queries and reports
│   └── 05_drop_all.sql          # Cleanup script
│
├── data/                        # Sample data files
│   └── sample_data.csv          # CSV format sample data
│
└── reports/                     # Business report documentation
    └── business_reports.md      # Detailed report descriptions
```

## Database Schema
The database consists of 9 tables:

- **Users**: Stores user credentials and role information
- **Profiles**: Contains detailed user profile information
- **Courses**: Stores course details including pricing and certification options
- **Enrollments**: Tracks student enrollments in courses
- **Tests**: Contains course assessment information
- **Scores**: Records student performance on tests
- **Advertisements**: Manages course-related advertisements
- **CourseFeedback**: Stores student ratings and comments
- **Certifications**: Tracks course completions and certifications

## Key Features

### User Management
- Registration and authentication
- Role-based access (Student/Instructor)
- Detailed user profiles

### Course Management
- Course creation and categorization
- Pricing options and certification paths
- Industry-specific categorization

### Learning Tools
- Comprehensive test and assessment system
- Performance tracking and analytics
- Course feedback and rating mechanism

### Business Intelligence
- Enrollment analytics
- Revenue tracking (course sales and advertisements)
- Student performance metrics
- Instructor workload analysis

## Business Reports
The platform includes several views for business intelligence:

1. **Course Enrollment Summary**: Track enrollment counts and course popularity
2. **Student Performance Overview**: Monitor student progress and test scores
3. **Course Feedback Ratings**: Analyze student satisfaction metrics
4. **Instructor Course Load**: Review instructor workload distribution
5. **Advertisement Revenue**: Track advertising performance and revenue

## Installation & Usage

### Method 1: Traditional Database Setup

#### Prerequisites
- Oracle Database 12c or higher (or compatible SQL database)
- SQL client tool (SQL Developer, DBeaver, etc.)

#### Setup Instructions
1. Clone this repository
2. Connect to your database using your SQL client
3. Run the scripts in the following order:
   ```
   sql/01_create_tables.sql
   sql/02_insert_sample_data.sql
   sql/03_create_views.sql
   ```
4. Explore the database using the queries in `sql/04_queries_reports.sql`

### Method 2: Docker Setup (Recommended)

#### Prerequisites
- Docker and Docker Compose installed on your machine
- At least 4GB of free RAM for the Oracle XE container

#### Getting Started

1. **Build and start the container:**
   ```bash
   docker-compose up -d
   ```

2. **Monitor container startup:**
   ```bash
   docker logs -f teachme-oracle-db
   ```
   The first startup may take 5-10 minutes as Oracle initializes.

3. **Connect to the database:**
   - Hostname: localhost
   - Port: 1521
   - Service name: TEACHMEPDB
   - Username: system
   - Password: teachme123

#### Managing the Container

- **Stop the container:**
  ```bash
  docker-compose stop
  ```

- **Start an existing container:**
  ```bash
  docker-compose start
  ```

- **Remove the container (data will be preserved in the volume):**
  ```bash
  docker-compose down
  ```

- **Remove the container and delete all data:**
  ```bash
  docker-compose down -v
  ```

#### Running SQL Scripts Manually

```bash
docker exec -it teachme-oracle-db bash -c "echo '@/path/to/script.sql' | sqlplus system/teachme123@//localhost:1521/TEACHMEPDB"
```

### Cleanup
To remove all objects from the database, run:
```
sql/05_drop_all.sql
```

## Skills Demonstrated
- **Database Design and Modeling**
  - Entity-relationship modeling
  - Normalization techniques
  - Schema design and optimization
  - Data dictionary creation and maintenance

- **SQL Programming**
  - Data Definition Language (DDL) for schema creation
  - Data Manipulation Language (DML) for data operations
  - Data Control Language (DCL) for security permissions
  - Advanced SQL querying techniques
  - View creation for business reporting

- **Database Management**
  - Database object organization
  - Data integrity enforcement through constraints
  - Transaction management
  - System maintenance and cleanup operations
  - Database performance tuning

- **Business Intelligence**
  - Analytical view design
  - Business metric reporting
  - Revenue tracking and analysis
  - Performance monitoring dashboards
  - User activity analytics

- **Containerization and DevOps**
  - Docker configuration and containerization
  - Docker Compose for multi-service orchestration
  - Environment standardization
  - Persistent data volume management
  - Setup automation through scripts

- **Documentation**
  - Technical documentation creation
  - SQL script commenting and organization
  - Business rules documentation
  - System architecture documentation
  - User guide development

## Future Enhancements
- Stored procedures for common operations
- Database triggers for auditing
- Additional performance indexes
- Advanced analytics dashboard
- Course recommendation engine
- Integration with front-end applications
- Authentication system improvements
- Backup and recovery automation

## Author
- Ajaypartap Singh Maan

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
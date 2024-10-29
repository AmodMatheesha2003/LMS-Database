# LMS Database Project

## Overview
This project contains the database design, scripts, and backups for a Learning Management System (LMS) database. Below is a breakdown of the project structure and details about each folder and file.

## Database Features
- **Database Design**: Created an ER Diagram and Class Diagram for the database structure, facilitating a clear understanding of relationships and data flow.
  
- **Full CRUD Operations**: Managed user information and operations with comprehensive CRUD scripts, allowing for efficient data manipulation.
  
- **Stored Procedures & Functions**: Implemented procedures for efficient data handling, processing submissions, grading, and more.
  
- **Automatic ID Management with Triggers**: Developed triggers for ID auto-increment on insertions, simplifying record management.
  
- **Assignment Automation**: Created a custom trigger that, upon assignment creation by a lecturer, automatically inserts entries for all students enrolled in that course into the `assignment_student` (submissions) table. This allows students to submit assignments, and lecturers can grade them through tailored procedures.
  
- **Data Security & Views**: Incorporated data security best practices, views, and DDL commands to ensure secure and seamless data access.
  
- **Role-Based Security**: Created roles with specific permissions tailored to each user type (Admin, Lecturer, Student) to ensure data integrity and access control.

## Project Structure

- **Data_Scripts/**  
  Contains scripts for managing the database users and performing CRUD operations. The folder includes scripts for the following:
  - **Admin**
  - **Lecturer**
  - **Student**

- **Database_Design/**  
  Contains the visual design documents of the database:
  - **ER Diagram (PNG)**
  - **Class Diagram (PNG)**

- **Database_Backup/**  
  Contains the backup files of the LMS database for restoration purposes.

- **LMS_Report.pdf**  
  A detailed report on the LMS database, covering its security mechanisms, design, and other relevant details.

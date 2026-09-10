# College Examination Management System

## MySQL Database Project

The College Examination Management System is a MySQL database project designed to manage college examination-related information such as departments, students, subjects, exams, marks, and results.

## Database

- **Database Name:** `college_exam_management`
- **Database Management System:** MySQL

## Tables

The database contains the following tables:

1. **Departments** – Stores department information.
2. **Students** – Stores student details and department information.
3. **Subjects** – Stores subjects offered by departments.
4. **Exams** – Stores examination details and dates.
5. **Marks** – Stores marks obtained by students in exams.
6. **Results** – Stores total marks, percentage, and grades.

## SQL Concepts Used

This project demonstrates:

- CREATE DATABASE
- CREATE TABLE
- Primary Keys
- Foreign Keys
- UNIQUE and NOT NULL constraints
- CHECK constraints
- INSERT
- SELECT
- UPDATE
- ORDER BY
- LIMIT
- Aggregate Functions
- GROUP BY
- HAVING
- JOIN
- Multi-table JOIN
- Subqueries using IN
- VIEW
- Stored Procedure

## Main Relationships

- A department can have students.
- A department can have subjects.
- A subject can have exams.
- Students receive marks for exams.
- Students have examination results.

## How to Use

1. Install MySQL.
2. Open MySQL Workbench or MySQL Command Line.
3. Open the `college_exam_management-1.sql` file.
4. Execute the SQL script.
5. The database and required tables will be created automatically.
6. Sample data and SQL queries are included in the script.

## Project Contents

```text
college-exam-management-system/
│
├── README.md
└── college_exam_management-1.sql

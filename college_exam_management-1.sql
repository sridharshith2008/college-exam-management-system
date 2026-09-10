-- ============================================
-- COLLEGE EXAMINATION MANAGEMENT SYSTEM
-- MySQL Database Project
-- ============================================

-- Create Database
CREATE DATABASE college_exam_management;
USE college_exam_management;


-- ============================================
-- 1. DEPARTMENTS TABLE
-- ============================================

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);


-- ============================================
-- 2. STUDENTS TABLE
-- ============================================

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    department_id INT,
    email VARCHAR(100) UNIQUE,
    date_of_birth DATE,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);


-- ============================================
-- 3. SUBJECTS TABLE
-- ============================================

CREATE TABLE subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL UNIQUE,
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);


-- ============================================
-- 4. EXAMS TABLE
-- ============================================

CREATE TABLE exams (
    exam_id INT PRIMARY KEY,
    subject_id INT,
    exam_name VARCHAR(100) NOT NULL,
    exam_date DATE NOT NULL,
    FOREIGN KEY (subject_id)
        REFERENCES subjects(subject_id)
);


-- ============================================
-- 5. MARKS TABLE
-- ============================================

CREATE TABLE marks (
    mark_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    exam_id INT NOT NULL,
    marks_obtained INT NOT NULL
        CHECK (marks_obtained BETWEEN 0 AND 100),
    FOREIGN KEY (student_id)
        REFERENCES students(student_id),
    FOREIGN KEY (exam_id)
        REFERENCES exams(exam_id)
);


-- ============================================
-- 6. RESULTS TABLE
-- ============================================

CREATE TABLE results (
    result_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    total_marks INT NOT NULL,
    percentage DECIMAL(5,2),
    grade VARCHAR(5),
    FOREIGN KEY (student_id)
        REFERENCES students(student_id)
);


-- ============================================
-- INSERT DEPARTMENT DATA
-- ============================================

INSERT INTO departments
(department_id, department_name)
VALUES
(1, 'Computer Science'),
(2, 'Information Technology'),
(3, 'Electronics and Communication');


-- ============================================
-- INSERT STUDENT DATA
-- ============================================

INSERT INTO students
(student_id, student_name, department_id, email, date_of_birth)
VALUES
(101, 'ARUN', 1, 'arun@gmail.com', '2004-05-12'),
(102, 'RAHUL', 1, 'rahul@gmail.com', '2004-08-20'),
(103, 'PRIYA', 2, 'priya@gmail.com', '2005-01-15'),
(104, 'KIRAN', 2, 'kiran@gmail.com', '2004-11-10'),
(105, 'SNEHA', 3, 'sneha@gmail.com', '2005-03-25');


-- ============================================
-- INSERT SUBJECT DATA
-- ============================================

INSERT INTO subjects
(subject_id, subject_name, department_id)
VALUES
(201, 'DBMS', 1),
(202, 'Data Structures', 1),
(203, 'Operating Systems', 1),
(204, 'Computer Networks', 2),
(205, 'Digital Electronics', 3);


-- ============================================
-- INSERT EXAM DATA
-- ============================================

INSERT INTO exams
(exam_id, subject_id, exam_name, exam_date)
VALUES
(301, 201, 'Internal 1', '2026-01-20'),
(302, 202, 'Internal 1', '2026-01-22'),
(303, 203, 'Internal 1', '2026-01-24'),
(304, 204, 'Internal 1', '2026-01-26'),
(305, 205, 'Internal 1', '2026-01-28');


-- ============================================
-- INSERT MARKS DATA
-- ============================================

INSERT INTO marks
(mark_id, student_id, exam_id, marks_obtained)
VALUES
(401, 101, 301, 85),
(402, 102, 301, 78),
(403, 103, 301, 92),
(404, 104, 304, 88),
(405, 105, 305, 81);


-- ============================================
-- INSERT RESULTS DATA
-- ============================================

INSERT INTO results
(result_id, student_id, total_marks, percentage, grade)
VALUES
(501, 101, 425, 85.00, 'A'),
(502, 102, 390, 78.00, 'B'),
(503, 103, 460, 92.00, 'A+'),
(504, 104, 440, 88.00, 'A'),
(505, 105, 405, 81.00, 'A');


-- ============================================
-- BASIC SELECT
-- ============================================

SELECT * FROM students;


-- ============================================
-- ORDER BY AND LIMIT
-- ============================================

SELECT *
FROM students
ORDER BY student_id ASC
LIMIT 2;

SELECT student_name, marks_obtained
FROM students
JOIN marks
ON students.student_id = marks.student_id
ORDER BY marks_obtained DESC
LIMIT 3;


-- ============================================
-- UPDATE
-- ============================================

UPDATE students
SET email = 'arun_new@gmail.com'
WHERE student_id = 101;


-- ============================================
-- AGGREGATE FUNCTIONS
-- ============================================

SELECT MAX(marks_obtained) AS highest_marks
FROM marks;

SELECT MIN(marks_obtained) AS lowest_marks
FROM marks;

SELECT AVG(marks_obtained) AS average_marks
FROM marks;

SELECT SUM(marks_obtained) AS total_marks
FROM marks;

SELECT COUNT(*) AS total_mark_records
FROM marks;


-- ============================================
-- GROUP BY
-- ============================================

SELECT student_id, COUNT(*) AS exam_count
FROM marks
GROUP BY student_id;


-- ============================================
-- HAVING
-- ============================================

SELECT student_id, AVG(marks_obtained) AS average_marks
FROM marks
GROUP BY student_id
HAVING AVG(marks_obtained) > 75;


-- ============================================
-- JOIN
-- ============================================

SELECT student_name, marks_obtained
FROM students
JOIN marks
ON students.student_id = marks.student_id;


-- ============================================
-- MULTI-TABLE JOIN
-- ============================================

SELECT
    students.student_name,
    subjects.subject_name,
    marks.marks_obtained
FROM students
JOIN marks
ON students.student_id = marks.student_id
JOIN exams
ON marks.exam_id = exams.exam_id
JOIN subjects
ON exams.subject_id = subjects.subject_id;


-- ============================================
-- SUBQUERY USING IN
-- Find students scoring above 80
-- ============================================

SELECT student_name
FROM students
WHERE student_id IN (
    SELECT student_id
    FROM marks
    WHERE marks_obtained > 80
);


-- ============================================
-- SUBQUERY USING IN
-- Find students who scored exactly 85
-- ============================================

SELECT student_name
FROM students
WHERE student_id IN (
    SELECT student_id
    FROM marks
    WHERE marks_obtained = 85
);


-- ============================================
-- VIEW
-- ============================================

CREATE VIEW student_marks AS
SELECT
    students.student_name,
    marks.marks_obtained
FROM students
JOIN marks
ON students.student_id = marks.student_id;


-- Display View
SELECT * FROM student_marks;


-- ============================================
-- STORED PROCEDURE
-- ============================================

DELIMITER //

CREATE PROCEDURE show_students()
BEGIN
    SELECT * FROM students;
END //

DELIMITER ;


-- Call Stored Procedure
CALL show_students();

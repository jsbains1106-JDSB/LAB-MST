-- Create a College Course Management System using Course and Faculty tables.
-- Create Course and Faculty tables with suitable attributes.
-- Apply appropriate Primary Key and Foreign Key constraints.
-- Apply suitable NOT NULL, UNIQUE, DEFAULT, and CHECK constraints.
-- Insert at least 5 faculty records and 5 course records.
-- Display courses having credits between 2 and 4.
-- Display courses whose names start with a particular letter using LIKE.
-- Display courses belonging to a selected set of departments using IN.
-- Display unique department names using DISTINCT.
-- Update the faculty assigned to a particular course.
-- Delete a course based on a suitable condition.
-- Add a new column to the Course table using ALTER.
-- Display the final Course records.

CREATE DATABASE collegeDB;
USE collegeDB;
CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2) DEFAULT 30000 CHECK (salary >= 20000)
);
CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    credits INT CHECK (credits BETWEEN 1 AND 5),
    department VARCHAR(50) NOT NULL,
    faculty_id INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id)
);
INSERT INTO Faculty VALUES
(1, 'Amit Sharma', 'CSE', 'amit@gmail.com', 50000),
(2, 'Neha Verma', 'IT', 'neha@gmail.com', 45000),
(3, 'Raj Singh', 'ECE', 'raj@gmail.com', 40000),
(4, 'Priya Mehta', 'CSE', 'priya@gmail.com', 55000),
(5, 'Karan Patel', 'ME', 'karan@gmail.com', 42000);

INSERT INTO Course VALUES
(101, 'Data Structures', 4, 'CSE', 1),
(102, 'Database Systems', 3, 'IT', 2),
(103, 'Digital Electronics', 3, 'ECE', 3),
(104, 'Operating Systems', 4, 'CSE', 4),
(105, 'Thermodynamics', 2, 'ME', 5);

SELECT * FROM Course
WHERE credits BETWEEN 2 AND 4;

SELECT * FROM Course
WHERE course_name LIKE 'D%';

SELECT * FROM Course
WHERE department IN ('CSE', 'IT');

SELECT DISTINCT department FROM Course;

UPDATE Course
SET faculty_id = 2
WHERE course_id = 101;

DELETE FROM Course
WHERE credits < 3;

ALTER TABLE Course
ADD course_duration INT DEFAULT 6;

SELECT * FROM Course;





 

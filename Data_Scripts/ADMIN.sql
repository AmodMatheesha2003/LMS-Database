-- Create a table for departments
CREATE TABLE departments (
    department_id NUMBER PRIMARY KEY,
    department_name VARCHAR2(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO departments (department_id, department_name) VALUES (1, 'School of Computing');
INSERT INTO departments (department_id, department_name) VALUES (2, 'School of Business');
INSERT INTO departments (department_id, department_name) VALUES (3, 'School of Engineering');
INSERT INTO departments (department_id, department_name) VALUES (4, 'School of Language');
INSERT INTO departments (department_id, department_name) VALUES (5, 'School of Humanities');

SELECT * FROM departments;

-- Create a table for lecturers
CREATE TABLE lecturers (
    lecturer_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50),
    email VARCHAR2(100) UNIQUE NOT NULL,
    phone_number VARCHAR2(15) NOT NULL,
    department_id NUMBER,
    hire_date DATE NOT NULL ,
    salary NUMBER CHECK (salary > 0),
    status VARCHAR2(20) DEFAULT 'Active' CHECK (status IN ('Active','Retired','Resigned')),
    FOREIGN KEY (department_id) REFERENCES departments (department_id)
);

INSERT INTO lecturers (lecturer_id, first_name, last_name, email, phone_number, department_id, hire_date, salary) VALUES 
(1, 'Kasun', 'Sandaru', 'Kasun21@gmail.com', '0712345678', 1, TO_DATE('2020-01-15', 'YYYY-MM-DD'), 50000);
INSERT INTO lecturers (lecturer_id, first_name, last_name, email, phone_number, department_id, hire_date, salary) VALUES 
(2, 'Nisal', 'Yasmith', 'Nisal43@gmail.com', '0723456789', 2, TO_DATE('2019-03-20', 'YYYY-MM-DD'), 60000);
INSERT INTO lecturers (lecturer_id, first_name, last_name, email, phone_number, department_id, hire_date, salary) VALUES 
(3, 'Thili', 'Perera', 'Thili123@gmail.com', '0734567890', NULL, TO_DATE('2021-06-10', 'YYYY-MM-DD'), 45000);
INSERT INTO lecturers (lecturer_id, first_name, last_name, email, phone_number, department_id, hire_date, salary) VALUES 
(4, 'Sathmi', 'Dissanayake', 'Sathmi54@gmail.com', '0745678901', 1, TO_DATE('2018-09-30', 'YYYY-MM-DD'), 70000);
INSERT INTO lecturers (lecturer_id, first_name, last_name, email, phone_number, department_id, hire_date, salary) VALUES 
(5, 'Chamal', 'Weerasinghe', 'Chamal@gmail.com', '0756789012', 2, TO_DATE('2022-02-25', 'YYYY-MM-DD'), 55000);
INSERT INTO lecturers (lecturer_id, first_name, last_name, email, phone_number, department_id, hire_date, salary) VALUES 
(6, 'Nethmi', 'Tharushika', 'Nethmi@gmail.com', '0756789012', 4, TO_DATE('2022-02-25', 'YYYY-MM-DD'), 55000);

SELECT * FROM lecturers;

UPDATE lecturers SET status = 'Retired' WHERE lecturer_id = 6;

-- Create a table for courses
CREATE TABLE courses (
    course_id NUMBER PRIMARY KEY,
    course_name VARCHAR2(100) UNIQUE NOT NULL,
    department_id NUMBER NOT NULL,
    description VARCHAR2(200),
    credits NUMBER NOT NULL CHECK (credits > 0),
    start_date DATE NOT NULL,
    end_date DATE,
    status VARCHAR2(20) DEFAULT 'Active' CHECK (status IN ('Active', 'Inactive', 'Completed')),
    created_by NUMBER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (department_id) REFERENCES departments (department_id),
    FOREIGN KEY (created_by) REFERENCES lecturers (lecturer_id),
    CHECK (end_date > start_date)
);

INSERT INTO courses (course_id, course_name, department_id, description, credits, start_date, end_date, created_by) VALUES 
(1, 'Diploma in Software Engineering ', 1, 'This program introduces students to the fundamentals of programming', 40, TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2025-01-15', 'YYYY-MM-DD'), 3);
INSERT INTO courses (course_id, course_name, department_id, description, credits, start_date, end_date, created_by) VALUES 
(2, 'Higher National Diploma in Software Engineering ', 1, 'This program introduces students to the advances of programming', 45, TO_DATE('2024-05-10', 'YYYY-MM-DD'), TO_DATE('2025-05-15', 'YYYY-MM-DD'), 3);
INSERT INTO courses (course_id, course_name, department_id, description, credits, start_date, end_date, created_by) VALUES 
(3, 'Advanced Diploma in Business Management', 1, 'This program introduces students to the fundamentals of Business', 30, TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2025-01-15', 'YYYY-MM-DD'), 3);
INSERT INTO courses (course_id, course_name, department_id, description, credits, start_date, end_date, created_by) VALUES 
(4, 'Higher National Diploma in Business Management', 1, 'This program introduces students to the advances of Business', 35, TO_DATE('2024-05-10', 'YYYY-MM-DD'), TO_DATE('2025-05-15', 'YYYY-MM-DD'), 3);
INSERT INTO courses (course_id, course_name, department_id, description, credits, start_date, end_date, created_by) VALUES 
(5, 'Diploma in English', 1, 'This program introduces students to the English', 20, TO_DATE('2024-05-10', 'YYYY-MM-DD'), TO_DATE('2025-11-15', 'YYYY-MM-DD'), 3);
INSERT INTO courses (course_id, course_name, department_id, description, credits, start_date, end_date, created_by) VALUES 
(6, 'Higher National Diploma in Network Engineering', 1, 'This program introduces students to the fundamentals of Network', 40, TO_DATE('2024-08-10', 'YYYY-MM-DD'), TO_DATE('2025-08-15', 'YYYY-MM-DD'), 3);

UPDATE courses SET status = 'Inactive' WHERE course_id = 1;

SELECT * FROM courses;

-- Create a table for lessons
CREATE TABLE lessons (
    lesson_id NUMBER PRIMARY KEY,
    course_id NUMBER,
    lesson_name VARCHAR2(100) NOT NULL,
    taught_by NUMBER NOT NULL,
    status VARCHAR2(20) DEFAULT 'Active' CHECK (status IN ('Active','Inactive')),
    created_by NUMBER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES courses (course_id),
    FOREIGN KEY (taught_by) REFERENCES lecturers (lecturer_id),
    FOREIGN KEY (created_by) REFERENCES lecturers (lecturer_id)
);

INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (1, 1, 'Introduction to Computer Science', 1, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (2, 1, 'Mathematics for Computing', 2, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (3, 1, 'Database Management Systems', 1, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (4, 2, 'Object-Oriented Programming', 2, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (5, 2, 'Web Development Basics', 2, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (6, 2, 'Programming Fundamentals', 2, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (7, 2, 'Electronics and Computer Architecture', 2, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (8, 1, 'Computer Networks', 2, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (9, 1, 'GUI Application Development', 2, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (10, 1, 'Software Engineering', 2, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (11, 2, 'Enterprise Application Development', 1, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (12, 2, 'Operating Systems', 2, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (13, 4, 'Financial Management', 1, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (14, 4, 'Environmental Management', 2, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (15, 4, 'Marketing Management', 2, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (16, 4, 'Legal Environment', 2, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (17, 4, 'Human Resource Management', 2, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (18, 4, 'Project Management', 2, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (19, 4, 'Operations & Logistics Management', 2, 3);

SELECT * FROM lessons;

-- Create a table for students
CREATE TABLE students (
    student_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    phone_number VARCHAR2(15) NOT NULL,
    date_of_birth DATE ,
    gender VARCHAR2(15) ,
    address VARCHAR2(200),
    status VARCHAR2(20) DEFAULT 'Active' CHECK (status IN ('Active','students','Suspended')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (1, 'Amila', 'Perera', 'amilaperera@gmail.com', '0711234567', TO_DATE('2001-05-15', 'YYYY-MM-DD'), 'Male', '123, Colombo Road, Galle');

INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (2, 'Kasuni', 'Samarasinghe', 'kasunisamarasinghe@gmail.com', '0722345678', TO_DATE('2000-08-25', 'YYYY-MM-DD'), 'Female', '45, Kandy Street, Kandy');

INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (3, 'Chathura', 'Wijesinghe', 'chathurawijesinghe@gmail.com', '0713456789', TO_DATE('2002-12-10', 'YYYY-MM-DD'), 'Male', '78, Lake View, Kurunegala');

INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (4, 'Nethmi', 'Jayasinghe', 'nethmijayasinghe@gmail.com', '0704567890', TO_DATE('2003-03-30', 'YYYY-MM-DD'), 'Female', '89, Beach Road, Matara');

INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (5, 'Sajith', 'Fernando', 'sajithfernando@gmail.com', '0775678901', TO_DATE('2001-07-20', 'YYYY-MM-DD'), 'Male', '65, Temple Lane, Negombo');

UPDATE students SET status = 'students' WHERE student_id = 1;
UPDATE students SET status = 'Suspended' WHERE student_id = 1;

SELECT * FROM students;

-- Create a table for course_enrollments
CREATE TABLE course_enrollments (
    course_enrollments_id NUMBER PRIMARY KEY,
    student_id NUMBER NOT NULL,
    course_id NUMBER NOT NULL,
    enrollement_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students (student_id),
    FOREIGN KEY (course_id) REFERENCES courses (course_id)
);

INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (1, 1, 1);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (2, 2, 2);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (3, 3, 1);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (4, 4, 4);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (5, 5, 3);

SELECT * FROM course_enrollments;

-- Create a table for assignment
CREATE TABLE assignment (
    assignment_id  NUMBER PRIMARY KEY,
    assignment_title VARCHAR2(50) NOT NULL,
    assignment_fiies VARCHAR2(50) NOT NULL,
    lesson_id NUMBER NOT NULL,
    post_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    end_date DATE NOT NULL,
    FOREIGN KEY (lesson_id) REFERENCES lessons (lesson_id)
);

INSERT INTO assignment (assignment_id, assignment_title, assignment_fiies, lesson_id, end_date) 
VALUES (1, 'Assignment 1', 'file1.pdf', 1, TO_DATE('2024-10-10', 'YYYY-MM-DD'));
INSERT INTO assignment (assignment_id, assignment_title, assignment_fiies, lesson_id, end_date) 
VALUES (2, 'Assignment 2', 'file2.pdf', 2, TO_DATE('2024-10-15', 'YYYY-MM-DD'));
INSERT INTO assignment (assignment_id, assignment_title, assignment_fiies, lesson_id, end_date) 
VALUES (3, 'Assignment 3', 'file3.pdf', 3, TO_DATE('2024-10-12', 'YYYY-MM-DD'));
INSERT INTO assignment (assignment_id, assignment_title, assignment_fiies, lesson_id, end_date) 
VALUES (4, 'Assignment 4', 'file4.pdf', 4, TO_DATE('2024-10-20', 'YYYY-MM-DD'));
INSERT INTO assignment (assignment_id, assignment_title, assignment_fiies, lesson_id, end_date) 
VALUES (5, 'Assignment 5', 'file5.pdf', 5, TO_DATE('2024-10-18', 'YYYY-MM-DD'));

SELECT * FROM assignment;
    
-- Create a table for assignment_students
CREATE TABLE assignment_students (
    assignment_students_id NUMBER PRIMARY KEY,
    assignment_id  NUMBER NOT NULL,
    student_id NUMBER NOT NULL,
    submit_file VARCHAR2(200) NOT NULL,
    submissionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR2(20) DEFAULT 'Not submitted' CHECK (status IN ('Submitted','Graded by Lecturer')),
    grade VARCHAR2(20),
    Feedback_on_Assessment VARCHAR2(100) ,
    FOREIGN KEY (assignment_id) REFERENCES assignment (assignment_id),
    FOREIGN KEY (student_id) REFERENCES students (student_id)
);

INSERT INTO assignment_students (assignment_students_id, assignment_id, student_id, submit_file, status) VALUES 
(1, 1, 1, 'assignment1_student1.docx', 'Submitted');

INSERT INTO assignment_students (assignment_students_id, assignment_id, student_id, submit_file, status, grade, Feedback_on_Assessment) VALUES
(2, 1, 2, 'assignment1_student2.docx', 'Graded by Lecturer', 'A', 'Very thorough and well-organized.');

SELECT * FROM assignment_students;

-- Create a table for students_feedback
CREATE TABLE students_feedback (
    feedback_id NUMBER PRIMARY KEY,
    lesson_id NUMBER NOT NULL,
    student_id NUMBER NOT NULL,
    comments VARCHAR2(100) NOT NULL,
    rating NUMBER NOT NULL CHECK (rating BETWEEN 1 AND 5),
    FOREIGN KEY (lesson_id) REFERENCES lessons (lesson_id),
    FOREIGN KEY (student_id) REFERENCES students (student_id)
);

INSERT INTO students_feedback (feedback_id, lesson_id, student_id, comments, rating) VALUES (1, 1, 1, 'The lesson was very informative and engaging.', 5);

SELECT * FROM students_feedback;

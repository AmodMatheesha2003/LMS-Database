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

-- Create procedure insert_department
CREATE OR REPLACE PROCEDURE insert_department (i_department_id IN NUMBER, i_department_name IN VARCHAR2) AS
BEGIN
    INSERT INTO departments (department_id, department_name) VALUES (i_department_id, i_department_name); 
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred '|| SQLERRM);
END ;
   
DECLARE
    iu_department_id NUMBER := &department_id;
    iu_department_name VARCHAR2(100) := '&department_name';
BEGIN
    insert_department(iu_department_id, iu_department_name);
    DBMS_OUTPUT.PUT_LINE('Department "' || iu_department_name || '" with ID ' || iu_department_id || ' has been successfully added.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inserting department '|| SQLERRM);
END; 

-- Create procedure update_department   
CREATE OR REPLACE PROCEDURE update_department (u_department_id IN NUMBER, u_department_name IN VARCHAR2) AS u_department_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO u_department_count FROM departments WHERE department_id = u_department_id;
    IF u_department_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No department found ');
    ELSE
        UPDATE departments SET department_name = u_department_name WHERE department_id = u_department_id;
        DBMS_OUTPUT.PUT_LINE('Updated');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred '|| SQLERRM);
END update_department;

SET SERVEROUTPUT ON;
DECLARE
    v_department_id NUMBER := &department_id;
    v_department_name VARCHAR2(100) := '&department_name';
    BEGIN
    update_department(v_department_id, v_department_name);
END;

-- Create procedure delete_department 
CREATE OR REPLACE PROCEDURE delete_department (d_department_id IN NUMBER) AS u_department_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO u_department_count FROM departments WHERE department_id = d_department_id;
    IF u_department_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No department found');
    ELSE
        DELETE FROM departments WHERE department_id = d_department_id;
        DBMS_OUTPUT.PUT_LINE('Department deleted');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred '|| SQLERRM);
END;

SET SERVEROUTPUT ON;
DECLARE
    v_department_id NUMBER := &department_id;
BEGIN
    delete_department(v_department_id);
END;


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

-- Create procedure insert_lecturer 
CREATE OR REPLACE PROCEDURE insert_lecturer (p_lecturer_id IN NUMBER, p_first_name IN VARCHAR2, p_last_name IN VARCHAR2, p_email IN VARCHAR2,
    p_phone_number IN VARCHAR2, p_department_id IN NUMBER,p_hire_date IN DATE,p_salary IN NUMBER) AS 
BEGIN
    INSERT INTO lecturers (lecturer_id, first_name, last_name, email, phone_number, department_id, hire_date, salary) 
    VALUES (p_lecturer_id, p_first_name, p_last_name, p_email, p_phone_number, p_department_id, p_hire_date, p_salary);
    DBMS_OUTPUT.PUT_LINE('Successfully added');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred');
END;

SET SERVEROUTPUT ON;
DECLARE
    v_lecturer_id NUMBER := &lecturer_id;
    v_first_name VARCHAR2(50) := '&first_name';
    v_last_name VARCHAR2(50) := '&last_name';
    v_email VARCHAR2(100) := '&email';
    v_phone_number VARCHAR2(15) := '&phone_number';
    v_department_id NUMBER := &department_id;
    v_hire_date DATE := TO_DATE('&hire_date', 'YYYY-MM-DD');
    v_salary NUMBER := &salary;
BEGIN
    insert_lecturer(v_lecturer_id, v_first_name, v_last_name, v_email, v_phone_number, v_department_id, v_hire_date, v_salary);
END;
/

-- Create procedure update_lecturer_status 
CREATE OR REPLACE PROCEDURE update_lecturer_status (p_lecturer_id IN NUMBER, p_status IN VARCHAR2) AS v_lecturer_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_lecturer_count FROM lecturers WHERE lecturer_id = p_lecturer_id;
    IF v_lecturer_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No lecturer found');
    ELSE
        UPDATE lecturers SET status = p_status WHERE lecturer_id = p_lecturer_id;
        DBMS_OUTPUT.PUT_LINE('Lecturer status updated ');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred');
END;

SET SERVEROUTPUT ON;
DECLARE
    v_lecturer_id NUMBER := &lecturer_id;
    v_status VARCHAR2(20) := '&status';
BEGIN
    update_lecturer_status(v_lecturer_id, v_status);
END;
/

-- Create procedure delete_lecturer 
CREATE OR REPLACE PROCEDURE delete_lecturer (p_lecturer_id IN NUMBER) AS v_lecturer_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_lecturer_count FROM lecturers WHERE lecturer_id = p_lecturer_id;
    IF v_lecturer_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No lecturer found');
    ELSE
        DELETE FROM lecturers WHERE lecturer_id = p_lecturer_id;
        DBMS_OUTPUT.PUT_LINE('Lecturer deleted');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred');
END;

SET SERVEROUTPUT ON;
DECLARE
    v_lecturer_id NUMBER := &lecturer_id;
BEGIN
    delete_lecturer(v_lecturer_id);
END;
/


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
(3, 'Advanced Diploma in Business Management', 2, 'This program introduces students to the fundamentals of Business', 30, TO_DATE('2024-01-10', 'YYYY-MM-DD'), TO_DATE('2025-01-15', 'YYYY-MM-DD'), 3);
INSERT INTO courses (course_id, course_name, department_id, description, credits, start_date, end_date, created_by) VALUES 
(4, 'Higher National Diploma in Business Management', 2, 'This program introduces students to the advances of Business', 35, TO_DATE('2024-05-10', 'YYYY-MM-DD'), TO_DATE('2025-05-15', 'YYYY-MM-DD'), 3);
INSERT INTO courses (course_id, course_name, department_id, description, credits, start_date, end_date, created_by) VALUES 
(5, 'Diploma in English', 4, 'This program introduces students to the English', 20, TO_DATE('2024-05-10', 'YYYY-MM-DD'), TO_DATE('2025-11-15', 'YYYY-MM-DD'), 3);
INSERT INTO courses (course_id, course_name, department_id, description, credits, start_date, end_date, created_by) VALUES 
(6, 'Higher National Diploma in Network Engineering', 1, 'This program introduces students to the fundamentals of Network', 40, TO_DATE('2024-08-10', 'YYYY-MM-DD'), TO_DATE('2025-08-15', 'YYYY-MM-DD'), 3);

UPDATE courses SET status = 'Inactive' WHERE course_id = 1;

SELECT * FROM courses;

-- Create procedure insert_course 
CREATE OR REPLACE PROCEDURE insert_course (p_course_id IN NUMBER, p_course_name IN VARCHAR2, p_department_id IN NUMBER, p_description IN VARCHAR2, p_credits IN NUMBER,
    p_start_date IN DATE, p_end_date IN DATE, p_created_by IN NUMBER) AS 
BEGIN
    INSERT INTO courses (course_id, course_name, department_id, description, credits, start_date, end_date, created_by) 
    VALUES (p_course_id, p_course_name, p_department_id, p_description, p_credits, p_start_date, p_end_date, p_created_by);
    DBMS_OUTPUT.PUT_LINE('Course successfully added');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred');
END;

SET SERVEROUTPUT ON;
DECLARE
    v_course_id NUMBER := &course_id;
    v_course_name VARCHAR2(100) := '&course_name';
    v_department_id NUMBER := &department_id;
    v_description VARCHAR2(200) := '&description';
    v_credits NUMBER := &credits;
    v_start_date DATE := TO_DATE('&start_date', 'YYYY-MM-DD');
    v_end_date DATE := TO_DATE('&end_date', 'YYYY-MM-DD');
    v_created_by NUMBER := &created_by;
BEGIN
    insert_course(v_course_id, v_course_name, v_department_id, v_description, v_credits, v_start_date, v_end_date, v_created_by);
END;

-- Create procedure update_course 
CREATE OR REPLACE PROCEDURE update_course (p_course_id IN NUMBER, p_course_name IN VARCHAR2, p_department_id IN NUMBER, p_description IN VARCHAR2,
    p_credits IN NUMBER,p_start_date IN DATE, p_end_date IN DATE, p_status IN VARCHAR2) AS 
BEGIN
    UPDATE courses SET course_name = p_course_name, department_id = p_department_id, description = p_description, credits = p_credits,
    start_date = p_start_date, end_date = p_end_date,status = p_status WHERE course_id = p_course_id;
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No course found');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Course successfully updated');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred');
END;

SET SERVEROUTPUT ON;
DECLARE
    v_course_id NUMBER := &course_id;
    v_course_name VARCHAR2(100) := '&course_name'; 
    v_department_id NUMBER := &department_id;
    v_description VARCHAR2(200) := '&description'; 
    v_credits NUMBER := &credits;
    v_start_date DATE := TO_DATE('&start_date', 'YYYY-MM-DD'); 
    v_end_date DATE := TO_DATE('&end_date', 'YYYY-MM-DD'); 
    v_status VARCHAR2(20) := '&status'; 
BEGIN
    update_course(v_course_id, v_course_name, v_department_id, v_description, v_credits, v_start_date, v_end_date, v_status);
END;

-- Create procedure delete_course 
CREATE OR REPLACE PROCEDURE delete_course (p_course_id IN NUMBER) AS 
BEGIN
    DELETE FROM courses WHERE course_id = p_course_id;
    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No course found');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Course successfully deleted');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred');
END;

SET SERVEROUTPUT ON;
DECLARE
    v_course_id NUMBER := &course_id;
BEGIN
    delete_course(v_course_id);
END;


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

-- Create procedure insert_lesson 
CREATE OR REPLACE PROCEDURE insert_lesson ( p_lesson_id IN NUMBER, p_course_id IN NUMBER, p_lesson_name IN VARCHAR2,
    p_taught_by IN NUMBER, p_created_by IN NUMBER) AS 
BEGIN
    INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) 
    VALUES (p_lesson_id, p_course_id, p_lesson_name, p_taught_by, p_created_by);
    DBMS_OUTPUT.PUT_LINE('Lesson successfully added');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred');
END;

SET SERVEROUTPUT ON;
DECLARE
    v_lesson_id NUMBER := &lesson_id;
    v_course_id NUMBER := &course_id;
    v_lesson_name VARCHAR2(100) := '&lesson_name';
    v_taught_by NUMBER := &taught_by;
    v_created_by NUMBER := &created_by;
BEGIN
    insert_lesson(v_lesson_id, v_course_id, v_lesson_name, v_taught_by, v_created_by);
END;
/

-- Create procedure update_lesson 
CREATE OR REPLACE PROCEDURE update_lesson (p_lesson_id IN NUMBER, p_lesson_name IN VARCHAR2,
p_status IN VARCHAR2,p_taught_by IN NUMBER) AS v_lesson_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_lesson_count FROM lessons WHERE lesson_id = p_lesson_id;
    IF v_lesson_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No lesson found');
    ELSE
        UPDATE lessons SET lesson_name = p_lesson_name, status = p_status , taught_by = p_taught_by WHERE lesson_id = p_lesson_id;
        DBMS_OUTPUT.PUT_LINE('Lesson with ID ' || p_lesson_id || ' has been updated.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred');
END;

SET SERVEROUTPUT ON;
DECLARE
    v_lesson_id NUMBER := &lesson_id;
    v_lesson_name VARCHAR2(100) := '&lesson_name';
    v_status VARCHAR2(20) := '&status';
    v_taught_by NUMBER := &taught_by;
BEGIN
    update_lesson(v_lesson_id, v_lesson_name, v_status, v_taught_by);
END;
/

-- Create procedure delete_lesson
CREATE OR REPLACE PROCEDURE delete_lesson ( p_lesson_id IN NUMBER) AS v_lesson_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_lesson_count FROM lessons WHERE lesson_id = p_lesson_id;
    IF v_lesson_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No lesson found');
    ELSE
        DELETE FROM lessons WHERE lesson_id = p_lesson_id;
        DBMS_OUTPUT.PUT_LINE('Lesson deleted.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred');
END;

SET SERVEROUTPUT ON;
DECLARE
    v_lesson_id NUMBER := &lesson_id;
BEGIN
    delete_lesson(v_lesson_id);
END;
/

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
    submit_file VARCHAR2(200),
    submissionDate TIMESTAMP,
    status VARCHAR2(20),
    grade VARCHAR2(20),
    Feedback_on_Assessment VARCHAR2(100) ,
    FOREIGN KEY (assignment_id) REFERENCES assignment (assignment_id),
    FOREIGN KEY (student_id) REFERENCES students (student_id)
);

INSERT INTO assignment_students (assignment_students_id, assignment_id, student_id, submit_file, status, submissionDate) VALUES 
(1, 1, 1, 'assignment1_student1.docx', 'Submitted',SYSTIMESTAMP);

INSERT INTO assignment_students (assignment_students_id, assignment_id, student_id, submit_file, status, grade, Feedback_on_Assessment, submissionDate) VALUES
(2, 1, 2, 'assignment1_student2.docx', 'Graded by Lecturer', 'A', 'Very thorough and well-organized.',SYSTIMESTAMP);

SELECT * FROM assignment_students;

-- Create a table for students_feedback
CREATE TABLE students_feedback (
    feedback_id NUMBER PRIMARY KEY,
    lesson_id NUMBER NOT NULL,
    student_id NUMBER NOT NULL,
    comments VARCHAR2(100) NOT NULL,
    rating NUMBER NOT NULL CHECK (rating BETWEEN 1 AND 5),
    post_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (lesson_id) REFERENCES lessons (lesson_id),
    FOREIGN KEY (student_id) REFERENCES students (student_id)
);

INSERT INTO students_feedback (feedback_id, lesson_id, student_id, comments, rating) VALUES (1, 1, 1, 'The lesson was very informative and engaging.', 5);

SELECT * FROM students_feedback;

CREATE OR REPLACE TRIGGER assignment_idincrement
BEFORE INSERT ON assignment
FOR EACH ROW
DECLARE
    max_assignment_id NUMBER;
BEGIN
    SELECT 
    CASE 
        WHEN MAX(assignment_id) IS NULL THEN 0 ELSE MAX(assignment_id) 
    END
    INTO max_assignment_id FROM assignment;
    :NEW.assignment_id := max_assignment_id + 1;
END;
/


CREATE SEQUENCE assignment_students_seq
START WITH 1
INCREMENT BY 1;

CREATE OR REPLACE TRIGGER add_students_to_assignment
AFTER INSERT ON assignment
FOR EACH ROW
DECLARE
    CURSOR student_cursor IS
        SELECT ce.student_id
        FROM course_enrollments ce
        JOIN lessons l ON l.course_id = ce.course_id
        WHERE l.lesson_id = :NEW.lesson_id;
BEGIN
    FOR student_record IN student_cursor LOOP
        INSERT INTO assignment_students (assignment_students_id, assignment_id, student_id, status)
        VALUES (assignment_students_seq.NEXTVAL, :NEW.assignment_id, student_record.student_id, 'Not submitted');
    END LOOP;
END;
/


INSERT INTO assignment (assignment_title, assignment_fiies, lesson_id, end_date) VALUES ('Assignment 8', 'file8.pdf', 1, TO_DATE('2024-10-25', 'YYYY-MM-DD'));

SELECT * FROM ADMIN.assignment_students;
SELECT * FROM ADMIN.assignment;
SELECT * FROM ADMIN.course_enrollments;

DELETE FROM assignment WHERE assignment_id = 8;
DELETE FROM assignment_students WHERE assignment_id = 8;

UPDATE ADMIN.assignment_students SET 
    submit_file = 'assignment1_student7.docx',
    status = 'Submitted',
    submissionDate = SYSTIMESTAMP
WHERE assignment_id = 7 AND assignment_students_id = 1;


CREATE OR REPLACE PROCEDURE submit_assignment_student (p_assignment_id IN NUMBER,p_assignment_students_id IN NUMBER,p_submit_file IN VARCHAR2) AS
BEGIN
    UPDATE ADMIN.assignment_students
    SET submit_file = p_submit_file, status = 'Submitted', submissionDate = SYSTIMESTAMP
    WHERE assignment_id = p_assignment_id AND assignment_students_id = p_assignment_students_id;
    DBMS_OUTPUT.PUT_LINE('Record updated successfully.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No record found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

CREATE OR REPLACE PROCEDURE insert_assignment (p_assignment_title IN VARCHAR2, p_assignment_fiies IN VARCHAR2, p_lesson_id IN NUMBER, p_end_date IN DATE) AS
BEGIN
    INSERT INTO ADMIN.assignment (assignment_title,assignment_fiies,lesson_id,end_date) VALUES (p_assignment_title, p_assignment_fiies, p_lesson_id, p_end_date);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred while inserting assignment Check and try agin');
END;
/

CREATE OR REPLACE PROCEDURE grade_assignment_student (p_assignment_id IN NUMBER,p_assignment_students_id IN NUMBER,p_grade IN VARCHAR2,p_feedback IN VARCHAR2) AS
BEGIN
    UPDATE ADMIN.assignment_students SET status = 'Graded', grade = p_grade, Feedback_on_Assessment = p_feedback
    WHERE assignment_id = p_assignment_id AND assignment_students_id = p_assignment_students_id;
    DBMS_OUTPUT.PUT_LINE('Assignment student record graded successfully.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No record found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred');
END;
/


CREATE OR REPLACE TRIGGER feedback_id_increment
BEFORE INSERT ON students_feedback
FOR EACH ROW
DECLARE
    max_feedback_id NUMBER;
BEGIN
    SELECT 
    CASE 
        WHEN MAX(feedback_id) IS NULL THEN 0 ELSE MAX(feedback_id)
    END
    INTO max_feedback_id FROM students_feedback;
    :NEW.feedback_id := max_feedback_id + 1;
END;
/

CREATE OR REPLACE PROCEDURE insert_student_feedback (p_course_id IN NUMBER,p_student_id IN NUMBER,p_comments IN VARCHAR2,p_rating IN NUMBER) AS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count FROM course_enrollments WHERE student_id = p_student_id AND course_id = p_course_id;
    IF v_count > 0 THEN
        INSERT INTO students_feedback (lesson_id, student_id, comments, rating, post_date) VALUES (p_course_id, p_student_id, p_comments, p_rating, SYSTIMESTAMP);
        DBMS_OUTPUT.PUT_LINE('Feedback inserted successfully.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The student is not related to the specified lesson');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END;
/



CREATE OR REPLACE PROCEDURE get_feedback_by_lecturer (p_lecturer_id IN NUMBER) AS feedback_found BOOLEAN := FALSE;
BEGIN
    FOR rec IN (SELECT l.lesson_name, sf.comments, sf.rating, sf.post_date FROM ADMIN.students_feedback sf JOIN lessons l ON sf.lesson_id = l.lesson_id
                WHERE l.lesson_id IN (SELECT lesson_id FROM ADMIN.lessons WHERE taught_by = p_lecturer_id)) LOOP
            DBMS_OUTPUT.PUT_LINE('Lesson: ' || rec.lesson_name );
            DBMS_OUTPUT.PUT_LINE('Comment: ' || rec.comments );
            DBMS_OUTPUT.PUT_LINE('Rating: ' || rec.rating );
            DBMS_OUTPUT.PUT_LINE('Date: ' || rec.post_date );
            DBMS_OUTPUT.PUT_LINE(' ');
            feedback_found := TRUE;
    END LOOP;
    IF NOT feedback_found THEN
        DBMS_OUTPUT.PUT_LINE('No feedback found');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END get_feedback_by_lecturer;
/





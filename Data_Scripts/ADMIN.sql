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

INSERT INTO lecturers (lecturer_id, first_name, last_name, email, phone_number, department_id, hire_date, salary, status)
VALUES (1, 'Nimal', 'Perera', 'nimal.perera@schoolofcomputing.edu', '0711234567', 1, TO_DATE('2020-01-15', 'YYYY-MM-DD'), 80000, 'Active');
INSERT INTO lecturers (lecturer_id, first_name, last_name, email, phone_number, department_id, hire_date, salary, status)
VALUES (2, 'Saman', 'Silva', 'saman.silva@schoolofbusiness.edu', '0777654321', 2, TO_DATE('2018-03-10', 'YYYY-MM-DD'), 75000, 'Active');
INSERT INTO lecturers (lecturer_id, first_name, last_name, email, phone_number, department_id, hire_date, salary, status)
VALUES (3, 'Kamal', 'Fernando', 'kamal.fernando@schoolofengineering.edu', '0723456789', 3, TO_DATE('2019-08-25', 'YYYY-MM-DD'), 90000, 'Retired');
INSERT INTO lecturers (lecturer_id, first_name, last_name, email, phone_number, department_id, hire_date, salary, status)
VALUES (4, 'Sunil', 'Jayasinghe', 'sunil.jayasinghe@schooloflanguage.edu', '0709876543', 4, TO_DATE('2021-06-05', 'YYYY-MM-DD'), 60000, 'Active');
INSERT INTO lecturers (lecturer_id, first_name, last_name, email, phone_number, department_id, hire_date, salary, status)
VALUES (5, 'Ruwan', 'Dias', 'ruwan.dias@schoolofhumanities.edu', '0751237894', 5, TO_DATE('2017-12-01', 'YYYY-MM-DD'), 85000, 'Resigned');
INSERT INTO lecturers (lecturer_id, first_name, last_name, email, phone_number, department_id, hire_date, salary, status)
VALUES (6, 'Anura', 'Kumara', 'anura.kumara@schoolofcomputing.edu', '0765432123', 1, TO_DATE('2022-02-20', 'YYYY-MM-DD'), 72000, 'Active');
INSERT INTO lecturers (lecturer_id, first_name, last_name, email, phone_number, department_id, hire_date, salary, status)
VALUES (7, 'Chamara', 'Senanayake', 'chamara.senanayake@schoolofbusiness.edu', '0719876543', 2, TO_DATE('2016-09-18', 'YYYY-MM-DD'), 78000, 'Active');
INSERT INTO lecturers (lecturer_id, first_name, last_name, email, phone_number, department_id, hire_date, salary, status)
VALUES (8, 'Lakmal', 'Wijesinghe', 'lakmal.wijesinghe@schoolofengineering.edu', '0742345678', 3, TO_DATE('2020-05-12', 'YYYY-MM-DD'), 82000, 'Active');
INSERT INTO lecturers (lecturer_id, first_name, last_name, email, phone_number, department_id, hire_date, salary, status)
VALUES (9, 'Gayan', 'Weerasinghe', 'gayan.weerasinghe@schooloflanguage.edu', '0773219876', 4, TO_DATE('2021-11-23', 'YYYY-MM-DD'), 61000, 'Active');
INSERT INTO lecturers (lecturer_id, first_name, last_name, email, phone_number, department_id, hire_date, salary, status)
VALUES (10, 'Priyantha', 'Rajapaksa', 'priyantha.rajapaksa@schoolofhumanities.edu', '0756789123', 5, TO_DATE('2019-07-30', 'YYYY-MM-DD'), 86000, 'Active');

SELECT * FROM lecturers;

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
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (3, 1, 'Database Management Systems', 5, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (4, 2, 'Object-Oriented Programming', 4, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (5, 2, 'Web Development Basics', 6, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (6, 2, 'Programming Fundamentals', 2, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (7, 2, 'Electronics and Computer Architecture', 5, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (8, 1, 'Computer Networks', 2, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (9, 1, 'GUI Application Development', 4, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (10, 1, 'Software Engineering', 5, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (11, 2, 'Enterprise Application Development', 6, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (12, 2, 'Operating Systems', 5, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (13, 4, 'Financial Management', 7, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (14, 4, 'Environmental Management', 8, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (15, 4, 'Marketing Management', 8, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (16, 4, 'Legal Environment', 9, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (17, 4, 'Human Resource Management', 10, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (18, 4, 'Project Management', 10, 3);
INSERT INTO lessons (lesson_id, course_id, lesson_name, taught_by, created_by) VALUES (19, 4, 'Operations Logistics Management', 9, 3);

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
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (6, 'Nimesha', 'Dissanayake', 'nimeshadissanayake@gmail.com', '0766789012', TO_DATE('2002-04-15', 'YYYY-MM-DD'), 'Female', '21, School Street, Galle');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (7, 'Ravindu', 'Perera', 'ravinduperera@gmail.com', '0757890123', TO_DATE('2001-10-10', 'YYYY-MM-DD'), 'Male', '45, Main Road, Kandy');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (8, 'Dilani', 'Gunasekara', 'dilanigunasekara@gmail.com', '0748901234', TO_DATE('2000-09-22', 'YYYY-MM-DD'), 'Female', '10, Hilltop, Nuwara Eliya');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (9, 'Tharindu', 'Wijesooriya', 'tharinduwijesooriya@gmail.com', '0739012345', TO_DATE('2002-02-18', 'YYYY-MM-DD'), 'Male', '34, River View, Kegalle');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (10, 'Ayesh', 'Rajapaksha', 'ayeshrajapaksha@gmail.com', '0720123456', TO_DATE('2001-06-30', 'YYYY-MM-DD'), 'Male', '88, Ocean Drive, Colombo');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (11, 'Chami', 'Chandimal', 'chamichandimal@gmail.com', '0712345678', TO_DATE('2003-05-25', 'YYYY-MM-DD'), 'Female', '44, Park Avenue, Colombo');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (12, 'Lakmal', 'Senevirathne', 'lakmalsenevirathne@gmail.com', '0703456789', TO_DATE('2001-01-01', 'YYYY-MM-DD'), 'Male', '56, Green Road, Anuradhapura');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (13, 'Nimasha', 'Karunarathne', 'nimashakarunarathne@gmail.com', '0694567890', TO_DATE('2002-11-14', 'YYYY-MM-DD'), 'Female', '23, Forest Lane, Ratnapura');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (14, 'Udara', 'Pathirana', 'udarapathirana@gmail.com', '0685678901', TO_DATE('2003-04-20', 'YYYY-MM-DD'), 'Male', '12, Seaside Avenue, Batticaloa');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (15, 'Dhanuka', 'Silva', 'dhanukasilva@gmail.com', '0676789012', TO_DATE('2000-10-30', 'YYYY-MM-DD'), 'Male', '14, Mountain Road, Matale');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (16, 'Shanika', 'Herath', 'shanikaherath@gmail.com', '0667890123', TO_DATE('2002-03-05', 'YYYY-MM-DD'), 'Female', '19, City Center, Jaffna');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (17, 'Kamal', 'Fernando', 'kamalfernando@gmail.com', '0658901234', TO_DATE('2001-08-12', 'YYYY-MM-DD'), 'Male', '32, New Town, Colombo');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (18, 'Gayan', 'Perera', 'gayanperera@gmail.com', '0649012345', TO_DATE('2003-06-18', 'YYYY-MM-DD'), 'Male', '27, Old Market, Galle');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (19, 'Nihal', 'Bandara', 'nihalbandara@gmail.com', '0630123456', TO_DATE('2000-11-26', 'YYYY-MM-DD'), 'Male', '88, Lake Road, Colombo');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (20, 'Thilini', 'Samarawickrama', 'thilinisanarawickrama@gmail.com', '0621234567', TO_DATE('2002-09-02', 'YYYY-MM-DD'), 'Female', '55, Hill Road, Galle');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (21, 'Anushka', 'Fernando', 'anushkafernando@gmail.com', '0612345678', TO_DATE('2001-12-30', 'YYYY-MM-DD'), 'Female', '75, Church Street, Negombo');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (22, 'Charitha', 'Abeysekera', 'charithaabeysekera@gmail.com', '0603456789', TO_DATE('2002-07-15', 'YYYY-MM-DD'), 'Male', '24, River Lane, Ratnapura');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (23, 'Ruwangi', 'Senevirathne', 'ruwangisenevirathne@gmail.com', '0594567890', TO_DATE('2001-02-28', 'YYYY-MM-DD'), 'Female', '31, City View, Kandy');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (24, 'Kanishka', 'Jayasinghe', 'kanishkajayasinghe@gmail.com', '0585678901', TO_DATE('2003-01-10', 'YYYY-MM-DD'), 'Male', '99, Coastal Road, Matara');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (25, 'Lahiru', 'Kumarasinghe', 'lahirukumarasinghe@gmail.com', '0576789012', TO_DATE('2002-08-20', 'YYYY-MM-DD'), 'Male', '19, Bay Street, Colombo');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (26, 'Janani', 'Rathnayake', 'jananirathnayake@gmail.com', '0567890123', TO_DATE('2001-03-16', 'YYYY-MM-DD'), 'Female', '28, Hill Side, Jaffna');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (27, 'Sachin', 'Jayasuriya', 'sachinjayasuriya@gmail.com', '0558901234', TO_DATE('2000-04-22', 'YYYY-MM-DD'), 'Male', '90, Lake Road, Colombo');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (28, 'Meghna', 'Perera', 'meghnaperera@gmail.com', '0549012345', TO_DATE('2003-07-11', 'YYYY-MM-DD'), 'Female', '45, City Hall, Kandy');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (29, 'Vihanga', 'Jayasena', 'vihangajayasena@gmail.com', '0530123456', TO_DATE('2002-05-05', 'YYYY-MM-DD'), 'Male', '71, Coastal Road, Colombo');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (30, 'Saman', 'Tharindu', 'samantaharindu@gmail.com', '0521234567', TO_DATE('2001-09-30', 'YYYY-MM-DD'), 'Male', '30, Market Street, Nuwara Eliya');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (31, 'Sashini', 'Rajapakse', 'sashinirajapakse@gmail.com', '0512345678', TO_DATE('2000-10-15', 'YYYY-MM-DD'), 'Female', '67, Park Road, Colombo');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (32, 'Harsha', 'Bandarage', 'harshabandara@gmail.com', '0503456789', TO_DATE('2001-11-11', 'YYYY-MM-DD'), 'Male', '90, Green Street, Anuradhapura');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (33, 'Kavindu', 'Gunarathne', 'kavindugunarathne@gmail.com', '0494567890', TO_DATE('2002-08-28', 'YYYY-MM-DD'), 'Male', '32, Central Road, Colombo');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (34, 'Manisha', 'Herath', 'manishaherath@gmail.com', '0485678901', TO_DATE('2003-02-14', 'YYYY-MM-DD'), 'Female', '26, Lake Road, Kandy');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (35, 'Dulanjali', 'Fernando', 'dulanjalifernando@gmail.com', '0476789012', TO_DATE('2001-04-05', 'YYYY-MM-DD'), 'Female', '14, Hilltop, Colombo');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (36, 'Dilshani', 'Seneviratne', 'dilshaniseneviratne@gmail.com', '0467890123', TO_DATE('2002-06-21', 'YYYY-MM-DD'), 'Female', '78, Sea View, Matara');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (37, 'Namal', 'Perera', 'namalperera@gmail.com', '0458901234', TO_DATE('2001-09-12', 'YYYY-MM-DD'), 'Male', '33, Beach Road, Galle');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (38, 'Suwanjana', 'Abeysinghe', 'suwanjanaabeysinghe@gmail.com', '0449012345', TO_DATE('2003-03-22', 'YYYY-MM-DD'), 'Female', '56, Temple Road, Colombo');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (39, 'Hasith', 'Samarasekara', 'hasithsamarasekara@gmail.com', '0430123456', TO_DATE('2002-05-01', 'YYYY-MM-DD'), 'Male', '19, New Road, Ratnapura');
INSERT INTO students (student_id, first_name, last_name, email, phone_number, date_of_birth, gender, address) 
VALUES (40, 'Chamila', 'Gunarathne', 'chamilagunarathne@gmail.com', '0421234567', TO_DATE('2000-07-29', 'YYYY-MM-DD'), 'Female', '12, Lake View, Kandy');

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

-- Inserting course enrollments for students
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (1, 1, 1);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (2, 2, 1);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (3, 3, 1);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (4, 4, 2);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (5, 5, 2);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (6, 6, 3);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (7, 7, 3);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (8, 8, 4);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (9, 9, 4);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (10, 10, 4);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (11, 11, 1);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (12, 12, 1);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (13, 13, 2);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (14, 14, 2);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (15, 15, 3);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (16, 16, 3);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (17, 17, 4);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (18, 18, 4);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (19, 19, 1);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (20, 20, 1);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (21, 21, 5);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (22, 22, 2);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (23, 23, 3);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (24, 24, 5);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (25, 25, 4);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (26, 26, 4);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (27, 27, 1);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (28, 28, 6);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (29, 29, 2);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (30, 30, 2);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (31, 31, 3);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (32, 32, 3);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (33, 33, 4);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (34, 34, 4);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (35, 35, 1);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (36, 36, 1);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (37, 37, 2);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (38, 38, 2);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (39, 39, 3);
INSERT INTO course_enrollments (course_enrollments_id, student_id, course_id) VALUES (40, 40, 3);

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

-- Create procedure insert_department
CREATE OR REPLACE PROCEDURE insert_department (i_department_id IN NUMBER, i_department_name IN VARCHAR2) AS
BEGIN
    INSERT INTO departments (department_id, department_name) VALUES (i_department_id, i_department_name); 
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred ');
END ;
   
DECLARE
    iu_department_id NUMBER := &department_id;
    iu_department_name VARCHAR2(100) := '&department_name';
BEGIN
    insert_department(iu_department_id, iu_department_name);
    DBMS_OUTPUT.PUT_LINE('Department "' || iu_department_name || '" with ID ' || iu_department_id || ' has been successfully added.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inserting department ');
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
        DBMS_OUTPUT.PUT_LINE('An error occurred ');
END;

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
        DBMS_OUTPUT.PUT_LINE('An error occurred ');
END;

SET SERVEROUTPUT ON;
DECLARE
    v_department_id NUMBER := &department_id;
BEGIN
    delete_department(v_department_id);
END;

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
        DBMS_OUTPUT.PUT_LINE('An error occurred'|| SQLERRM);
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

-- Create TRIGGER student_id_increment 
CREATE OR REPLACE TRIGGER student_id_increment
BEFORE INSERT ON students
FOR EACH ROW
DECLARE
    max_student_id NUMBER;
BEGIN
    SELECT 
    CASE 
        WHEN MAX(student_id) IS NULL THEN 0 ELSE MAX(student_id) 
    END
    INTO max_student_id FROM students;
    :NEW.student_id := max_student_id + 1;
END student_id_increment;

-- Create procedure insert_student 
CREATE OR REPLACE PROCEDURE insert_student (p_first_name IN VARCHAR2, p_last_name IN VARCHAR2, p_email IN VARCHAR2,
    p_phone_number IN VARCHAR2, p_date_of_birth IN DATE, p_gender IN VARCHAR2, p_address IN VARCHAR2) AS
BEGIN
    INSERT INTO students (first_name, last_name, email, phone_number, date_of_birth, gender, address) 
    VALUES (p_first_name, p_last_name, p_email, p_phone_number, p_date_of_birth, p_gender, p_address);
    DBMS_OUTPUT.PUT_LINE('Student successfully added.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred');
END;

SET SERVEROUTPUT ON;
DECLARE
    v_first_name VARCHAR2(50) := '&first_name';
    v_last_name VARCHAR2(50) := '&last_name';
    v_email VARCHAR2(100) := '&email';
    v_phone_number VARCHAR2(15) := '&phone_number';
    v_date_of_birth DATE := TO_DATE('&date_of_birth', 'YYYY-MM-DD');
    v_gender VARCHAR2(15) := '&gender';
    v_address VARCHAR2(200) := '&address';
BEGIN
    insert_student(v_first_name, v_last_name, v_email, v_phone_number, v_date_of_birth, v_gender, v_address);
END;

-- Create procedure update_student 
CREATE OR REPLACE PROCEDURE update_student ( p_student_id IN NUMBER, p_first_name IN VARCHAR2, p_last_name IN VARCHAR2, p_email IN VARCHAR2,
    p_phone_number IN VARCHAR2, p_date_of_birth IN DATE, p_gender IN VARCHAR2, p_address IN VARCHAR2, p_status IN VARCHAR2) AS
    v_student_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_student_count FROM students WHERE student_id = p_student_id;
    IF v_student_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No student found');
    ELSE
        UPDATE students SET first_name = p_first_name, last_name = p_last_name, email = p_email, phone_number = p_phone_number,
            date_of_birth = p_date_of_birth, gender = p_gender, address = p_address, status = p_status
        WHERE student_id = p_student_id;
        DBMS_OUTPUT.PUT_LINE('Student updated.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred');
END;

SET SERVEROUTPUT ON;
DECLARE
    v_student_id NUMBER := &student_id;
    v_first_name VARCHAR2(50) := '&first_name';
    v_last_name VARCHAR2(50) := '&last_name';
    v_email VARCHAR2(100) := '&email';
    v_phone_number VARCHAR2(15) := '&phone_number';
    v_date_of_birth DATE := TO_DATE('&date_of_birth', 'YYYY-MM-DD');
    v_gender VARCHAR2(15) := '&gender';
    v_address VARCHAR2(200) := '&address';
    v_status VARCHAR2(20) := '&status';
BEGIN
    update_student(v_student_id, v_first_name, v_last_name, v_email, v_phone_number, v_date_of_birth, v_gender, v_address, v_status);
END;

-- Create procedure delete_student 
CREATE OR REPLACE PROCEDURE delete_student ( p_student_id IN NUMBER) AS v_student_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_student_count FROM students WHERE student_id = p_student_id;
    IF v_student_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No student found');
    ELSE
        DELETE FROM students WHERE student_id = p_student_id;
        DBMS_OUTPUT.PUT_LINE('Student deleted.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred ');
END;

SET SERVEROUTPUT ON;
DECLARE
    v_student_id NUMBER := &student_id;
BEGIN
    delete_student(v_student_id);
END;

-- Create TRIGGER course_enrollments_id_increment 
CREATE OR REPLACE TRIGGER course_enrollments_id_increment
BEFORE INSERT ON course_enrollments
FOR EACH ROW
DECLARE
    max_course_enrollments_id NUMBER;
BEGIN
    SELECT 
    CASE 
        WHEN MAX(course_enrollments_id) IS NULL THEN 0 ELSE MAX(course_enrollments_id) 
    END
    INTO max_course_enrollments_id FROM course_enrollments;
    :NEW.course_enrollments_id := max_course_enrollments_id + 1;
END;

-- Create procedure insert_course_enrollment 
CREATE OR REPLACE PROCEDURE insert_course_enrollment ( p_student_id IN NUMBER, p_course_id IN NUMBER) AS
BEGIN
    INSERT INTO course_enrollments (student_id, course_id) VALUES (p_student_id, p_course_id);
    DBMS_OUTPUT.PUT_LINE('Course enrollment added successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred');
END ;

SET SERVEROUTPUT ON;
DECLARE
    v_student_id NUMBER := &student_id;
    v_course_id NUMBER := &course_id;
BEGIN
    insert_course_enrollment(v_student_id, v_course_id);
END;

-- Create procedure update_course_enrollment
CREATE OR REPLACE PROCEDURE update_course_enrollment ( p_course_enrollments_id IN NUMBER, p_student_id IN NUMBER, p_course_id IN NUMBER) AS
    v_enrollment_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_enrollment_count FROM course_enrollments WHERE course_enrollments_id = p_course_enrollments_id;
    IF v_enrollment_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No course enrollment found');
    ELSE
        UPDATE course_enrollments SET student_id = p_student_id, course_id = p_course_id WHERE course_enrollments_id = p_course_enrollments_id;
        DBMS_OUTPUT.PUT_LINE('Course enrollment updated');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred');
END;

SET SERVEROUTPUT ON;
DECLARE
    v_course_enrollments_id NUMBER := &course_enrollments_id;
    v_student_id NUMBER := &student_id;
    v_course_id NUMBER := &course_id;
BEGIN
    update_course_enrollment(v_course_enrollments_id, v_student_id, v_course_id);
END;

-- Create procedure delete_course_enrollment
CREATE OR REPLACE PROCEDURE delete_course_enrollment ( p_course_enrollments_id IN NUMBER) AS v_enrollment_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_enrollment_count FROM course_enrollments WHERE course_enrollments_id = p_course_enrollments_id;
    IF v_enrollment_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No course enrollment found');
    ELSE
        DELETE FROM course_enrollments WHERE course_enrollments_id = p_course_enrollments_id;
        DBMS_OUTPUT.PUT_LINE('Course enrollment deleted.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred');
END;

SET SERVEROUTPUT ON;
DECLARE
    v_course_enrollments_id NUMBER := &course_enrollments_id;
BEGIN
    delete_course_enrollment(v_course_enrollments_id);
END;

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

-- Create a TRIGGER for assignment_idincrement
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

-- Create a SEQUENCE assignment_students_seq
CREATE SEQUENCE assignment_students_seq
START WITH 1
INCREMENT BY 1;

-- Create a TRIGGER for add_students_to_assignment
CREATE OR REPLACE TRIGGER add_students_to_assignment
AFTER INSERT ON assignment
FOR EACH ROW
DECLARE
    CURSOR student_cursor IS
        SELECT ce.student_id FROM course_enrollments ce JOIN lessons l ON l.course_id = ce.course_id 
        WHERE l.lesson_id = :NEW.lesson_id;
BEGIN
    FOR student_record IN student_cursor LOOP
        INSERT INTO assignment_students (assignment_students_id, assignment_id, student_id, status)
        VALUES (assignment_students_seq.NEXTVAL, :NEW.assignment_id, student_record.student_id, 'Not submitted');
    END LOOP;
END;
/

-- Create a PROCEDURE for insert_assignment
CREATE OR REPLACE PROCEDURE insert_assignment (p_assignment_title IN VARCHAR2, p_assignment_fiies IN VARCHAR2, p_lesson_id IN NUMBER, p_end_date IN DATE) AS
BEGIN
    INSERT INTO ADMIN.assignment (assignment_title,assignment_fiies,lesson_id,end_date) VALUES (p_assignment_title, p_assignment_fiies, p_lesson_id, p_end_date);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred try agin');
END;
/

SET SERVEROUTPUT ON;
DECLARE
    v_assignment_title VARCHAR2(255);
    v_assignment_fiies VARCHAR2(255);
    v_lesson_id NUMBER;
    v_end_date DATE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Enter Assignment Title:');
    v_assignment_title := '&assignment_title';
    DBMS_OUTPUT.PUT_LINE('Enter Assignment File Name:');
    v_assignment_fiies := '&assignment_fiies';
    DBMS_OUTPUT.PUT_LINE('Enter Lesson ID:');
    v_lesson_id := &lesson_id;
    DBMS_OUTPUT.PUT_LINE('Enter End Date(YYYY-MM-DD):');
    v_end_date := TO_DATE('&end_date','YYYY-MM-DD');
    ADMIN.insert_assignment(v_assignment_title, v_assignment_fiies, v_lesson_id, v_end_date);
    DBMS_OUTPUT.PUT_LINE('Assignment inserted successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred');
END;
/

-- Create a PROCEDURE for submit_assignment_student
CREATE OR REPLACE PROCEDURE submit_assignment_student (p_assignment_id IN NUMBER,p_students_id IN NUMBER,p_submit_file IN VARCHAR2) AS
BEGIN
    UPDATE ADMIN.assignment_students SET submit_file = p_submit_file, status = 'Submitted', submissionDate = SYSTIMESTAMP
    WHERE assignment_id = p_assignment_id AND student_id = p_students_id;
    DBMS_OUTPUT.PUT_LINE('Record updated successfully');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No record found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error');
END;
/

SET SERVEROUTPUT ON;
DECLARE
    v_assignment_id NUMBER;
    v_students_id NUMBER;
    v_submit_file VARCHAR2(255);
BEGIN
    DBMS_OUTPUT.PUT_LINE('Enter Assignment ID:');
    v_assignment_id := &assignment_id;
    DBMS_OUTPUT.PUT_LINE('Enter Assignment Student ID:');
    v_students_id := &students_id;
    DBMS_OUTPUT.PUT_LINE('Enter Submit File Name:');
    v_submit_file := '&submit_file';
    ADMIN.submit_assignment_student(v_assignment_id, v_students_id, v_submit_file);
    DBMS_OUTPUT.PUT_LINE('Assignment student record updated successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred');
END;
/

-- Create a PROCEDURE for grade_assignment_student
CREATE OR REPLACE PROCEDURE grade_assignment_student (p_assignment_id IN NUMBER,p_student_id IN NUMBER,p_grade IN VARCHAR2,p_feedback IN VARCHAR2) AS
BEGIN
    UPDATE ADMIN.assignment_students SET status = 'Graded', grade = p_grade, Feedback_on_Assessment = p_feedback
    WHERE assignment_id = p_assignment_id AND student_id = p_student_id;
    DBMS_OUTPUT.PUT_LINE('Assignment student record graded successfully.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No record found');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred');
END;
/

SET SERVEROUTPUT ON;
DECLARE
    v_assignment_id NUMBER;
    v_student_id NUMBER;
    v_grade VARCHAR2(20);
    v_feedback VARCHAR2(100);
BEGIN
    DBMS_OUTPUT.PUT_LINE('Enter Assignment ID:');
    v_assignment_id := &assignment_id;
    DBMS_OUTPUT.PUT_LINE('Enter Assignment Student ID:');
    v_student_id := &student_id;
    DBMS_OUTPUT.PUT_LINE('Enter Grade:');
    v_grade := '&grade';
    DBMS_OUTPUT.PUT_LINE('Enter Feedback:');
    v_feedback := '&feedback';
    ADMIN.grade_assignment_student(v_assignment_id, v_student_id, v_grade, v_feedback);
    DBMS_OUTPUT.PUT_LINE('Assignment student record updated successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred.');
END;
/

-- Create a TRIGGER for feedback_id_increment
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

-- Create a PROCEDURE for insert_student_feedback
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
        DBMS_OUTPUT.PUT_LINE('Error occurred');
END;
/

SET SERVEROUTPUT ON;
DECLARE
    v_course_id NUMBER;
    v_student_id NUMBER;
    v_comments VARCHAR2(255);
    v_rating NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Enter Course ID:');
    v_course_id := &course_id;
    DBMS_OUTPUT.PUT_LINE('Enter Student ID:');
    v_student_id := &student_id;
    DBMS_OUTPUT.PUT_LINE('Enter Comments:');
    v_comments := '&comments';   
    DBMS_OUTPUT.PUT_LINE('Enter Rating (1-5):');
    v_rating := &rating;
    ADMIN.insert_student_feedback(v_course_id, v_student_id, v_comments, v_rating);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/

INSERT INTO students_feedback (lesson_id, student_id, comments, rating) 
VALUES (1, 2, 'I enjoyed the interactive activities and practical examples.', 5);
INSERT INTO students_feedback (lesson_id, student_id, comments, rating) 
VALUES (1, 11, 'Very detailed and helpful. I learned a lot from this lesson.', 4);
INSERT INTO students_feedback (lesson_id, student_id, comments, rating) 
VALUES (1, 19, 'The lesson was engaging, but the lecture duration was too long.', 3);

-- Create a PROCEDURE for get_feedback_by_lecturer
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
        DBMS_OUTPUT.PUT_LINE('An error occurred');
END get_feedback_by_lecturer;
/

SET SERVEROUTPUT ON;
DECLARE
    v_lecturer_id NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Enter Lecturer ID:');
    v_lecturer_id := &lecturer_id;
    ADMIN.get_feedback_by_lecturer(v_lecturer_id);
END;
/

--Number of Courses Offered by Each Department
SELECT d.department_name, COUNT(c.course_id) AS number_of_courses FROM departments d LEFT JOIN courses c ON d.department_id = c.department_id
GROUP BY d.department_name ORDER BY number_of_courses DESC;

--Number of lessons and courses Offered by Each Department
SELECT d.department_id, d.department_name, COUNT(DISTINCT c.course_id) AS total_courses, COUNT(l.lesson_id) AS total_lessons
FROM departments d LEFT JOIN courses c ON d.department_id = c.department_id
LEFT JOIN lessons l ON c.course_id = l.course_id
GROUP BY d.department_id, d.department_name ORDER BY d.department_name;

--Lecturers Who Have Taught More Than 3 Lessons
SELECT l.lecturer_id, l.first_name, l.last_name, COUNT(ls.lesson_id) AS lessons_taught
FROM lecturers l INNER JOIN lessons ls ON l.lecturer_id = ls.taught_by
GROUP BY l.lecturer_id, l.first_name, l.last_name
HAVING COUNT(ls.lesson_id) > 3
ORDER BY lessons_taught DESC;

--All Students Enrolled in Diploma in Software Engineering
SELECT s.student_id, s.first_name, s.last_name, s.email
FROM students s INNER JOIN course_enrollments ce ON s.student_id = ce.student_id
INNER JOIN courses c ON ce.course_id = c.course_id
WHERE c.course_name = 'Diploma in Software Engineering ';

--All Assignments Due in Next 7 Days
SELECT a.assignment_title, a.end_date, c.course_name, l.lesson_name
FROM assignment a INNER JOIN lessons l ON a.lesson_id = l.lesson_id
INNER JOIN courses c ON l.course_id = c.course_id
WHERE a.end_date BETWEEN SYSDATE AND SYSDATE + 7
ORDER BY a.end_date;

--Average Salary of Lecturers in Each Department
SELECT d.department_name, AVG(l.salary) AS average_salary
FROM departments d INNER JOIN lecturers l ON d.department_id = l.department_id
GROUP BY d.department_name;

--Number of enrollments
SELECT c.course_name, COUNT(ce.student_id) AS number_of_enrollments
FROM courses c INNER JOIN course_enrollments ce ON c.course_id = ce.course_id
GROUP BY c.course_name ORDER BY number_of_enrollments DESC;

--Active  Lecturers with Active Courses
SELECT l.lecturer_id, l.first_name, l.last_name, c.course_name, c.status FROM lecturers l
INNER JOIN courses c ON l.lecturer_id = c.created_by
WHERE l.status = 'Active' AND c.status = 'Active';

--Courses Without any enrollments
SELECT c.* FROM courses c
LEFT JOIN course_enrollments ce ON c.course_id = ce.course_id
WHERE ce.course_id IS NULL;

--Total number of lessons per course
SELECT c.course_name, COUNT(l.lesson_id) AS total_lessons
FROM courses c LEFT JOIN lessons l ON c.course_id = l.course_id
GROUP BY c.course_name ORDER BY total_lessons DESC;

-- Students Who have enrolled in more than 2 courses
SELECT s.student_id, s.first_name, s.last_name, COUNT(ce.course_id) AS courses_enrolled FROM students s
INNER JOIN course_enrollments ce ON s.student_id = ce.student_id
GROUP BY s.student_id, s.first_name, s.last_name
HAVING COUNT(ce.course_id) > 1
ORDER BY courses_enrolled DESC;


SELECT * FROM departments;
SELECT * FROM lecturers;
SELECT * FROM courses;
SELECT * FROM course_enrollments;
SELECT * FROM students;
SELECT * FROM assignment;
SELECT * FROM assignment_students;
SELECT * FROM students_feedback;









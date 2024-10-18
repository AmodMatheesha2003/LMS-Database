CREATE USER ADMIN IDENTIFIED BY ADMIN123
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp 
QUOTA 20M ON users 
ACCOUNT UNLOCK;
/

GRANT ALL PRIVILEGES TO ADMIN;

CREATE USER LECTURER IDENTIFIED BY LECTURER123
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp 
QUOTA 20M ON users 
ACCOUNT UNLOCK;
/

CREATE USER STUDENT IDENTIFIED BY STUDENT123
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp 
QUOTA 20M ON users 
ACCOUNT UNLOCK;
/

CREATE ROLE USER_ROLE;

GRANT CONNECT TO USER_ROLE;
GRANT USER_ROLE TO STUDENT;
GRANT USER_ROLE TO LECTURER;

GRANT SELECT ON ADMIN.assignment TO USER_ROLE;
GRANT SELECT ON ADMIN.assignment_students TO USER_ROLE;
GRANT USER_ROLE TO STUDENT;
GRANT USER_ROLE TO LECTURER;

GRANT INSERT,DELETE,UPDATE ON ADMIN.assignment TO LECTURER;
GRANT UPDATE ON ADMIN.assignment_students TO LECTURER;
GRANT EXECUTE ON ADMIN.insert_assignment TO LECTURER;
GRANT EXECUTE ON ADMIN.grade_assignment_student TO LECTURER;
GRANT EXECUTE ON ADMIN.get_feedback_by_lecturer TO LECTURER;


GRANT UPDATE (submit_file, status, submissionDate) ON ADMIN.assignment_students TO STUDENT;
GRANT EXECUTE ON ADMIN.submit_assignment_student TO STUDENT;
GRANT EXECUTE ON ADMIN.insert_student_feedback TO STUDENT;







SELECT * FROM ADMIN.assignment_students;
SELECT * FROM ADMIN.assignment_students WHERE student_id = 1;

SELECT * FROM ADMIN.assignment_students WHERE student_id = 1 AND assignment_id = 1;

-- Submit assignment
SET SERVEROUTPUT ON;
DECLARE
    v_assignment_id NUMBER;
    v_assignment_students_id NUMBER;
    v_submit_file VARCHAR2(255);
BEGIN
    DBMS_OUTPUT.PUT_LINE('Enter Assignment ID:');
    v_assignment_id := &assignment_id;
    DBMS_OUTPUT.PUT_LINE('Enter Assignment Student ID:');
    v_assignment_students_id := &assignment_students_id;
    DBMS_OUTPUT.PUT_LINE('Enter Submit File Name:');
    v_submit_file := '&submit_file';
    ADMIN.submit_assignment_student(v_assignment_id, v_assignment_students_id, v_submit_file);
    DBMS_OUTPUT.PUT_LINE('Assignment student record updated successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred');
END;
/

--insert student feedback
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
    DBMS_OUTPUT.PUT_LINE('Feedback operation completed.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/


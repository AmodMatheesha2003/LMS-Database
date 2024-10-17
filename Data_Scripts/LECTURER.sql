INSERT INTO ADMIN.assignment (assignment_title, assignment_fiies, lesson_id, end_date) VALUES ('Assignment 8', 'file8.pdf', 1, TO_DATE('2024-10-28', 'YYYY-MM-DD'));

SELECT * FROM ADMIN.assignment;

DELETE FROM ADMIN.assignment WHERE assignment_id = 8;
DELETE FROM ADMIN.assignment_students WHERE assignment_id = 8;

UPDATE ADMIN.assignment SET assignment_fiies = 'file6.pdf',end_date = TO_DATE('2024-10-19', 'YYYY-MM-DD') WHERE assignment_title = 'Assignment 6';

SELECT * FROM ADMIN.assignment_students;

UPDATE ADMIN.assignment_students SET
    status = 'Graded',
    grade = 'A',
    Feedback_on_Assessment = 'Excellent work!' 
WHERE assignment_id = 1 AND assignment_students_id = 1;


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

SELECT * FROM ADMIN.assignment_students WHERE status = 'Submitted';
SELECT * FROM ADMIN.assignment_students WHERE status = 'Not submitted';
SELECT * FROM ADMIN.assignment_students WHERE status = 'Not submitted' AND assignment_id = 9;
SELECT * FROM ADMIN.assignment_students;


SET SERVEROUTPUT ON;
DECLARE
    v_assignment_id NUMBER;
    v_assignment_students_id NUMBER;
    v_grade VARCHAR2(20);
    v_feedback VARCHAR2(100);
BEGIN
    DBMS_OUTPUT.PUT_LINE('Enter Assignment ID:');
    v_assignment_id := &assignment_id;
    DBMS_OUTPUT.PUT_LINE('Enter Assignment Student ID:');
    v_assignment_students_id := &assignment_students_id;
    DBMS_OUTPUT.PUT_LINE('Enter Grade:');
    v_grade := '&grade';
    DBMS_OUTPUT.PUT_LINE('Enter Feedback:');
    v_feedback := '&feedback';
    ADMIN.grade_assignment_student(v_assignment_id, v_assignment_students_id, v_grade, v_feedback);
    DBMS_OUTPUT.PUT_LINE('Assignment student record updated successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred.');
END;
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

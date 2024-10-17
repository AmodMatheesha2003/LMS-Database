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




CREATE OR REPLACE PROCEDURE insert_assignment (p_assignment_title IN VARCHAR2, p_assignment_fiies IN VARCHAR2, p_lesson_id IN NUMBER, p_end_date IN DATE) AS
BEGIN
    INSERT INTO ADMIN.assignment (assignment_title,assignment_fiies,lesson_id,end_date) VALUES (p_assignment_title, p_assignment_fiies, p_lesson_id, p_end_date);
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred while inserting assignment Check and try agin');
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
    insert_assignment(v_assignment_title, v_assignment_fiies, v_lesson_id, v_end_date);
    DBMS_OUTPUT.PUT_LINE('Assignment inserted successfully');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred');
END;
/



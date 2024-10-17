SELECT * FROM ADMIN.assignment_students;
SELECT * FROM ADMIN.assignment_students WHERE student_id = 1;

SELECT * FROM ADMIN.assignment_students WHERE student_id = 1 AND assignment_id = 1;

UPDATE ADMIN.assignment_students SET 
    submit_file = 'test.docx',
    status = 'Submitted',
    submissionDate = SYSTIMESTAMP
WHERE assignment_id = 1 AND assignment_students_id = 1;


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


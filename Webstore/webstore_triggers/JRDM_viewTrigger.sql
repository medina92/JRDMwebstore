CREATE OR REPLACE VIEW employeeProcessing AS
SELECT e.e_ID, e.fname, e.lname, o.o_ID, o.status
FROM JRDM_employee e, JRDM_order o
WHERE e.e_ID = o.e_ID;

CREATE OR REPLACE TRIGGER JRDM_updEmpProcTrigger
INSTEAD OF UPDATE ON employeeProcessing
REFERENCING NEW AS n
FOR EACH ROW
BEGIN

    UPDATE JRDM_employee
    SET fname = :n.fname, lname = :n.lname 
    WHERE JRDM_employee.e_ID = :n.e_ID;

    UPDATE JRDM_order
    SET status = :n.status
    WHERE JRDM_order.o_ID = :n.o_ID;

    EXCEPTION
        WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE(SQLCODE || ', ' || SQLERRM);
        COMMIT;
END;
/


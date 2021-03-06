CREATE OR REPLACE TRIGGER JRDM_delOrderTrigger
BEFORE DELETE ON JRDM_order
FOR EACH ROW
BEGIN

    DELETE FROM JRDM_contains c
    WHERE c.o_ID = :old.o_ID;

    EXCEPTION
        WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE(SQLCODE || ', ' || SQLERRM);
        COMMIT;
END;
/


CREATE OR REPLACE TRIGGER JRDM_updDistributorTrigger
BEFORE UPDATE ON JRDM_distributor
FOR EACH ROW
BEGIN

    UPDATE JRDM_item i
    SET i.d_ID = :new.d_ID
    WHERE i.d_ID = :old.d_ID;

    EXCEPTION
        WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE(SQLCODE || ', ' || SQLERRM);
        COMMIT;
END;
/


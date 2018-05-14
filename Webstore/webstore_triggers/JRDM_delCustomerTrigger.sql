CREATE OR REPLACE TRIGGER JRDM_delCustomerTrigger
BEFORE DELETE ON JRDM_customer
FOR EACH ROW
BEGIN

    DELETE FROM JRDM_order o
    WHERE o.c_ID = JRDM_customer.c_ID;

    DELETE FROM JRDM_creditcard c
    WHERE c.c_ID = JRDM_customer.c_ID;
        
    EXCEPTION
        WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE(SQLCODE || ', ' || SQLERRM);
        COMMIT;
END;
/


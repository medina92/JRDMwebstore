CREATE OR REPLACE PROCEDURE JRDM_delCustomer (
    delete_id IN JRDM_customer.c_ID%TYPE 
)
IS
BEGIN
    DELETE
    FROM JRDM_creditcard
    WHERE c_ID = delete_id;

    DELETE 
    FROM JRDM_order
    WHERE c_ID = delete_id;

    DELETE
    FROM JRDM_customer
    WHERE c_ID = delete_id;

    COMMIT;

    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE(SQLCODE || ', ' || SQLERRM);
            COMMIT;
END;
/

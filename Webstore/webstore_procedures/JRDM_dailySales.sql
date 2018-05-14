CREATE OR REPLACE PROCEDURE JRDM_insCustomer (
)
iS
    daily_sum NUMBER(10)

    CURSOR d IS
        SELECT date_ordered, list_price, whole_sale_price
        FROM monthlySales
        ORDER BY date_ordered
BEGIN
    daily_sum = 0;

    FOR date_rec IN d
    LOOP
        IF date_rec.date_ordered > (SELECT  date_rec.date_ordered,     
                                    LEAD(date_rec.date_ordered) OVER (ORDER BY date_ordered)) THEN
            
    END LOOP
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE(SQLCODE || ', ' || SQLERRM);
            COMMIT;
END;
/

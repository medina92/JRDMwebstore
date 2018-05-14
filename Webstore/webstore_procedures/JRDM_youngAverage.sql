CREATE OR REPLACE FUNCTION JRDM_youngAverage (
    N NUMBER DEFAULT 1
)
RETURN NUMBER
IS
    avg_age NUMBER
BEGIN
    WITH orderByAge AS (
        SELECT FLOOR(MONTHS_BETWEEN(SYSDATE, birth_date) / 12) AS age
        FROM JRDM_customer
        ORDER BY birth_date DESC
    )
    SELECT AVG(age)
    INTO avg_age
    FROM orderByAge
    WHERE ROWNUM <= N;
    RETURN avg_age;

    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE(SQLCODE || ', ' || SQLERRM);
            COMMIT;
END;
/

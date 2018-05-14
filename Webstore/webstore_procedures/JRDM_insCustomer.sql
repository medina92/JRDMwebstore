CREATE OR REPLACE PROCEDURE JRDM_insCustomer (
    gender IN JRDM_customer.gender%TYPE,
    fname  IN JRDM_customer.fname%TYPE,
    lname IN JRDM_customer.lname%TYPE,
    birth_date IN JRDM_customer.birth_date%TYPE,
    street IN JRDM_customer.street%TYPE,
    city IN JRDM_customer.city%TYPE,
    state IN JRDM_customer.state%TYPE,
    zip IN JRDM_customer.zip%TYPE,
    phone_num IN JRDM_customer.phone_num%TYPE,
    email_address IN JRDM_customer.email_address%TYPE,
    password IN JRDM_customer.password%TYPE
)
iS
BEGIN
    INSERT INTO JRDM_customer(
        c_ID,
        gender,
        fname,
        lname,
        birth_date,
        street,
        city,
        state,
        zip,
        phone_num,
        email_address,
        password
    ) VALUES (
        c_idSequence.nextval,
        TRIM(gender),
        TRIM(fname),
        TRIM(lname),
        TRIM(birth_date),
        TRIM(street),
        TRIM(city),
        TRIM(state),
        TRIM(zip),
        TRIM(phone_num),
        TRIM(email_address),
        TRIM(password)
    );

    COMMIT;

    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE(SQLCODE || ', ' || SQLERRM);
            COMMIT;
END;
/

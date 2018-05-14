CREATE TABLE JRDM_creditcard (
    card_no varchar2(40) NOT NULL,
    c_ID number(6) NOT NULL,
    fname varchar2(40) NOT NULL,
    lname varchar2(40) NOT NULL,
    exp_date date NOT NULL,
    security_code number(3) NOT NULL,
    card_type varchar2(40) NOT NULL,
    CONSTRAINT pk_JRDM_creditcard PRIMARY KEY(card_no),
    CONSTRAINT fk_JRDM_creditcard FOREIGN KEY(c_ID) REFERENCES JRDM_customer(c_ID)
    ON DELETE CASCADE
)
    PCTFree 5
    PCTUSED 15
    TABLESPACE CS342
/

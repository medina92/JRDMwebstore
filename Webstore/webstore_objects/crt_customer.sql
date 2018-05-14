CREATE TABLE JRDM_customer (
    c_ID number(6) NOT NULL,
    gender varchar2(1) NOT NULL,
    fname varchar2(40) NOT NULL,
    lname varchar2(40) NOT NULL,
    birth_date date NOT NULL,
    street varchar2(40) NOT NULL,
    city varchar2(40) NOT NULL,
    state varchar2(40) NOT NULL,
    zip number(5) NOT NULL,
    phone_num varchar2(20) NOT NULL,
    email_address varchar2(40) UNIQUE NOT NULL,
    password varchar2(40) NOT NULL,
    CONSTRAINT pk_JRDM_customer PRIMARY KEY(c_ID)
)
    PCTFree 5
    PCTUSED 15
    TABLESPACE CS342
/

CREATE TABLE JRDM_employee (
    e_ID number(6) NOT NULL,
    fname varchar2(40) NOT NULL,
    lname varchar2(40) NOT NULL,
    birth_date date NOT NULL,
    street varchar2(40) NOT NULL,
    city varchar2(40) NOT NULL,
    state varchar2(40) NOT NULL,
    zip number(5) NOT NULL,
    phone_num number(11) NOT NULL,
    start_date date NOT null,
    end_date date,
    CONSTRAINT pk_JRDM_employee PRIMARY KEY(e_ID)
)
    PCTFree 5
    PCTUSED 15
    TABLESPACE CS342
/

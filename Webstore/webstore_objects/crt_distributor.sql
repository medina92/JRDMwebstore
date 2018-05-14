CREATE TABLE JRDM_distributor (
    d_ID number(6) NOT NULL,
    name varchar2(40) NOT NULL,
    street varchar2(40) NOT NULL,
    city varchar2(40) NOT NULL,
    state varchar2(40) NOT NULL,
    zip number(5) NOT NULL,
    phone_no number(11) NOT NULL,
    CONSTRAINT pk_JRDM_distributor PRIMARY KEY(d_ID)
)
    PCTFree 5
    PCTUSED 15
    TABLESPACE CS342
/

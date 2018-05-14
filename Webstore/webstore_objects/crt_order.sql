CREATE TABLE JRDM_order (
    o_ID number(6) NOT NULL,
    e_ID number(6) NOT NULL,
    c_ID number(6) NOT NULL,
    card_no varchar2(20) NOT NULL,
    date_ordered date NOT NULL,
    start_date date NOT NULL,
    end_date date,
    status number(1) NOT NULL,
    CONSTRAINT order_check CHECK (status = 0 or status = 1), -- 0: shipped, 1: processing
    shipping_method varchar2(40),
    tracking_no varchar2(40),
    date_shipped date,
    CONSTRAINT pk_JRDM_order PRIMARY KEY(o_ID),
    CONSTRAINT fk_JRDM_order FOREIGN KEY(e_ID) REFERENCES JRDM_employee(e_ID), 
    CONSTRAINT fk2_JRDM_order FOREIGN KEY(c_ID) REFERENCES JRDM_customer(c_ID),
    CONSTRAINT fk3_JRDM_order FOREIGN KEY(card_no) REFERENCES JRDM_creditcard(card_no)
    ON DELETE CASCADE
)
    PCTFree 5
    PCTUSED 15
    TABLESPACE CS342
/

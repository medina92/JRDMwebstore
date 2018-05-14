CREATE TABLE JRDM_item (
    i_ID number(6) NOT NULL,
    d_ID number(6) NOT NULL,
    title varchar2(40) NOT NULL,
    genre varchar2(40) NOT NULL,
    img_file varchar2(40) NOT NULL,
    list_price number(6,2) NOT NULL,
    whole_sale_price number(6,2) NOT NULL,
    release_date date NOT NULL,
    pre_order_date date,
    return_status number(1) NOT NULL,
    CONSTRAINT item_check CHECK (return_status = 0 or return_status = 1), -- 0: Yes, 1: No
    CONSTRAINT pk_JRDM_item PRIMARY KEY(i_ID),
    CONSTRAINT fk_JRDM_item FOREIGN KEY(d_ID) REFERENCES JRDM_distributor(d_ID)
    ON DELETE CASCADE
)
    PCTFree 5
    PCTUSED 15
    TABLESPACE CS342
/

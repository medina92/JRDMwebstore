CREATE TABLE JRDM_contains (
    o_ID number(6) NOT NULL,
    i_ID number(6) NOT NULL,
    quantity number(2) NOT NULL,
    CONSTRAINT pk_JRDM_contains PRIMARY KEY(o_ID,i_ID),
    CONSTRAINT fk_JRDM_contains FOREIGN KEY(o_ID) REFERENCES JRDM_order(o_ID),
    CONSTRAINT fk2_JRDM_contains FOREIGN KEY(i_ID) REFERENCES JRDM_item(i_ID)
    ON DELETE CASCADE
)
    PCTFree 5
    PCTUSED 15
    TABLESPACE CS342
/

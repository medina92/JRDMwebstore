CREATE TABLE JRDM_format (
    i_ID number(6) NOT NULL,
    format varchar(40) NOT NULL,
    CONSTRAINT pk_JRDM_format PRIMARY KEY(i_ID,format),
    CONSTRAINT fk_JRDM_format FOREIGN KEY(i_ID) REFERENCES JRDM_item(i_ID)
    ON DELETE CASCADE
)
    PCTFree 5
    PCTUSED 15
    TABLESPACE CS342
/


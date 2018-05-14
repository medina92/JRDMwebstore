CREATE TABLE JRDM_music (
    i_ID number(6) NOT NULL,
    artist varchar2(40) NOT NULL,
    record_label varchar2(40) NOT NULL,
    CONSTRAINT pk_JRDM_music PRIMARY KEY(i_ID,artist),
    CONSTRAINT fk_JRDM_music FOREIGN KEY(i_ID) REFERENCES JRDM_item(i_ID)
)
    PCTFree 5
    PCTUSED 15
    TABLESPACE CS342
/

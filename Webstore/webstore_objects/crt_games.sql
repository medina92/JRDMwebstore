CREATE TABLE JRDM_games (
    i_ID number(6) NOT NULL,
    developer varchar2(40) NOT NULL,
    publisher varchar2(40) NOT NULL,
    CONSTRAINT pk_JRDM_games PRIMARY KEY(i_ID,developer),
    CONSTRAINT fk_JRDM_games FOREIGN KEY(i_ID) REFERENCES JRDM_item(i_ID)
)
    PCTFree 5
    PCTUSED 15
    TABLESPACE CS342
/

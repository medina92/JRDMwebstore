CREATE TABLE JRDM_movies (
    i_ID number(6) NOT NULL,
    director varchar2(40) NOT NULL,
    production_company varchar2(40) NOT NULL,
    CONSTRAINT pk_JRDM_movies PRIMARY KEY(i_ID,director),
    CONSTRAINT fk_JRDM_movies FOREIGN KEY(i_ID) REFERENCES JRDM_item(i_ID)
)
    PCTFree 5
    PCTUSED 15
    TABLESPACE CS342
/

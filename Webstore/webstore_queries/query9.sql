SELECT UNIQUE *
FROM JRDM_employee NATURAL JOIN (SELECT e_ID
                                 FROM JRDM_order
                                 WHERE date_ordered < TO_DATE('2008/01/01','yyyy/mm/dd') OR date_ordered > TO_DATE('2010/12/31','yyyy/mm/dd'));

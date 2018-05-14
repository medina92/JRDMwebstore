SELECT * 
FROM JRDM_customer 
WHERE birth_date > TO_DATE('1991/12/31','yyyy/mm/dd') AND fname = 'Julia' AND lname = 'Woods';

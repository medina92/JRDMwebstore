SELECT *
FROM JRDM_employee e LEFT OUTER JOIN JRDM_order o ON e.e_ID = o.e_ID AND e.end_date IS NULL AND o.end_date IS NULL; 

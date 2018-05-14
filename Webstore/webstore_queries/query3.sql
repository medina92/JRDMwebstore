SELECT *
FROM JRDM_employee e
WHERE NOT EXISTS (SELECT * 
                  FROM JRDM_customer c INNER JOIN JRDM_order o2 ON c.c_ID = o2.o_ID
                  WHERE c.fname = 'Mary' AND c.lname = 'Lynch' AND NOT EXISTS (SELECT *
                                                                               FROM JRDM_order o
                                                                               WHERE o.e_ID = e.e_ID AND o.o_ID = o2.o_ID)
                 );                                                             

SELECT * 
FROM JRDM_customer c
WHERE NOT EXISTS (SELECT *
                  FROM JRDM_item i 
                  WHERE NOT EXISTS (SELECT *
                                    FROM JRDM_order o INNER JOIN JRDM_contains co ON o.o_ID = co.o_ID
                                    WHERE i.i_ID = co.i_ID and o.c_ID = c.c_ID)            
                );

SELECT * 
FROM JRDM_customer c
WHERE NOT EXISTS (SELECT *
                  FROM JRDM_item i INNER JOIN JRDM_contains co ON i.i_ID = co.i_ID
                  WHERE NOT EXISTS (SELECT *
                                    FROM JRDM_order o
                                    WHERE o.o_ID = co.o_ID and o.c_ID = c.c_ID)            
                );

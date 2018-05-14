SELECT *
FROM JRDM_customer
WHERE EXISTS (SELECT *
              FROM JRDM_customer NATURAL JOIN JRDM_order)
MINUS
SELECT *
FROM JRDM_customer NATURAL JOIN (SELECT c_ID
                                 FROM JRDM_order NATURAL JOIN (SELECT o_ID
                                                               FROM JRDM_contains NATURAL JOIN (SELECT i_ID 
                                                                                                FROM JRDM_item
                                                                                                WHERE list_price < 30)
                                                              )
                                );

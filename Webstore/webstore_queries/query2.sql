SELECT UNIQUE *
FROM JRDM_order NATURAL JOIN (SELECT o_ID
                              FROM JRDM_contains NATURAL JOIN (SELECT i_ID
                                                               FROM JRDM_item
                                                               MINUS
                                                               SELECT i1.i_ID
                                                               FROM JRDM_item i1, JRDM_item i2
                                                               WHERE i2.list_price > i1.list_price)
                             );

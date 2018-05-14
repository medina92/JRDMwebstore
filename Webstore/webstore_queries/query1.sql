SELECT *
FROM JRDM_employee NATURAL JOIN (  SELECT e_ID 
                                    FROM (  SELECT c_ID 
                                            FROM JRDM_customer
                                            WHERE birth_date >= to_date('1986/1/1','yyyy/mm/dd') AND birth_date <= to_date('1986/12/31','yyyy/mm/dd')
                                            ) NATURAL JOIN JRDM_order
                                    )
WHERE birth_date >= to_date('1986/1/1','yyyy/mm/dd') AND birth_date <= to_date('1986/12/31','yyyy/mm/dd');

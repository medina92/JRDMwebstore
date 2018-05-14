SELECT *
FROM JRDM_item NATURAL JOIN (SELECT d_ID
                             FROM JRDM_distributor
                             WHERE name = 'Riffwire' AND city = 'Springfield');

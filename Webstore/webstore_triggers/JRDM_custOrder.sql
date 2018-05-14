CREATE OR REPLACE VIEW custOrder AS
(SELECT * FROM jrdm_order NATURAL JOIN jrdm_contains NATURAL JOIN jrdm_item NATURAL JOIN jrdm_customer)
/

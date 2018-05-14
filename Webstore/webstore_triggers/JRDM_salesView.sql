CREATE OR REPLACE VIEW monthlySales AS
SELECT o_ID, i_ID, date_ordered, list_price, whole_sale_price, quantity
From JRDM_order NATURAL JOIN JRDM_contains NATURAL JOIN JRDM_item ORDER BY date_ordered ASC; 


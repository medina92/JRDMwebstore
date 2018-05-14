SELECT SUM(list_price) "Total", SUM(whole_sale_price) "wholeTotal",SUM(list_price) - SUM(whole_sale_price) "Gross Sales" 
FROM monthlySales
WHERE date_ordered BETWEEN to_date('2012','yyyy') AND SYSDATE
/

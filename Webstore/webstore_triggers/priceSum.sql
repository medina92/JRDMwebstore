SELECT SUM(list_price) "Total", SUM(whole_sale_price) "wholeTotal" 
FROM monthlySales
ORDER BY o_ID
/

Select * from jrdm_order where (date_ordered > to_date('2015/10/10','yyyy/mm/dd')) and (date_ordered < sysdate)
order by date_ordered
/

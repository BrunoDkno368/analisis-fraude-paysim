select 
	type as tipo,
    count(*) as transacciones,
    sum(isFraud) as frudes,
    round(100*sum(isFraud)/ count(*),2) as tasa_fraude_pct
from tabla_paysim
group by type
order by tasa_fraude_pct desc;
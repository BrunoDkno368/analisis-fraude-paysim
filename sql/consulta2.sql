use fraude_paysim;

   
-- Tasa de fraude segun lo que paso con la cuenta origen
select 
	case
		when   oldbalanceOrg =0    then '1 Origen ya es cero'
        when   newbalanceOrig = 0    then '2 Origen vaciado en la operacion'
		else '3 Origen con saldo restante'
	end as estado_origen,
    count(*) as transacciones,
    sum(isFraud) as fraudes,
    round(100* sum(isFraud)/count(*),2) as tasa_fraude_pct
from tabla_paysim
where type in ('TRANSFER', 'CASH_OUT')
group by estado_origen
order by estado_origen;	
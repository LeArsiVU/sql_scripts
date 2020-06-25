
use domo;

select COUNT(sec_ordencommerce),sec_ordencommerce, fec_fechaorden from mae_ordenes 
group by fec_fechaorden,sec_ordencommerce
limit 10;

select COUNT(sec_ordencommerce) 
from mae_ordenes
where DATE(fec_fechaorden) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')
;

select COUNT(sec_ordencommerce) 
from mae_ordenes
where DATE(fec_fechaorden) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND (DATE(fec_FechaFacturacion) IS NULL OR DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d'))
;

select COUNT(CASE 
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')
THEN sec_ordencommerce
END)/COUNT( CASE
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND (DATE(fec_FechaFacturacion) IS NULL OR DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')) 
THEN sec_ordencommerce
END) 
from mae_ordenes
;
use domo;

-- MES
select 
CASE
WHEN des_BuildingBlock ='APP COPPEL' THEN des_BuildingBlock
WHEN des_BuildingBlock ='COPPEL.COM EN TIENDA' THEN des_BuildingBlock
ELSE 'COPPEL.COM'
END as des_canal,
 COUNT(CASE 
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')
THEN sec_ordencommerce
END)/COUNT( CASE
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND (DATE(fec_FechaFacturacion) IS NULL OR DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')) 
THEN sec_ordencommerce
END) 
from mae_ordenes
group by des_canal
UNION ALL
SELECT 'TOTAL',
 COUNT(CASE 
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')
THEN sec_ordencommerce
END)/COUNT( CASE
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND (DATE(fec_FechaFacturacion) IS NULL OR DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')) 
THEN sec_ordencommerce
END) 
from mae_ordenes;

-- LY mes
select 
CASE
WHEN des_BuildingBlock ='APP COPPEL' THEN des_BuildingBlock
WHEN des_BuildingBlock ='COPPEL.COM EN TIENDA' THEN des_BuildingBlock
ELSE 'COPPEL.COM'
END as des_canal,
 COUNT(CASE 
WHEN DATE(DATE_ADD(fec_fechaorden,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')
THEN sec_ordencommerce
END)/COUNT( CASE
WHEN DATE(DATE_ADD(fec_fechaorden,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND (DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) IS NULL OR DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')) 
THEN sec_ordencommerce
END) 
from mae_ordenes
group by des_canal
UNION ALL
SELECT 'TOTAL',
 COUNT(CASE 
WHEN DATE(DATE_ADD(fec_fechaorden,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')
THEN sec_ordencommerce
END)/COUNT( CASE
WHEN DATE(DATE_ADD(fec_fechaorden,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND (DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) IS NULL OR DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')) 
THEN sec_ordencommerce
END) 
from mae_ordenes;

-- YtoD
select 
CASE
WHEN des_BuildingBlock ='APP COPPEL' THEN des_BuildingBlock
WHEN des_BuildingBlock ='COPPEL.COM EN TIENDA' THEN des_BuildingBlock
ELSE 'COPPEL.COM'
END as des_canal,
 COUNT(CASE 
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')
THEN sec_ordencommerce
END)/COUNT( CASE
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND (DATE(fec_FechaFacturacion) IS NULL OR DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')) 
THEN sec_ordencommerce
END) 
from mae_ordenes
group by des_canal
UNION ALL
SELECT 'TOTAL',
 COUNT(CASE 
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')
THEN sec_ordencommerce
END)/COUNT( CASE
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND (DATE(fec_FechaFacturacion) IS NULL OR DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')) 
THEN sec_ordencommerce
END) 
from mae_ordenes;

-- LY YtD
select 
CASE
WHEN des_BuildingBlock ='APP COPPEL' THEN des_BuildingBlock
WHEN des_BuildingBlock ='COPPEL.COM EN TIENDA' THEN des_BuildingBlock
ELSE 'COPPEL.COM'
END as des_canal,
 COUNT(CASE 
WHEN DATE(DATE_ADD(fec_fechaorden,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')
THEN sec_ordencommerce
END)/COUNT( CASE
WHEN DATE(DATE_ADD(fec_fechaorden,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND (DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) IS NULL OR DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')) 
THEN sec_ordencommerce
END) 
from mae_ordenes
group by des_canal
UNION ALL
SELECT 'TOTAL',
 COUNT(CASE 
WHEN DATE(DATE_ADD(fec_fechaorden,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')
THEN sec_ordencommerce
END)/COUNT( CASE
WHEN DATE(DATE_ADD(fec_fechaorden,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND (DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) IS NULL OR DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')) 
THEN sec_ordencommerce
END) 
from mae_ordenes;


-- unido
select CASE
WHEN des_BuildingBlock ='APP COPPEL' THEN des_BuildingBlock
WHEN des_BuildingBlock ='COPPEL.COM EN TIENDA' THEN des_BuildingBlock
ELSE 'COPPEL.COM'
END as des_canal,
 COUNT(CASE 
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')
THEN sec_ordencommerce
END)/COUNT( CASE
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND (DATE(fec_FechaFacturacion) IS NULL OR DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')) 
THEN sec_ordencommerce
END), COUNT(CASE 
WHEN DATE(DATE_ADD(fec_fechaorden,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')
THEN sec_ordencommerce
END)/COUNT( CASE
WHEN DATE(DATE_ADD(fec_fechaorden,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND (DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) IS NULL OR DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')) 
THEN sec_ordencommerce
END), 
 COUNT(CASE 
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')
THEN sec_ordencommerce
END)/COUNT( CASE
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND (DATE(fec_FechaFacturacion) IS NULL OR DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')) 
THEN sec_ordencommerce
END), 
 COUNT(CASE 
WHEN DATE(DATE_ADD(fec_fechaorden,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')
THEN sec_ordencommerce
END)/COUNT( CASE
WHEN DATE(DATE_ADD(fec_fechaorden,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND (DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) IS NULL OR DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')) 
THEN sec_ordencommerce
END) 
from mae_ordenes
group by des_canal
 UNION ALL
SELECT 'TOTAL',
 COUNT(CASE 
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')
THEN sec_ordencommerce
END)/COUNT( CASE
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND (DATE(fec_FechaFacturacion) IS NULL OR DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')) 
THEN sec_ordencommerce
END),  COUNT(CASE 
WHEN DATE(DATE_ADD(fec_fechaorden,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')
THEN sec_ordencommerce
END)/COUNT( CASE
WHEN DATE(DATE_ADD(fec_fechaorden,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND (DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) IS NULL OR DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')) 
THEN sec_ordencommerce
END), COUNT(CASE 
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')
THEN sec_ordencommerce
END)/COUNT( CASE
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND (DATE(fec_FechaFacturacion) IS NULL OR DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')) 
THEN sec_ordencommerce
END),COUNT(CASE 
WHEN DATE(DATE_ADD(fec_fechaorden,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')
THEN sec_ordencommerce
END)/COUNT( CASE
WHEN DATE(DATE_ADD(fec_fechaorden,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND (DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) IS NULL OR DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')) 
THEN sec_ordencommerce
END) 
from mae_ordenes;
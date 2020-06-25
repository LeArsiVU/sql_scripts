-- MES
select 
CASE
WHEN des_BuildingBlock ='APP COPPEL' THEN des_BuildingBlock
WHEN des_BuildingBlock ='COPPEL.COM EN TIENDA' THEN des_BuildingBlock
ELSE 'COPPEL.COM'
END as des_canal,
 SUM(CASE 
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND des_estatusorden='Contracargo' THEN  imp_preciounitario*num_cantidad
ELSE 0
END)/SUM( CASE
WHEN  DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d') 
THEN  imp_preciounitario*num_cantidad
ELSE  0
END) 
from mae_ordenes
group by des_canal
UNION ALL
SELECT 'TOTAL',
 SUM(CASE 
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND des_estatusorden='Contracargo' THEN  imp_preciounitario*num_cantidad
ELSE 0
END)/SUM( CASE
WHEN  DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d') 
THEN  imp_preciounitario*num_cantidad
ELSE  0
END) 
from mae_ordenes;

-- LY mes
select 
CASE
WHEN des_BuildingBlock ='APP COPPEL' THEN des_BuildingBlock
WHEN des_BuildingBlock ='COPPEL.COM EN TIENDA' THEN des_BuildingBlock
ELSE 'COPPEL.COM'
END as des_canal,
 SUM(CASE 
WHEN DATE(DATE_ADD(fec_fechaorden,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND des_estatusorden='Contracargo' THEN  imp_preciounitario*num_cantidad
ELSE 0
END)/SUM( CASE
WHEN DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d') 
THEN  imp_preciounitario*num_cantidad
ELSE 0
END) 
from mae_ordenes
group by des_canal
UNION ALL
SELECT 'TOTAL',
 SUM(CASE 
WHEN DATE(DATE_ADD(fec_fechaorden,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND des_estatusorden='Contracargo' THEN  imp_preciounitario*num_cantidad
ELSE 0
END)/SUM( CASE
WHEN DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d') 
THEN  imp_preciounitario*num_cantidad
ELSE 0
END) 
from mae_ordenes;

-- YtoD
select 
CASE
WHEN des_BuildingBlock ='APP COPPEL' THEN des_BuildingBlock
WHEN des_BuildingBlock ='COPPEL.COM EN TIENDA' THEN des_BuildingBlock
ELSE 'COPPEL.COM'
END as des_canal,
 SUM(CASE 
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND des_estatusorden='Contracargo' THEN  imp_preciounitario*num_cantidad
ELSE 0
END)/SUM( CASE
WHEN DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')
THEN  imp_preciounitario*num_cantidad
ELSE 0
END) 
from mae_ordenes
group by des_canal
UNION ALL
SELECT 'TOTAL',SUM(CASE 
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND des_estatusorden='Contracargo' THEN  imp_preciounitario*num_cantidad
ELSE 0
END)/SUM( CASE
WHEN DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')
THEN  imp_preciounitario*num_cantidad
ELSE 0
END)
from mae_ordenes;

-- LY YtD
select 
CASE
WHEN des_BuildingBlock ='APP COPPEL' THEN des_BuildingBlock
WHEN des_BuildingBlock ='COPPEL.COM EN TIENDA' THEN des_BuildingBlock
ELSE 'COPPEL.COM'
END as des_canal,
 SUM(CASE 
WHEN DATE(DATE_ADD(fec_fechaorden,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND des_estatusorden='Contracargo' THEN  imp_preciounitario*num_cantidad
END)/SUM( CASE
WHEN DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d') THEN  imp_preciounitario*num_cantidad
ELSE 0
END) 
from mae_ordenes
group by des_canal
UNION ALL
SELECT 'TOTAL',
 SUM(CASE 
WHEN DATE(DATE_ADD(fec_fechaorden,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND des_estatusorden='Contracargo' THEN  imp_preciounitario*num_cantidad
END)/SUM( CASE
WHEN DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d') THEN  imp_preciounitario*num_cantidad
ELSE 0
END)
from mae_ordenes;



select 
CASE
WHEN des_BuildingBlock ='APP COPPEL' THEN des_BuildingBlock
WHEN des_BuildingBlock ='COPPEL.COM EN TIENDA' THEN des_BuildingBlock
ELSE 'COPPEL.COM'
END as des_canal,
 SUM(CASE 
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND des_estatusorden='Contracargo' THEN  imp_preciounitario*num_cantidad
ELSE 0
END)/SUM( CASE
WHEN  DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d') 
THEN  imp_preciounitario*num_cantidad
ELSE  0
END),  SUM(CASE 
WHEN DATE(DATE_ADD(fec_fechaorden,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND des_estatusorden='Contracargo' THEN  imp_preciounitario*num_cantidad
ELSE 0
END)/SUM( CASE
WHEN DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d') 
THEN  imp_preciounitario*num_cantidad
ELSE 0
END),SUM(CASE 
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND des_estatusorden='Contracargo' THEN  imp_preciounitario*num_cantidad
ELSE 0
END)/SUM( CASE
WHEN DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')
THEN  imp_preciounitario*num_cantidad
ELSE 0
END),
 SUM(CASE 
WHEN DATE(DATE_ADD(fec_fechaorden,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND des_estatusorden='Contracargo' THEN  imp_preciounitario*num_cantidad
END)/SUM( CASE
WHEN DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d') THEN  imp_preciounitario*num_cantidad
ELSE 0
END) 


from mae_ordenes
group by des_canal
UNION ALL
SELECT 'TOTAL',
SUM(CASE 
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND des_estatusorden='Contracargo' THEN  imp_preciounitario*num_cantidad
ELSE 0
END)/SUM( CASE
WHEN  DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d') 
THEN  imp_preciounitario*num_cantidad
ELSE  0
END),  SUM(CASE 
WHEN DATE(DATE_ADD(fec_fechaorden,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND des_estatusorden='Contracargo' THEN  imp_preciounitario*num_cantidad
ELSE 0
END)/SUM( CASE
WHEN DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,04,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d') 
THEN  imp_preciounitario*num_cantidad
ELSE 0
END), SUM(CASE 
WHEN DATE(fec_fechaorden) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND des_estatusorden='Contracargo' THEN  imp_preciounitario*num_cantidad
ELSE 0
END)/SUM( CASE
WHEN DATE(fec_FechaFacturacion) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d')
THEN  imp_preciounitario*num_cantidad
ELSE 0
END), SUM(CASE 
WHEN DATE(DATE_ADD(fec_fechaorden,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,04,30",'%Y,%m,%d')
AND des_estatusorden='Contracargo' THEN  imp_preciounitario*num_cantidad
END)/SUM( CASE
WHEN DATE(DATE_ADD(fec_FechaFacturacion,INTERVAL 1 YEAR)) BETWEEN str_to_date("2020,01,01",'%Y,%m,%d') AND str_to_date("2020,05,10",'%Y,%m,%d') THEN  imp_preciounitario*num_cantidad
ELSE 0
END)
from mae_ordenes;


select 
CASE
WHEN des_BuildingBlock ='APP COPPEL' THEN des_BuildingBlock
WHEN des_BuildingBlock ='COPPEL.COM EN TIENDA' THEN des_BuildingBlock
ELSE 'COPPEL.COM'
END as des_canal,

COUNT( distinct CASE
WHEN LAST_DAY(DATE(fec_fechaorden)) =LAST_DAY(CURRENT_DATE()) AND DAY(DATE(fec_fechaorden)) <=10 AND fec_FechaFacturacion IS NOT NULL THEN  sec_ordencommerce
END)
as num_ordenes_mes,

COUNT( distinct CASE
WHEN LAST_DAY(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR)) =LAST_DAY(CURRENT_DATE()) AND DAY(DATE(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR))) <=10 AND fec_FechaFacturacion IS NOT NULL THEN  sec_ordencommerce
END)
as num_ordenes_LY_mes,

COUNT( distinct CASE
WHEN YEAR(fec_fechaorden) =YEAR(CURRENT_DATE()) AND DATE(fec_fechaorden)<= current_date() AND fec_FechaFacturacion IS NOT NULL  THEN  sec_ordencommerce
END)
as num_ordenes_YtD,

COUNT( distinct CASE
WHEN YEAR(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR)) =YEAR(CURRENT_DATE()) AND DATE(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR))<= current_date() AND fec_FechaFacturacion IS NOT NULL THEN  sec_ordencommerce
END)
as num_ordenes_LY_YtD

from mae_ordenes 
group by des_canal
limit 10;


/*     */

select 
CASE
WHEN des_BuildingBlock ='APP COPPEL' THEN des_BuildingBlock
WHEN des_BuildingBlock ='COPPEL.COM EN TIENDA' THEN des_BuildingBlock
ELSE 'COPPEL.COM'
END as des_canal,

COUNT(distinct
CASE
WHEN LAST_DAY(DATE(fec_fechaorden)) =LAST_DAY(CURRENT_DATE()) AND DAY(DATE(fec_fechaorden)) <=10 AND fec_FechaFacturacion IS NOT NULL THEN  sec_ordencommerce
END)/ 
COUNT(distinct 
CASE
WHEN LAST_DAY(DATE(fec_fechaorden)) =LAST_DAY(CURRENT_DATE()) AND DAY(DATE(fec_fechaorden)) <=10 THEN  sec_ordencommerce
END)
as Tasa_Facturacion_mes,

COUNT(distinct 
CASE
WHEN LAST_DAY(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR)) =LAST_DAY(CURRENT_DATE()) AND DAY(DATE(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR))) <=10 AND fec_FechaFacturacion IS NOT NULL THEN  sec_ordencommerce
END)/ COUNT( distinct CASE
WHEN LAST_DAY(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR)) =LAST_DAY(CURRENT_DATE()) AND DAY(DATE(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR))) <=10 THEN  sec_ordencommerce
END)
as Tasa_Facturacion_LY_mes,

COUNT(distinct 
CASE
WHEN YEAR(fec_fechaorden) =YEAR(CURRENT_DATE()) AND DATE(fec_fechaorden)<= str_to_date(CONCAT(YEAR(CURRENT_DATE()),",",MONTH(CURRENT_DATE()),",",10),'%Y,%m,%d') AND fec_FechaFacturacion IS NOT NULL  THEN  sec_ordencommerce
END)/ COUNT(distinct 
CASE
WHEN YEAR(fec_fechaorden) =YEAR(CURRENT_DATE()) AND DATE(fec_fechaorden)<= str_to_date(CONCAT(YEAR(CURRENT_DATE()),",",MONTH(CURRENT_DATE()),",",10),'%Y,%m,%d') THEN  sec_ordencommerce
END)
as Tasa_Facturacion_ytd,

COUNT( distinct
CASE
WHEN YEAR(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR)) =YEAR(CURRENT_DATE()) AND DATE(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR))<= str_to_date(CONCAT(YEAR(CURRENT_DATE()),",",MONTH(CURRENT_DATE()),",",10),'%Y,%m,%d')  AND fec_FechaFacturacion IS NOT NULL THEN  sec_ordencommerce
END)/ COUNT( distinct CASE
WHEN YEAR(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR)) =YEAR(CURRENT_DATE()) AND DATE(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR))<= str_to_date(CONCAT(YEAR(CURRENT_DATE()),",",MONTH(CURRENT_DATE()),",",10),'%Y,%m,%d') THEN  sec_ordencommerce
END)
as Tasa_Facturacion_LY_ytd
from mae_ordenes
group by des_canal;


/*** CON TOTAL****/
select 
CASE
WHEN des_BuildingBlock ='APP COPPEL' THEN des_BuildingBlock
WHEN des_BuildingBlock ='COPPEL.COM EN TIENDA' THEN des_BuildingBlock
ELSE 'COPPEL.COM'
END as des_canal,

COUNT(distinct
CASE
WHEN LAST_DAY(DATE(fec_fechaorden)) =LAST_DAY(CURRENT_DATE()) AND DAY(DATE(fec_fechaorden)) <=10 AND fec_FechaFacturacion IS NOT NULL THEN  sec_ordencommerce
END)/ 
COUNT(distinct 
CASE
WHEN LAST_DAY(DATE(fec_fechaorden)) =LAST_DAY(CURRENT_DATE()) AND DAY(DATE(fec_fechaorden)) <=10 THEN  sec_ordencommerce
END)
as Tasa_Facturacion_mes,

COUNT(distinct 
CASE
WHEN LAST_DAY(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR)) =LAST_DAY(CURRENT_DATE()) AND DAY(DATE(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR))) <=10 AND fec_FechaFacturacion IS NOT NULL THEN  sec_ordencommerce
END)/ COUNT( distinct CASE
WHEN LAST_DAY(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR)) =LAST_DAY(CURRENT_DATE()) AND DAY(DATE(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR))) <=10 THEN  sec_ordencommerce
END)
as Tasa_Facturacion_LY_mes,

COUNT(distinct 
CASE
WHEN YEAR(fec_fechaorden) =YEAR(CURRENT_DATE()) AND DATE(fec_fechaorden)<= str_to_date(CONCAT(YEAR(CURRENT_DATE()),",",MONTH(CURRENT_DATE()),",",10),'%Y,%m,%d') AND fec_FechaFacturacion IS NOT NULL  THEN  sec_ordencommerce
END)/ COUNT(distinct 
CASE
WHEN YEAR(fec_fechaorden) =YEAR(CURRENT_DATE()) AND DATE(fec_fechaorden)<= str_to_date(CONCAT(YEAR(CURRENT_DATE()),",",MONTH(CURRENT_DATE()),",",10),'%Y,%m,%d') THEN  sec_ordencommerce
END)
as Tasa_Facturacion_ytd,

COUNT( distinct
CASE
WHEN YEAR(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR)) =YEAR(CURRENT_DATE()) AND DATE(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR))<= str_to_date(CONCAT(YEAR(CURRENT_DATE()),",",MONTH(CURRENT_DATE()),",",10),'%Y,%m,%d')  AND fec_FechaFacturacion IS NOT NULL THEN  sec_ordencommerce
END)/ COUNT( distinct CASE
WHEN YEAR(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR)) =YEAR(CURRENT_DATE()) AND DATE(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR))<= str_to_date(CONCAT(YEAR(CURRENT_DATE()),",",MONTH(CURRENT_DATE()),",",10),'%Y,%m,%d') THEN  sec_ordencommerce
END)
as Tasa_Facturacion_LY_ytd
from mae_ordenes
group by des_canal

UNION ALL 
SELECT 'TOTAL',
COUNT(distinct
CASE
WHEN LAST_DAY(DATE(fec_fechaorden)) =LAST_DAY(CURRENT_DATE()) AND DAY(DATE(fec_fechaorden)) <=10 AND fec_FechaFacturacion IS NOT NULL THEN  sec_ordencommerce
END)/ 
COUNT(distinct 
CASE
WHEN LAST_DAY(DATE(fec_fechaorden)) =LAST_DAY(CURRENT_DATE()) AND DAY(DATE(fec_fechaorden)) <=10 THEN  sec_ordencommerce
END), COUNT(distinct 
CASE
WHEN LAST_DAY(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR)) =LAST_DAY(CURRENT_DATE()) AND DAY(DATE(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR))) <=10 AND fec_FechaFacturacion IS NOT NULL THEN  sec_ordencommerce
END)/ COUNT( distinct CASE
WHEN LAST_DAY(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR)) =LAST_DAY(CURRENT_DATE()) AND DAY(DATE(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR))) <=10 THEN  sec_ordencommerce
END), 
COUNT(distinct 
CASE
WHEN LAST_DAY(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR)) =LAST_DAY(CURRENT_DATE()) AND DAY(DATE(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR))) <=10 AND fec_FechaFacturacion IS NOT NULL THEN  sec_ordencommerce
END)/ COUNT( distinct CASE
WHEN LAST_DAY(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR)) =LAST_DAY(CURRENT_DATE()) AND DAY(DATE(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR))) <=10 THEN  sec_ordencommerce
END),
COUNT(distinct 
CASE
WHEN YEAR(fec_fechaorden) =YEAR(CURRENT_DATE()) AND DATE(fec_fechaorden)<= str_to_date(CONCAT(YEAR(CURRENT_DATE()),",",MONTH(CURRENT_DATE()),",",10),'%Y,%m,%d') AND fec_FechaFacturacion IS NOT NULL  THEN  sec_ordencommerce
END)/ COUNT(distinct 
CASE
WHEN YEAR(fec_fechaorden) =YEAR(CURRENT_DATE()) AND DATE(fec_fechaorden)<= str_to_date(CONCAT(YEAR(CURRENT_DATE()),",",MONTH(CURRENT_DATE()),",",10),'%Y,%m,%d') THEN  sec_ordencommerce
END) from mae_ordenes;




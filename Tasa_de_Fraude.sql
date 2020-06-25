select 
CASE
WHEN des_BuildingBlock ='APP COPPEL' THEN des_BuildingBlock
WHEN des_BuildingBlock ='COPPEL.COM EN TIENDA' THEN des_BuildingBlock
ELSE 'COPPEL.COM'
END as des_canal,

SUM(CASE
WHEN LAST_DAY(DATE(fec_fechaorden)) =LAST_DAY(CURRENT_DATE()) AND DAY(DATE(fec_fechaorden)) <=10 AND des_estatusorden='Contracargo' THEN  imp_preciounitario*num_cantidad
ELSE 0
END)/ SUM(CASE
WHEN LAST_DAY(DATE(fec_fechaorden)) =LAST_DAY(CURRENT_DATE()) AND DAY(DATE(fec_fechaorden)) <=10 AND des_estatusorden='Facturada' THEN  imp_preciounitario*num_cantidad
ELSE 0
END)
as Tasa_Fraude_mes,

SUM(CASE
WHEN LAST_DAY(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR)) =LAST_DAY(CURRENT_DATE()) AND DAY(DATE(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR))) <=10 AND des_estatusorden='Contracargo' THEN  imp_preciounitario*num_cantidad
ELSE 0
END)/ SUM(CASE
WHEN LAST_DAY(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR)) =LAST_DAY(CURRENT_DATE()) AND DAY(DATE(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR))) <=10 AND des_estatusorden='Facturada' THEN  imp_preciounitario*num_cantidad
ELSE 0
END)
as Tasa_Fraude_LY_mes,

SUM(CASE
WHEN YEAR(fec_fechaorden) =YEAR(CURRENT_DATE()) AND DATE(fec_fechaorden)<= str_to_date(CONCAT(YEAR(CURRENT_DATE()),",",MONTH(CURRENT_DATE()),",",10),'%Y,%m,%d') AND des_estatusorden='Contracargo'  THEN  imp_preciounitario*num_cantidad
ELSE 0
END)/ SUM(CASE
WHEN YEAR(fec_fechaorden) =YEAR(CURRENT_DATE()) AND DATE(fec_fechaorden)<= str_to_date(CONCAT(YEAR(CURRENT_DATE()),",",MONTH(CURRENT_DATE()),",",10),'%Y,%m,%d') AND des_estatusorden='Facturada' THEN  imp_preciounitario*num_cantidad
ELSE 0
END)
as Tasa_Fraude_ytd,

SUM(CASE
WHEN YEAR(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR)) =YEAR(CURRENT_DATE()) AND DATE(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR))<= str_to_date(CONCAT(YEAR(CURRENT_DATE()),",",MONTH(CURRENT_DATE()),",",10),'%Y,%m,%d')  AND des_estatusorden='Contracargo' THEN  imp_preciounitario*num_cantidad
ELSE 0
END)/ SUM(CASE
WHEN YEAR(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR)) =YEAR(CURRENT_DATE()) AND DATE(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR))<= str_to_date(CONCAT(YEAR(CURRENT_DATE()),",",MONTH(CURRENT_DATE()),",",10),'%Y,%m,%d') AND des_estatusorden='Facturada' THEN  imp_preciounitario*num_cantidad
ELSE 0
END)
as Tasa_Fraude_LY_ytd

from mae_ordenes
group by des_canal

UNION ALL 
SELECT 'TOTAL',
SUM(CASE
WHEN LAST_DAY(DATE(fec_fechaorden)) =LAST_DAY(CURRENT_DATE()) AND DAY(DATE(fec_fechaorden)) <=10 AND des_estatusorden='Contracargo' THEN  imp_preciounitario*num_cantidad
ELSE 0
END)/ SUM(CASE
WHEN LAST_DAY(DATE(fec_fechaorden)) =LAST_DAY(CURRENT_DATE()) AND DAY(DATE(fec_fechaorden)) <=10 AND des_estatusorden='Facturada' THEN  imp_preciounitario*num_cantidad
ELSE 0
END), SUM(CASE
WHEN LAST_DAY(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR)) =LAST_DAY(CURRENT_DATE()) AND DAY(DATE(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR))) <=10 AND des_estatusorden='Contracargo' THEN  imp_preciounitario*num_cantidad
ELSE 0
END)/ SUM(CASE
WHEN LAST_DAY(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR)) =LAST_DAY(CURRENT_DATE()) AND DAY(DATE(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR))) <=10 AND des_estatusorden='Facturada' THEN  imp_preciounitario*num_cantidad
ELSE 0
END),
SUM(CASE
WHEN YEAR(fec_fechaorden) =YEAR(CURRENT_DATE()) AND DATE(fec_fechaorden)<= str_to_date(CONCAT(YEAR(CURRENT_DATE()),",",MONTH(CURRENT_DATE()),",",10),'%Y,%m,%d') AND des_estatusorden='Contracargo'  THEN  imp_preciounitario*num_cantidad
ELSE 0
END)/ SUM(CASE
WHEN YEAR(fec_fechaorden) =YEAR(CURRENT_DATE()) AND DATE(fec_fechaorden)<= str_to_date(CONCAT(YEAR(CURRENT_DATE()),",",MONTH(CURRENT_DATE()),",",10),'%Y,%m,%d') AND des_estatusorden='Facturada' THEN  imp_preciounitario*num_cantidad
ELSE 0
END),
SUM(CASE
WHEN YEAR(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR)) =YEAR(CURRENT_DATE()) AND DATE(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR))<= str_to_date(CONCAT(YEAR(CURRENT_DATE()),",",MONTH(CURRENT_DATE()),",",10),'%Y,%m,%d')  AND des_estatusorden='Contracargo' THEN  imp_preciounitario*num_cantidad
ELSE 0
END)/ SUM(CASE
WHEN YEAR(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR)) =YEAR(CURRENT_DATE()) AND DATE(ADDDATE(fec_fechaorden,INTERVAL 1 YEAR))<= str_to_date(CONCAT(YEAR(CURRENT_DATE()),",",MONTH(CURRENT_DATE()),",",10),'%Y,%m,%d') AND des_estatusorden='Facturada' THEN  imp_preciounitario*num_cantidad
ELSE 0 
END)
from mae_ordenes;
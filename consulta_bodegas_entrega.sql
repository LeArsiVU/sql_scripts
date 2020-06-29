use eCommerceMX

-- En esta primera tabla temporal guardo los campoa que necesito
-- y filtro para que sean solo muebles y la fecha de facturación entre 01-Enero-2018 al 31-Mayo-2020

select t1.fec_fechafacturacion, 
t1.sec_notafactura,
t1.sec_ordencommerce,
t1.idu_areacodigo, 
t1.idu_articulocodigo, 
t1.num_cantidad, 
t1.imp_PrecioContadoUnitario,
t1.idu_bodegacodigo,
t1.nom_bodegaentrega 
into  #tabla_1 
from domo.mae_ventas t1
where t1.idu_areacodigo=3 and t1.fec_fechafacturacion BETWEEN '2018-01-01' AND '2020-05-31'


-- Actualiza los sec_ordencommerce = 0
-- actualiza  los codigos de bodega
update #tabla_1
set #tabla_1.idu_bodegacodigo = t2.bodega
from tienda0800.mufacturadetallehistorial t2 
where #tabla_1.sec_notafactura = t2.factura and 
 #tabla_1.fec_fechafacturacion = t2.fecha and 
 #tabla_1.idu_articulocodigo =  t2.codigo  and
 #tabla_1.sec_ordencommerce = 0 and
 #tabla_1.idu_bodegacodigo is NULL

 -- actualiza los nombres de las bodegas 
update #tabla_1
set #tabla_1.nom_bodegaentrega = t2.nom_bodega
from muebles.cat_bodegas t2 
where #tabla_1.idu_bodegacodigo = t2.idu_bodegacodigo  and #tabla_1.sec_ordencommerce = 0

select top 10 * from  #tabla_1 where sec_ordencommerce = 0

-- Actualiza los sec_ordencommerce <> 0
update #tabla_1
set #tabla_1.idu_bodegacodigo = t2.idu_BodegaEntregaCodigo,  #tabla_1.nom_bodegaentrega = t2.nom_BodegaEntrega
from domo.mae_entregas t2 
where
 #tabla_1.sec_ordencommerce = t2.sec_OrdenCommerce and
 #tabla_1.idu_areacodigo = t2.idu_AreaCodigo and
 #tabla_1.idu_articulocodigo = t2.idu_ArticuloCodigo and 
 #tabla_1.sec_ordencommerce <> 0

 select top 10 * from  #tabla_1 where sec_ordencommerce <> 0

 
 -- En esta tabla ya se hacen las agrupaciones
 select
 YEAR(t1.fec_fechafacturacion) Año,
 Month(t1.fec_fechafacturacion) NumMes,
 t1.nom_bodegaentrega BodegaDeEntrega,
 SUM(t1.num_cantidad) CantidadMueblesVendidos,
 SUM(t1.num_cantidad*t1.imp_PrecioContadoUnitario) ImporteTotal
 into #tabla_final
 from #tabla_1 t1
 group by  YEAR(t1.fec_fechafacturacion),Month(t1.fec_fechafacturacion),t1.nom_bodegaentrega


 -- Con la siguiente consulta pasé los meses de número a nombre
 -- Y guardé los resultados con Save Result As... de la pestaña de Results
 -- Son 646 registros
 select Año,
 CASE
  WHEN NumMes = 1 THEN 'Enero'
  WHEN NumMes = 2 THEN 'Febrero'
  WHEN NumMes = 3 THEN 'Marzo'
  WHEN NumMes = 4 THEN 'Abril'
  WHEN NumMes = 5 THEN 'Mayo'
  WHEN NumMes = 6 THEN 'Junio'
  WHEN NumMes = 7 THEN 'Julio'
  WHEN NumMes = 8 THEN 'Agosto'
  WHEN NumMes = 9 THEN 'Septiembre'
  WHEN NumMes = 10 THEN 'Octubre'
  WHEN NumMes = 11 THEN 'Noviembre'
  WHEN NumMes = 12 THEN 'Diciembre'
 END Mes,BodegaDeEntrega, CantidadMueblesVendidos, ImporteTotal
 from #tabla_final
 order by Año asc, NumMes asc, ImporteTotal desc


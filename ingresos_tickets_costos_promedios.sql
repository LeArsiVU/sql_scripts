use eCommerceMX

-- En esta tabla se obtiene el total comprado por cada ticket de la mae_ventas
SELECT
fec_fechafacturacion,
sec_notafactura, 
idu_clientecodigo,
COUNT(sec_notafactura) num_ArticulosDiferentesComprados,
SUM(num_cantidad*imp_PrecioContadoUnitario) imp_TotalCompradoPorTicket
INTO tempdb..#tabla1_maeventas
FROM domo.mae_ventas
WHERE idu_areacodigo = 2 AND 
fec_fechafacturacion BETWEEN '2019-01-01' AND '2020-05-31'
GROUP BY fec_fechafacturacion,sec_notafactura,idu_clientecodigo
ORDER BY fec_fechafacturacion

-- Aqui ya se obtienen los promedios por ticket
SELECT
EOMONTH(fec_fechafacturacion) Fecha,
COUNT(sec_notafactura) num_tickets,
SUM(imp_TotalCompradoPorTicket) imp_IngresoTotal_Mesual,
SUM(imp_TotalCompradoPorTicket)/COUNT(sec_notafactura) imp_TicketPromedio
INTO  tempdb..#ticketPromedio_maeventas
FROM  tempdb..#tabla1_maeventas
GROUP BY EOMONTH(fec_fechafacturacion)


-- mae_venasgrupcoppel
-- En esta tabla se obtiene el total comprado por cada ticket de la mae_venasgrupcoppel
SELECT
fec_FechaCorte,
sec_NotaFactura,
idu_ClienteCodigoSinDigito,
COUNT(sec_NotaFactura) num_ArticulosDiferentesComprados,
SUM(num_Cantidad*imp_PrecioUnitario) imp_TotalCompradoPorTicket,
SUM(imp_Costo) imp_CostoTotalPorTicket
INTO tempdb..#tabla1_maeventas_grupocoppel
FROM domo.mae_ventasgrupocoppel
WHERE idu_AreaCodigo = 2 AND
flag_indicador = 'Ingreso' AND
idu_TiendaCodigo=800 AND
fec_FechaCorte BETWEEN '2019-01-01' AND '2020-05-31'
GROUP BY fec_FechaCorte,sec_NotaFactura,idu_ClienteCodigoSinDigito

-- Aqui ya se obtienen los promedios por ticket
SELECT
EOMONTH(fec_FechaCorte) Fecha,
COUNT(sec_NotaFactura) num_tickets,
SUM(imp_TotalCompradoPorTicket) imp_IngresoTotal_Mesual,
SUM(imp_TotalCompradoPorTicket)/COUNT(sec_NotaFactura) imp_TicketPromedio,
SUM(imp_CostoTotalPorTicket)/COUNT(sec_NotaFactura) imp_CostoPromedio
INTO tempdb..#ticketcostopromedio_maeventas_grupocoppel
FROM tempdb..#tabla1_maeventas_grupocoppel
GROUP BY EOMONTH(fec_FechaCorte)

-- El CSV de Salida
SELECT
YEAR(t1.Fecha) Año,
CASE
  WHEN MONTH(t1.Fecha) = 1 THEN 'Enero'
  WHEN MONTH(t1.Fecha) = 2 THEN 'Febrero'
  WHEN MONTH(t1.Fecha) = 3 THEN 'Marzo'
  WHEN MONTH(t1.Fecha) = 4 THEN 'Abril'
  WHEN MONTH(t1.Fecha) = 5 THEN 'Mayo'
  WHEN MONTH(t1.Fecha) = 6 THEN 'Junio'
  WHEN MONTH(t1.Fecha) = 7 THEN 'Julio'
  WHEN MONTH(t1.Fecha) = 8 THEN 'Agosto'
  WHEN MONTH(t1.Fecha) = 9 THEN 'Septiembre'
  WHEN MONTH(t1.Fecha) = 10 THEN 'Octubre'
  WHEN MONTH(t1.Fecha) = 11 THEN 'Noviembre'
  WHEN MONTH(t1.Fecha) = 12 THEN 'Diciembre'
 END Mes,
t1.imp_IngresoTotal_Mesual imp_IngresoTotal,
ROUND(t1.imp_TicketPromedio,2) imp_TicketPromedio,
ROUND(t2.imp_CostoPromedio,2) imp_CostoPromedio
FROM tempdb..#ticketPromedio_maeventas t1 JOIN
tempdb..#ticketcostopromedio_maeventas_grupocoppel t2 ON
t1.Fecha = t2.Fecha
ORDER BY t1.Fecha




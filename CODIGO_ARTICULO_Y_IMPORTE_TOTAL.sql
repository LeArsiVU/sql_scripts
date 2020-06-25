USE COPPEL;
-- CARGO TODAS LOS REGISTROS CORRESPONDIENTES A ZAPATOS Y LOS AGRUPO EN NUM_TALLA, SUMANDO LAS UNIDADES QUE TIENE CADA TALLA
CREATE TABLE CODIGOARTICULO_TALLAS AS
SELECT idu_ArticuloCodigo AS CODIGO_ARTICULO ,num_Talla AS TALLA, PRECIO(MAX(imp_PrecioVenta),MAX(imp_PrecioPromocion))AS IMPORTE_POR_UNIDAD,SUM(num_existencia) AS UNIDADES
FROM MOV_EXISTENCIAS_20200428
WHERE des_Area="Zapatos"
GROUP BY num_Talla,idu_ArticuloCodigo
ORDER BY idu_ArticuloCodigo desc, num_Talla desc;

select  * from CODIGOARTICULO_TALLAS
where IMPORTE_POR_UNIDAD =0;
 
drop table CODIGOARTICULO_TALLAS;

-- SE TOMAN TODOS LOS  CODIGOS DE LOS EN DONDE LAS TALLAS TENGAN MENOS DE 3 UNIDADES
-- y SE SUMA RESPECTO AL NUMERO DE UNIDADES QUE HA
CREATE TABLE CODIGO_ARTICULO_E_IMPORTE_TOTAL AS
SELECT CODIGO_ARTICULO, SUM(IMPORTE_POR_UNIDAD*UNIDADES) AS IMPORTE_TOTAL
FROM CODIGOARTICULO_TALLAS
GROUP BY CODIGO_ARTICULO
HAVING MAX(UNIDADES)<3
ORDER BY CODIGO_ARTICULO DESC;

drop table CODIGO_ARTICULO_E_IMPORTE_TOTAL;
select  * from CODIGO_ARTICULO_E_IMPORTE_TOTAL;


-- FUNCIO PARA ESCOGER ENTRE EL PRECIO VENTA O EL DE PROMOCION
DELIMITER //

CREATE FUNCTION PRECIO ( PRECIO_REAL INT, PRECIO_PROMO INT )
RETURNS INT
READS SQL DATA
DETERMINISTIC
BEGIN
   DECLARE PRECIO int;
   
   IF PRECIO_REAL !=0 THEN
      SET PRECIO = PRECIO_REAL;
   ELSE
      SET PRECIO = PRECIO_PROMO;
   END IF;

   RETURN PRECIO;
END; // 
DELIMITER ;
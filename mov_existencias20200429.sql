CREATE DATABASE COPPEL;

USE COPPEL;

CREATE TABLE MOV_EXISTENCIAS_20200429(
des_Area VARCHAR(30),
des_Categoria VARCHAR(30),
idu_DepartamentoCodigo INTEGER,
des_Departamento VARCHAR(30),
idu_ClaseCodigo INTEGER,
des_Clase VARCHAR(30),
idu_FamiliaCodigo INTEGER,
des_Familia VARCHAR(30),
idu_ArticuloCodigo INTEGER,
num_Talla INTEGER,
imp_PrecioVenta INTEGER,
imp_PrecioPromocion INTEGER,
num_existencia INTEGER
);

-- SE CARGÓ EL ARCHIVO mov_existencias20200429.csv

-- 4) cargar los datos
LOAD DATA INFILE 'mov_existencias20200429.csv'
into table MOV_EXISTENCIAS_20200429
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES terminated by '\n'
IGNORE 1 ROWS;

select * from MOV_EXISTENCIAS_20200429;

-- CARGO TODAS LOS REGISTROS CORRESPONDIENTES A ZAPATOS Y LOS AGRUPO EN NUM_TALLA, SUMANDO LAS UNIDADES QUE TIENE CADA TALLA
CREATE TABLE CODIGOARTICULO_TALLAS_20200429 AS
SELECT
des_Area,
idu_DepartamentoCodigo,
des_Departamento,
idu_ClaseCodigo,
des_Clase,
idu_FamiliaCodigo,
des_Familia,
idu_ArticuloCodigo,
num_Talla, 
PRECIO(MAX(imp_PrecioVenta),
MAX(imp_PrecioPromocion)) AS IMPORTE_POR_UNIDAD,
SUM(num_existencia) AS UNIDADES
FROM MOV_EXISTENCIAS_20200429
WHERE des_Area="Zapatos"
GROUP BY des_Area, idu_DepartamentoCodigo,des_Departamento,idu_ClaseCodigo,des_Clase,idu_FamiliaCodigo,des_Familia,idu_ArticuloCodigo,num_Talla
ORDER BY idu_ArticuloCodigo desc, num_Talla desc;

select  * from CODIGOARTICULO_TALLAS_20200429;
 drop table CODIGOARTICULO_TALLAS_20200429;
 
 -- SE TOMAN TODOS LOS  CODIGOS DE LOS EN DONDE LAS TALLAS TENGAN MENOS DE 3 UNIDADES
-- y SE SUMA RESPECTO AL NUMERO DE UNIDADES QUE HA
CREATE TABLE CODIGO_ARTICULO_E_IMPORTE_TOTAL_20200429 AS
SELECT
des_Area,
idu_DepartamentoCodigo,
des_Departamento,
idu_ClaseCodigo,
des_Clase,
idu_FamiliaCodigo,
des_Familia,
idu_ArticuloCodigo,
SUM(UNIDADES) AS UNIDADES_TOTALES,
SUM(IMPORTE_POR_UNIDAD*UNIDADES) AS IMPORTE_TOTAL
FROM CODIGOARTICULO_TALLAS_20200429
GROUP BY des_Area, idu_DepartamentoCodigo,des_Departamento,idu_ClaseCodigo,des_Clase,idu_FamiliaCodigo,des_Familia,idu_ArticuloCodigo
HAVING MAX(UNIDADES)<3
ORDER BY idu_ArticuloCodigo DESC;

drop table CODIGO_ARTICULO_E_IMPORTE_TOTAL_20200429;
select  * from CODIGO_ARTICULO_E_IMPORTE_TOTAL_20200429;

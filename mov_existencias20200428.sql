CREATE DATABASE COPPEL;

USE COPPEL;

CREATE TABLE MOV_EXISTENCIAS20200428(
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

-- SE CARGÓ EL ARCHIVO mov_existencias20200428.csv
select * from MOV_EXISTENCIAS20200428;

SELECT imp_PrecioVenta AS IMPORTE, num_existencia AS UNIDADES_TOTALES 
FROM MOV_EXISTENCIAS20200428
WHERE num_existencia>=3 AND des_Area="Zapatos"
GROUP BY num_Talla;
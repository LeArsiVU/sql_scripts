
-- 1) Los datos del archivo txt van a estar determinados de pendiendo del símbolo en FIELDS TERMINATED BY 

-- 2) Mover el archivo a la carpeta /var/lib/mysql/NOMBRE_DE_LA_BASE_DE_DATOS_QUE_SE_USA (en este caso clubibarra)

-- 3) crear la tabla con los campos que correspondan al archivo
USE COPPEL;

CREATE TABLE MOV_EXISTENCIAS_20200428(
des_Area VARCHAR(60),
des_Categoria VARCHAR(60),
idu_DepartamentoCodigo INTEGER,
des_Departamento VARCHAR(60),
idu_ClaseCodigo INTEGER,
des_Clase VARCHAR(60),
idu_FamiliaCodigo INTEGER,
des_Familia VARCHAR(60),
idu_ArticuloCodigo INTEGER,
num_Talla INTEGER,
imp_PrecioVenta INTEGER,
imp_PrecioPromocion INTEGER,
num_existencia INTEGER
);
drop table MOV_EXISTENCIAS_20200428;

-- 4) cargar los datos
LOAD DATA INFILE 'mov_existencias_20200428.csv'
into table MOV_EXISTENCIAS_20200428
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES terminated by '\n'
IGNORE 1 ROWS;

select * from MOV_EXISTENCIAS_20200428
WHERE idu_ArticuloCodigo=339867;

select num_Talla, SUM(num_existencia) AS TOTAL_DE_UNIDADES
from MOV_EXISTENCIAS_20200428
WHERE des_Area="Zapatos"
GROUP BY num_Talla
ORDER BY num_Talla DESC;

SELECT * FROM MOV_EXISTENCIAS_20200428
where idu_ArticuloCodigo=899616 and des_Area="Zapatos";

CREATE VIEW Unidades_E_Importe(
CODIGO_DE_ARTICULO,TALLA,IMPORTE_TOTAL,TOTAL_DE_UNIDADES) AS
SELECT idu_ArticuloCodigo,num_Talla,SUM(imp_PrecioVenta), SUM(num_existencia) from MOV_EXISTENCIAS_20200428
WHERE des_Area="Zapatos"
GROUP BY num_Talla,idu_ArticuloCodigo
ORDER BY idu_ArticuloCodigo desc, num_Talla desc;

drop view Unidades_E_Importe;
select * from Unidades_E_Importe;

CREATE VIEW Unidades_E_Importe_2
(CODIGO_DE_ARTICULO, MAX_DE_UNIDADES_POR_TALLA) AS
SELECT CODIGO_DE_ARTICULO, MAX(TOTAL_DE_UNIDADES)
FROM Unidades_E_Importe
GROUP BY CODIGO_DE_ARTICULO
HAVING MAX(TOTAL_DE_UNIDADES)<3;

select * from Unidades_E_Importe_2;
-- drop view Unidades_E_Importe_2;


select * FROM Unidades_E_Importe_2 where CODIGO_DE_ARTICULO= '894127';


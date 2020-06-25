USE DASHBOARD;
CREATE TABLE DATOS(
id_compra INT,
fecha_compra date,
id_estado int,
id_medio int,
num_compra int,
importe_compra numeric(10,2)
);
drop table DATOS;
-- 4) cargar los datos
LOAD DATA INFILE 'datos_aleatorios_MP.csv'
into table DATOS
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES terminated by '\n'
IGNORE 1 ROWS;

SELECT * FROM DATOS;

SELECT 
	CASE
		WHEN id_medio = 1 THEN 'WEB'
		ELSE 'APP'
	END AS MEDIO,
	/*SUM(CASE
		WHEN YEAR(fecha_compra) = YEAR (current_date()) THEN 1
        ELSE 0
		END) AS COMPRAS,*/
	SUM(CASE
		WHEN YEAR(fecha_compra) = YEAR (current_date()) THEN importe_compra
		ELSE 0
		END) AS VENTA,
	/*SUM(CASE
		WHEN YEAR(fecha_compra) = YEAR (current_date()) THEN importe_compra
		ELSE 0
		END)/ SUM(CASE
				  WHEN YEAR(fecha_compra) = YEAR (current_date()) THEN 1
				  ELSE 0
				  END) AS VENTA_PROMEDIO,*/
	/*SUM(CASE
		WHEN id_medio = 1 AND YEAR(fecha_compra) = YEAR (current_date()) THEN 2518
		WHEN id_medio = 2 AND YEAR(fecha_compra) = YEAR (current_date()) THEN 6548
	END) AS META,*/
     CONCAT(CAST( Cast( (SUM(CASE
		WHEN YEAR(fecha_compra) = YEAR (current_date()) THEN importe_compra
		ELSE 0
		END)/ SUM(CASE
		WHEN id_medio = 1 AND YEAR(fecha_compra) = YEAR (current_date()) THEN 2518
		WHEN id_medio = 2 AND YEAR(fecha_compra) = YEAR (current_date()) THEN 6548
	END))*100 as decimal(5,2)) as char(5)),' %') AS ALCANCE,
    CONCAT(CAST( Cast( (SUM(CASE
		WHEN YEAR(fecha_compra) = YEAR (current_date()) THEN importe_compra
		ELSE 0
		END)- SUM(CASE
		WHEN (YEAR(fecha_compra) +1) = YEAR (current_date()) THEN importe_compra
		ELSE 0
		END)
	)/ SUM(CASE
		WHEN (YEAR(fecha_compra) +1) = YEAR (current_date()) THEN importe_compra
		ELSE 0
		END) *100 as decimal(5,2)) as char(7)),' %') AS DvsAA
FROM DATOS
GROUP BY id_medio;

CREATE TABLE DASHBOARD_A AS SELECT 
	CASE
		WHEN id_medio = 1 THEN 'WEB'
		ELSE 'APP'
	END AS MEDIO,
	CONCAT('$',CAST(SUM(CASE
		WHEN YEAR(fecha_compra) = YEAR (current_date()) AND WEEK(fecha_compra) = WEEK (current_date()) THEN importe_compra
		ELSE 0
		END) as char(20))) AS VENTA_S,
     CONCAT(CAST( Cast( (SUM(CASE
		WHEN YEAR(fecha_compra) = YEAR (current_date()) AND WEEK(fecha_compra) = WEEK (current_date())  THEN importe_compra
		ELSE 0
		END)/ SUM(CASE
		WHEN id_medio = 1 AND YEAR(fecha_compra) = YEAR (current_date()) AND WEEK(fecha_compra) = WEEK (current_date())  THEN 2518
		WHEN id_medio = 2 AND YEAR(fecha_compra) = YEAR (current_date()) AND WEEK(fecha_compra) = WEEK (current_date())  THEN 6548
	END))*100 as decimal(5,2)) as char(7)),' %') AS ALCANCE_S,
    CONCAT(CAST( Cast( (SUM(CASE
		WHEN YEAR(fecha_compra) = YEAR (current_date()) AND WEEK(fecha_compra) = WEEK (current_date())  THEN importe_compra
		ELSE 0
		END)- SUM(CASE
		WHEN (YEAR(fecha_compra) +1) = YEAR (current_date()) AND WEEK(fecha_compra) = WEEK (current_date()) THEN importe_compra
		ELSE 0
		END)
	)/ SUM(CASE
		WHEN (YEAR(fecha_compra) +1) = YEAR (current_date()) AND WEEK(fecha_compra) = WEEK (current_date())  THEN importe_compra
		ELSE 0
		END) *100 as decimal(5,2)) as char(7)),' %') AS DvsSA ,
	CONCAT('$',CAST(SUM(CASE
		WHEN YEAR(fecha_compra) = YEAR (current_date()) AND MONTH(fecha_compra) = MONTH (current_date()) THEN importe_compra
		ELSE 0
		END) as char (20))) AS VENTA_M,
     CONCAT(CAST( Cast( (SUM(CASE
		WHEN YEAR(fecha_compra) = YEAR (current_date()) AND MONTH(fecha_compra) = MONTH (current_date())  THEN importe_compra
		ELSE 0
		END)/ SUM(CASE
		WHEN id_medio = 1 AND YEAR(fecha_compra) = YEAR (current_date()) AND MONTH(fecha_compra) = MONTH (current_date())  THEN 2518
		WHEN id_medio = 2 AND YEAR(fecha_compra) = YEAR (current_date()) AND MONTH(fecha_compra) = MONTH (current_date())  THEN 6548
	END))*100 as decimal(5,2)) as char(7)),' %') AS ALCANCE_M,
    CONCAT(CAST( Cast( (SUM(CASE
		WHEN YEAR(fecha_compra) = YEAR (current_date()) AND MONTH(fecha_compra) = MONTH (current_date())  THEN importe_compra
		ELSE 0
		END)- SUM(CASE
		WHEN (YEAR(fecha_compra) +1) = YEAR (current_date()) AND MONTH(fecha_compra) = MONTH (current_date()) THEN importe_compra
		ELSE 0
		END)
	)/ SUM(CASE
		WHEN (YEAR(fecha_compra) +1) = YEAR (current_date()) AND MONTH(fecha_compra) = MONTH (current_date())  THEN importe_compra
		ELSE 0
		END) *100 as decimal(5,2)) as char(7)),' %') AS DvsMA,
	CONCAT('$',CAST(SUM(CASE
		WHEN YEAR(fecha_compra) = YEAR (current_date()) THEN importe_compra
		ELSE 0
		END) as char(20)))AS VENTA,
     CONCAT(CAST( Cast( (SUM(CASE
		WHEN YEAR(fecha_compra) = YEAR (current_date()) THEN importe_compra
		ELSE 0
		END)/ SUM(CASE
		WHEN id_medio = 1 AND YEAR(fecha_compra) = YEAR (current_date()) THEN 2518
		WHEN id_medio = 2 AND YEAR(fecha_compra) = YEAR (current_date()) THEN 6548
	END))*100 as decimal(5,2)) as char(7)),' %') AS ALCANCE,
    CONCAT(CAST( Cast( (SUM(CASE
		WHEN YEAR(fecha_compra) = YEAR (current_date()) THEN importe_compra
		ELSE 0
		END)- SUM(CASE
		WHEN (YEAR(fecha_compra) +1) = YEAR (current_date()) THEN importe_compra
		ELSE 0
		END)
	)/ SUM(CASE
		WHEN (YEAR(fecha_compra) +1) = YEAR (current_date()) THEN importe_compra
		ELSE 0
		END) *100 as decimal(5,2)) as char(7)),' %') AS DvsAA
FROM DATOS
GROUP BY id_medio;

SELECT * FROM  DASHBOARD_A;
DROP TABLE DASHBOARD_A;

-- Sin los simbolos
CREATE TABLE DASHBOARD_A AS SELECT 
	CASE
		WHEN id_medio = 1 THEN 'WEB'
		ELSE 'APP'
	END AS MEDIO,
	SUM(CASE
		WHEN YEAR(fecha_compra) = YEAR (current_date()) AND WEEK(fecha_compra) = WEEK (current_date()) THEN importe_compra
		ELSE 0
		END) AS VENTA_S,
     Cast( (SUM(CASE
		WHEN YEAR(fecha_compra) = YEAR (current_date()) AND WEEK(fecha_compra) = WEEK (current_date())  THEN importe_compra
		ELSE 0
		END)/ SUM(CASE
		WHEN id_medio = 1 AND YEAR(fecha_compra) = YEAR (current_date()) AND WEEK(fecha_compra) = WEEK (current_date())  THEN 2518
		WHEN id_medio = 2 AND YEAR(fecha_compra) = YEAR (current_date()) AND WEEK(fecha_compra) = WEEK (current_date())  THEN 6548
	END))*100 as decimal(5,2)) AS ALCANCE_S,
    CAST((SUM(CASE
		WHEN YEAR(fecha_compra) = YEAR (current_date()) AND WEEK(fecha_compra) = WEEK (current_date())  THEN importe_compra
		ELSE 0
		END)- SUM(CASE
		WHEN (YEAR(fecha_compra) +1) = YEAR (current_date()) AND WEEK(fecha_compra) = WEEK (current_date()) THEN importe_compra
		ELSE 0
		END)
	)/ SUM(CASE
		WHEN (YEAR(fecha_compra) +1) = YEAR (current_date()) AND WEEK(fecha_compra) = WEEK (current_date())  THEN importe_compra
		ELSE 0
		END) *100 as decimal(5,2)) AS DvsSA ,
	SUM(CASE
		WHEN YEAR(fecha_compra) = YEAR (current_date()) AND MONTH(fecha_compra) = MONTH (current_date()) THEN importe_compra
		ELSE 0
		END) AS VENTA_M,
     CAST(SUM(CASE
		WHEN YEAR(fecha_compra) = YEAR (current_date()) AND MONTH(fecha_compra) = MONTH (current_date())  THEN importe_compra
		ELSE 0
		END)/ SUM(CASE
		WHEN id_medio = 1 AND YEAR(fecha_compra) = YEAR (current_date()) AND MONTH(fecha_compra) = MONTH (current_date())  THEN 2518
		WHEN id_medio = 2 AND YEAR(fecha_compra) = YEAR (current_date()) AND MONTH(fecha_compra) = MONTH (current_date())  THEN 6548
	END)*100 as decimal(5,2)) AS ALCANCE_M,
    CAST((SUM(CASE
		WHEN YEAR(fecha_compra) = YEAR (current_date()) AND MONTH(fecha_compra) = MONTH (current_date())  THEN importe_compra
		ELSE 0
		END)- SUM(CASE
		WHEN (YEAR(fecha_compra) +1) = YEAR (current_date()) AND MONTH(fecha_compra) = MONTH (current_date()) THEN importe_compra
		ELSE 0
		END)
	)/ SUM(CASE
		WHEN (YEAR(fecha_compra) +1) = YEAR (current_date()) AND MONTH(fecha_compra) = MONTH (current_date())  THEN importe_compra
		ELSE 0
		END) *100 as decimal(5,2)) AS DvsMA,
	SUM(CASE
		WHEN YEAR(fecha_compra) = YEAR (current_date()) THEN importe_compra
		ELSE 0
		END) AS VENTA,
    CAST((SUM(CASE
		WHEN YEAR(fecha_compra) = YEAR (current_date()) THEN importe_compra
		ELSE 0
		END)/ SUM(CASE
		WHEN id_medio = 1 AND YEAR(fecha_compra) = YEAR (current_date()) THEN 2518
		WHEN id_medio = 2 AND YEAR(fecha_compra) = YEAR (current_date()) THEN 6548
	END))*100 as decimal(5,2)) AS ALCANCE,
    CAST((SUM(CASE
		WHEN YEAR(fecha_compra) = YEAR (current_date()) THEN importe_compra
		ELSE 0
		END)- SUM(CASE
		WHEN (YEAR(fecha_compra) +1) = YEAR (current_date()) THEN importe_compra
		ELSE 0
		END)
	)/ SUM(CASE
		WHEN (YEAR(fecha_compra) +1) = YEAR (current_date()) THEN importe_compra
		ELSE 0
		END) *100 as decimal(5,2))  AS DvsAA
FROM DATOS
GROUP BY id_medio;


-- Agro el renglón de TOTAL
CREATE TABLE DASHBOARD_TOTAL AS SELECT * FROM  DASHBOARD_A
UNION ALL
SELECT 'TOTAL' MEDIO,
 SUM(VENTA_S),
 CAST(SUM(VENTA_S)*100.0/SUM(VENTA_S/(ALCANCE_S/100.0)) as decimal(5,2)),
CAST(100.0*(SUM(VENTA_S)-SUM(VENTA_S/(1+DvsSA/100)))/SUM(VENTA_S/(1+DvsSA/100)) as decimal(5,2)), 
 SUM(VENTA_M),
 CAST(SUM(VENTA_M)*100.0/SUM(VENTA_M/(ALCANCE_M/100.0)) as decimal(5,2)),
CAST(100.0*(SUM(VENTA_M)-SUM(VENTA_M/(1+DvsMA/100)))/SUM(VENTA_M/(1+DvsMA/100)) as decimal(5,2)),
 SUM(VENTA),
 CAST(SUM(VENTA)*100.0/SUM(VENTA/(ALCANCE/100.0)) as decimal(5,2)),
 CAST(100.0*(SUM(VENTA)-SUM(VENTA/(1+DvsAA/100)))/SUM(VENTA/(1+DvsAA/100)) as decimal(5,2))
FROM DASHBOARD_A;

SELECT * FROM DASHBOARD_TOTAL;



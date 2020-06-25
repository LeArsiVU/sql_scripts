USE ISRA;
DROP TABLE prueba;

CREATE TABLE prueba(
JA VARCHAR(5),
JE int,
JI int,
JO int
);


-- 4) cargar los datos
LOAD DATA INFILE '/var/lib/mysql-files/prueba.csv'
into table prueba
FIELDS TERMINATED BY ','
ENCLOSED BY ''
LINES terminated by '\n'
IGNORE 1 ROWS

(@JA, @JE, @JI, @JO)
SET 
JA = NULLIF(@JA,' '),
JE = NULLIF(@JE,0), -- se pone 0 si es intero
JI = NULLIF(@JI,0),
JO = NULLIF(@JO,0)

;

SELECT * FROM prueba;
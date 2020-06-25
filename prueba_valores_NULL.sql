create database isra;

USE isra;

create  table if not exists prueba(
nombre VARCHAR(20),
edad int
);

TRuncate table prueba;
set autocommit = 0;
set unique_checks = 0;
set foreign_key_checks = 0;
set sql_log_bin=0;

LOAD DATA INFILE '/var/lib/mysql-files/prueba.csv'
into table prueba
FIELDS TERMINATED BY '|'
ENCLOSED BY '"' -- se pone la doble comilla para que al concatenar la cadena, este se some como null  si se pone '' no se toma como NULL sino como "NULL"
LINES terminated by '\n'

IGNORE 1 ROWS

(nombre,@edad)
-- no es necesario esto si se pone ENCLOSED BY '"' aunque en el archivo original no tengan comillas
SET
-- nombre=concat('"',@nombre,'"'),
nombre=NULLIF(TRIM(@nombre),NULL),-- para contar los cAMPOS VACIOS COMO NULLS
edad =NULLIF(@edad,NULL);

select * from prueba


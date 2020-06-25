use clubibarra;
-- 1) Se guarda el archivo de excell en formato csv (separado por comas)

-- 2) crear la tabla en donde se importaran los datos
create table morros(
Nombre varchar(30),
Apellido varchar(30)
);

-- 3) Clic derecho sobre la base de datos en donde está la tabal (en SCHEMAS)
-- 4) TABLE DATA IMPORT WIZARD
-- elegir el archivo CVS
-- se elige la tabla ya creada o se crea otra
-- next hasta finalizar

select * from morros;



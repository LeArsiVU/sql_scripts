use clubibarra;
select * from calificaciones;
insert into calificaciones values(6,'toke',7.5);
select * from calificaciones;
SET SQL_SAFE_UPDATES=0; -- 0 se pueden eliminar elementos, 1 no se pueden eliminar/actualizar elementos
update calificaciones set calificacion = 9 where nombre ='Pedro';
select * from calificaciones;
delete from calificaciones where idAlumno=4;
select * from calificaciones where calificacion <> 10;


select * from calificaciones where calificacion < 10;
select * from calificaciones where calificacion >= 8;

select * from calificaciones where nombre like 't%'; /*para buscar coincidencias en una cadena de carcteres
t% cadenas que inicin con t, %t cadenas de terminan con t, %t% cadenas que tengan una t dentro
*/

select * from calificaciones where calificacion like '8%'; -- pero se puede usar en campos que no son cracter.

insert into calificaciones values(9, null,9);

select * from calificaciones where nombre is null;
select * from calificaciones where nombre is not null;

insert into calificaciones values(11,'Juan',5.6);

select distinct nombre from calificaciones;-- con DISTINCT te muestra valores no repetidos
select distinct calificacion from calificaciones;

select * from calificaciones where idAlumno != 2 and  idAlumno != 5;
select * from calificaciones where idAlumno <> 6 or  idAlumno = 6;

select * from calificaciones where not calificacion = 9;-- muestra todas los resultados donde calficacion es distito de 9

select * from calificaciones where not (calificacion = 9 or calificacion =10 ); -- se puede poner entre parétesis

select * from calificaciones where calificacion between 7 and 9;

delete from calificaciones where nombre = null;

select * from calificaciones order by calificacion desc;
select * from calificaciones order by calificacion asc;
select * from calificaciones order by nombre desc;
select * from calificaciones order by nombre asc;

select idAlumno as id from calificaciones; -- el alias va despues de "as", al mostrar los datos muestra el alias como nombre de la columna
select nombre AS Nombre from calificaciones;

select * from calificaciones as CAL where calificacion > 6;
select * from calificaciones as CAL where CAL.calificacion >6; -- ESPECIFICACIÓN DE CAMPOS: esto del punto es útil cuando se tienen tablas unidas pero es necesario usar el alias.

select * from Lenguajes;
insert into Lenguajes values(4,'JAVA');
truncate table Lenguajes;-- elimina todas las entradas de la tabla, sin borrar la tabla.

create table jajaja(id int);
insert into jajaja values(1);
select * from jajaja;
drop table jajaja; -- elimina la tabla completamente, se cambia "table" pot "database" y se elimina la base de datos
drop table IF EXISTS jajaja; -- elimina la tabla si existe, en lugar de dar un error, muestra un  advertencia.

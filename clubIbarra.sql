drop table locos;
SET SQL_SAFE_UPDATES=0;/*0 se peuden eliminar elementos, 1 no se pueden eliminar elementos*/
create table locos(nombre varchar(20), edad int);/*Crea tabla con dos columnas*/
insert into locos(nombre,edad) values('Victor', 24);/*Agrega un elemento a la tabla*/
insert into locos(nombre,edad) values('Chema', 25);
insert into locos(nombre,edad) values('Isra',25);
insert into locos(nombre,edad) values('Mixel',26);
insert into locos(nombre,edad) values('Fausto',26);

Select * from locos;/*muestra los elementos de la tabla*/

select edad from locos order by edad; /*ordena y muestra los elementos por edad*/

select * from locos where   edad=25; /*Muestrstra todos los elementos donde edad = 25*/

select * from locos where not  edad=26; /*No Muestrstra los elementos donde edad = 26*/

delete from locos where edad=26;

select * from locos;
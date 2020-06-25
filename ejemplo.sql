create table calificaciones(idAlumno int primary key, nombre varchar(20), calificacion float);/*lo de primary key es para usar los identificadores ID que no se repitan*/
insert into calificaciones values(1,"Juan",10.0);
insert into calificaciones values(2,"Pedro",9.0);
insert into calificaciones values(3,"jaja",8.0);
select * from calificaciones where idAlumno=1;
select nombre from calificaciones where calificacion=9.0;/*Muestra los que  tengan una calf de 9.0*/
select nombre from calificaciones; /*muestra todos los nombres*/
update calificaciones set calificacion =7.0 where idAlumno =2;/*Actualiza los registros*/
select * from calificaciones; 
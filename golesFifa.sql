create database golesfifa;
use golesfifa;
create table Equipo (id_equipo int primary key, nombre_equipo char(30)); -- lo de primary key sirve para que el id no se repita
create table Jugador(id_jugador int  primary key, nombre_jugador char(50));
create table contrato(-- esta tabla relaciona las otras dos tablas
id_equipo int not null,
id_jugador int not null, 
cant_goles int, 
primary key (id_equipo,id_jugador),
foreign key (id_equipo) REFERENCES Equipo(id_equipo),
foreign key (id_jugador) references Jugador(id_jugador)
);

insert into Equipo values(1,"Real Madrid");
insert into Equipo values(2,"Barcelona");
insert into Equipo values(3,"Manchester United");
insert into Equipo values(4,"AC MILAN");
insert into Equipo values(5,"Juventus");

select * from Equipo;
insert into Jugador values(1,"Neymar");
insert into Jugador values(2,"Messi"); 
insert into Jugador values(3,"Cristiano"); 
insert into Jugador values(4,"Agüero"); 
insert into Jugador values(5,"Rolandinho");
select * from Jugador;

insert into contrato values(1,3,50);-- los valores de los id siempre deben de existir en sus las tablas referenciales
insert into contrato values(3,3,50);-- Y el conjunto de id's no se repite pues son primary keys
insert into contrato values(1,1,16);
insert into contrato values(1,2,6);
insert into contrato values(1,5,36);
insert into contrato values(2,2,36);

select id_jugador from Jugador where nombre_jugador ='Cristiano';
select cant_goles from contrato  where id_equipo=1 and id_jugador =1;

select id_equipo as equipo, nombre_equipo as name_quipo from Equipo where id_equipo=5;-- no se puede usar el alias en el where

select team.id_equipo, player.id_jugador from Equipo as team, Jugador as player;

select nombre_jugador,nombre_equipo, cant_goles
from Equipo as team, Jugador as player, contrato as contador 
where player.id_jugador = contador.id_jugador
and team.id_equipo=contador.id_equipo; -- da toda la tabla :o, en lugar de los id los pone organizada


select nombre_jugador,nombre_equipo, cant_goles
from Equipo as team, Jugador as player, contrato as contador 
where player.id_jugador = contador.id_jugador
and team.id_equipo=contador.id_equipo
and player.nombre_jugador = 'Messi' 
and team.nombre_equipo = 'Barcelona'; -- para elegir un solo jugador en algun equipo



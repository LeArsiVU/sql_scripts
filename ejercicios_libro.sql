Create database INVENTARIO;
USE INVENTARIO;
CREATE SCHEMA CD_INVENTARIO;
create table ARTISTAS(ID_ARTISTA INTEGER,
 NOMBRE_ARTISTA CHARACTER(60),
 FDN_ARTISTA date, POSTER_EN_EXISTENCIA BOOLEAN);

INSERT INTO ARTISTAS VALUES(01, ,"1994-06-05",TRUE);
SELECT * FROM ARTISTAS;
DROP TABLE ARTISTAS;

CREATE TABLE DISCOS_COMPACTOS(
ID_DISCO_COMPACTO INT, 
TITULO_CD VARCHAR(60),
ID_DISQUERA INT);

CREATE TABLE DISQUERA_CD(
ID_DISQUERA INT,
NOMBRE_COMPAÑIA VARCHAR(60)
);

CREATE TABLE TIPOS_MUSICA(
ID_TIPO INT,
NOMRE_TIPO VARCHAR(60)
);

ALTER TABLE ARTISTAS
ADD COLUMN LUGAR_DE_NACIMIENTO VARCHAR(60);

SELECT * FROM ARTISTAS;

ALTER TABLE ARTISTAS
DROP column LUGAR_DE_NACIMIENTO;

CREATE TABLE TIPOS_DISCOS_COMPACTOS(
ID_DISCO_COMPACTO INT,
ID_TIPO INT,
TITULO_CD VARCHAR(60));

DROP TABLE TIPOS_DISCOS_COMPACTOS CASCADE;

SELECT * FROM TIPOS_DISCOS_COMPACTOS;

ALTER TABLE TIPOS_DISCOS_COMPACTOS
DROP column TITULO_CD CASCADE;


DROP TABLE ARTISTAS;


CREATE DATABASE IF NOT EXISTS EJEMPLOS_JOINS;
USE EJEMPLOS_JOINS;

CREATE TABLE IF NOT EXISTS JUEGOS(
ID INT PRIMARY KEY,
NOMBRE VARCHAR(60)
);

LOAD DATA INFILE 'juegos.csv'
into table JUEGOS
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES terminated by '\n'
IGNORE 1 ROWS;

SELECT * FROM JUEGOS;

CREATE TABLE IF NOT EXISTS USUARIO_JUEGOS(
ID_USUARIO INT,
ID_JUEGO INT,
UNIQUE KEY (ID_USUARIO,ID_JUEGO)
);

LOAD DATA INFILE 'usuariojuegos.csv'
into table USUARIO_JUEGOS
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES terminated by '\n'
IGNORE 1 ROWS;

SELECT * FROM USUARIO_JUEGOS;
 

CREATE TABLE USUARIO(
ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
USERNAME VARCHAR(60)
);

LOAD  DATA  INFILE  'usuarios.csv'
into table USUARIO
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES terminated by '\n'
IGNORE 1 ROWS;

SELECT * FROM USUARIO;

-- INNER JOIN: MUESTRA LA RELACIÓN ENTRE LAS TABLAS A y C a TRAVÉS DE B
SELECT
USUARIO.USERNAME,
 JUEGOS.NOMBRE
FROM USUARIO -- A 
INNER JOIN USUARIO_JUEGOS /*B*/ ON USUARIO.ID = USUARIO_JUEGOS.ID_USUARIO
INNER JOIN JUEGOS /*C*/ ON USUARIO_JUEGOS.ID_JUEGO=JUEGOS.ID;
-- (AnB)U(BnC)

SELECT
USUARIO.USERNAME AS NOMBRE_DEL_USUARIO,
JUEGOS.NOMBRE AS JUEGO
FROM USUARIO -- A
LEFT JOIN USUARIO_JUEGOS /*B*/ ON USUARIO.ID = USUARIO_JUEGOS.ID_USUARIO
LEFT JOIN JUEGOS /*C*/ ON USUARIO_JUEGOS.ID_JUEGO=JUEGOS.ID;

SELECT
USUARIO.USERNAME AS NOMBRE_DEL_USUARIO,
JUEGOS.NOMBRE AS JUEGO
FROM USUARIO -- A
RIGHT JOIN USUARIO_JUEGOS /*B*/ ON USUARIO.ID = USUARIO_JUEGOS.ID_USUARIO
RIGHT JOIN JUEGOS /*C*/ ON USUARIO_JUEGOS.ID_JUEGO=JUEGOS.ID;


-- FULL OUTER JOIN 
SELECT
USUARIO.USERNAME AS NOMBRE_DEL_USUARIO,
JUEGOS.NOMBRE AS JUEGO
FROM USUARIO -- A
LEFT JOIN USUARIO_JUEGOS /*B*/ ON USUARIO.ID = USUARIO_JUEGOS.ID_USUARIO
LEFT JOIN JUEGOS /*C*/ ON USUARIO_JUEGOS.ID_JUEGO=JUEGOS.ID
UNION
SELECT
USUARIO.USERNAME AS NOMBRE_DEL_USUARIO,
JUEGOS.NOMBRE AS JUEGO
FROM USUARIO -- A
RIGHT JOIN USUARIO_JUEGOS /*B*/ ON USUARIO.ID = USUARIO_JUEGOS.ID_USUARIO
RIGHT JOIN JUEGOS /*C*/ ON USUARIO_JUEGOS.ID_JUEGO=JUEGOS.ID;


-- ELEMENTOS DE A que no están en B- LEFT EXCLUDING JOIN
SELECT
USUARIO.USERNAME AS NOMBRE_DEL_USUARIO
FROM USUARIO -- A
LEFT JOIN USUARIO_JUEGOS /*B*/ ON USUARIO.ID = USUARIO_JUEGOS.ID_USUARIO
WHERE USUARIO_JUEGOS.ID_USUARIO IS NULL;

-- ELEMENTOS DE B que no están en A- RIGHT EXCLUDING JOIN
SELECT
USUARIO.USERNAME AS NOMBRE_DEL_USUARIO
FROM USUARIO -- A
RIGHT JOIN USUARIO_JUEGOS /*B*/ ON USUARIO.ID = USUARIO_JUEGOS.ID_USUARIO
WHERE USUARIO_JUEGOS.ID_USUARIO IS NULL;

--  OUTER EXCLUDING JOIN: muestra los elementos que no tienen relación
SELECT
USUARIO.USERNAME AS NOMBRE_DEL_USUARIO,
JUEGOS.NOMBRE AS JUEGO
FROM USUARIO -- A
LEFT JOIN USUARIO_JUEGOS /*B*/ ON USUARIO.ID = USUARIO_JUEGOS.ID_USUARIO
LEFT JOIN JUEGOS /*C*/ ON USUARIO_JUEGOS.ID_JUEGO=JUEGOS.ID
WHERE  USUARIO_JUEGOS.ID_USUARIO IS NULL -- forma equivalente  a la de abajo
UNION
SELECT
USUARIO.USERNAME AS NOMBRE_DEL_USUARIO,
JUEGOS.NOMBRE AS JUEGO
FROM USUARIO -- A
RIGHT JOIN USUARIO_JUEGOS /*B*/ ON USUARIO.ID = USUARIO_JUEGOS.ID_USUARIO
RIGHT JOIN JUEGOS /*C*/ ON (USUARIO_JUEGOS.ID_USUARIO IS NULL OR JUEGOS.ID IS NULL)
/*WHERE  USUARIO_JUEGOS.ID_USUARIO IS NULL*/;
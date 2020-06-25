use clubibarra;

-- 1) Los datos del archivo txt van a estar determinados de pendiendo del símbolo en FIELDS TERMINATED BY 

-- 2) Mover el archivo a la carpeta /var/lib/mysql/NOMBRE_DE_LA_BASE_DE_DATOS_QUE_SE_USA (en este caso clubibarra)

-- 3) crear la tabla con los campos que correspondan al archivo

create table sinaloa(
ID_MUNICIPIO INT,
NOMBRE_MUNICIOPIO VARCHAR(30),
PRIMARY KEY(ID_MUNICIPIO)
)ENGINE InnoDB;

-- 4) cargar los datos
LOAD DATA INFILE 'municipios_sinaloa.txt'
into table sinaloa
FIELDS TERMINATED BY ','
LINES terminated by '\n';

select * from sinaloa;


-- OTRO EJEMPLO
create table idiomas(
id_idioma int,
idioma_nombre varchar(20), primary key (id_idioma)
);

LOAD DATA INFILE 'idiomas.txt'
into table idiomas
fields terminated by ','
lines terminated by '\n';

select * from idiomas;

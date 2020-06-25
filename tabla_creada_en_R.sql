-- tabla creada en R
use clubibarra;
SELECT * FROM municipios;

Alter table municipios
Add column HE_IDO varchar(10) default 'NO';

Alter table municipios
Add constraint PK_ID_MUNICIPIOS primary key (ID_MUNICIPIO);

insert into municipios values(18, "ajaja", "si");-- sale que ya esta duplicado porque ya se añadió la constricción
Creación de un tablespace para datos y otro para índices. Estos tablespaces son la ubicación donde se almacenarán los objetos del esquema de Oracle que vamos a crear.
CREATE TABLESPACE "APPDAT" LOGGING
DATAFILE '/export/home/oracle/oradata/datafiles/APPDAT.dbf' SIZE 1024M
EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO

Tablespace para datos, con tamaño inicial de 1024 Mb, y auto extensible
CREATE TABLESPACE "APPIDX" LOGGING
DATAFILE '/export/home/oracle/oradata/datafiles/APPIDX.dbf' SIZE 512M
EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO

Tablespace para índices, con tamaño inicial de 512 Mb, y auto extensible
CREATE TABLESPACE "APPIDX" LOGGING
DATAFILE '/export/home/oracle/oradata/datafiles/APPIDX.dbf' SIZE 512M
EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO

La creación de estos tablespaces no es obligatoria, pero sí recomendable, así cada usuario de la BD tendrá su propio espacio de datos.
Creación del usuario que va a trabajar sobre estos tablespaces, y que será el propietario de los objetos que se se creen en ellos
CREATE USER "APP" PROFILE "DEFAULT" IDENTIFIED BY "APPPWD"
DEFAULT TABLESPACE "APPDAT" TEMPORARY TABLESPACE "TEMP" ACCOUNT UNLOCK;

CREATE INDEX mi_indice ON mi_tabla(mi_campo)
TABLESPACE APPIDX;

Sólo falta asignarle los permisos necesarios para trabajar. Si se le asignan los ro
les 'Connect' y 'Resource' ya tiene los permisos mínimos, podrá conectarse a la base de datos y realizar las operaciones más habituales de consulta, modificación y creación de objetos en su propio esquema.
GRANT "CONNECT" TO "APP";
GRANT "RESOURCE" TO "APP";

Completamos la asignación de permisos con privilegios específicos sobre objetos del esquema Oracle para asegurarnos de que el usuario pueda realizar todas las operaciones que creamos necesarias
GRANT ALTER ANY INDEX TO "APP";
GRANT ALTER ANY SEQUENCE TO "APP";
GRANT ALTER ANY TABLE TO "APP";
GRANT ALTER ANY TRIGGER TO "APP";
GRANT CREATE ANY INDEX TO "APP";
GRANT CREATE ANY SEQUENCE TO "APP";
GRANT CREATE ANY SYNONYM TO "APP";
GRANT CREATE ANY TABLE TO "APP";
GRANT CREATE ANY TRIGGER TO "APP";
GRANT CREATE ANY VIEW TO "APP";
GRANT CREATE PROCEDURE TO "APP";
GRANT CREATE PUBLIC SYNONYM TO "APP";
GRANT CREATE TRIGGER TO "APP";
GRANT CREATE VIEW TO "APP";
GRANT DELETE ANY TABLE TO "APP";
GRANT DROP ANY INDEX TO "APP";
GRANT DROP ANY SEQUENCE TO "APP";
GRANT DROP ANY TABLE TO "APP";
GRANT DROP ANY TRIGGER TO "APP";
GRANT DROP ANY VIEW TO "APP";
GRANT INSERT ANY TABLE TO "APP";
GRANT QUERY REWRITE TO "APP";
GRANT SELECT ANY TABLE TO "APP";
GRANT UNLIMITED TABLESPACE TO "APP";
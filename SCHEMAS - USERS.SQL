
	--------------------------------------- USUARIOS Y PERFILES -------------------------------------------------
	EN ORACLE USUARIO === DIRECTAMENTE RELACIONADA CON LA BASE DE DATOS

LISTA LAS BASES DE DATOS CREADAS EN EL SERVIDOR:
select * from V$DATABASE

LISTA TODOS LOS USUARIO CON ACCESO A LA BASE DE DATOS
select * from DBA_USERS | SELECT * FROM ALL_USERS

CAMBIA LA FECHA DE EXPIRACION DE LOS PERFILES SYS, SYSTEM
ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED
ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME 90      // CADUCARIA EN 90 DIAS

CAMBIAR LA CONTRASEÑA DE UN USUARIO / ESQUEMA   PARA REACTIVAR USUARIO BLOQUEDO POR FECHA DE EXPIRACION (CADUCADO).
ALTER USER SYSTEM IDENTIFIE BY 123456

DESBLOQUEAR USUARIO BLOQUEDO DE FORMA PREDETERMINADA
ALTER USER SYTEM ACCOUNT UNLOCK

----------------------------------- CREAR USUARIO ------------------------------------------------------------
PERMISOS PARA QUE EL USUARIO LOGEADO PUEDA CREAR OTRO USUARIO
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE

CREATE USER <NOMBRE_USUARIO> IDENTIFIED BY <CONTRASEÑA>
CREATE USER MARTIN_ORACLE IDENTIFIED BY "Mecano007"
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP
QUOTA UNLIMITED ON USERS

HABILITAR LOS PRIVILEGIOS DEL USUARIO:
GRANT CREATE SESSION TO <NOMBRE_USUARIO>;
GRANT CREATE TABLE TO <NOMBRE_USUARIO>;
GRANT CREATE VIEW TO <NOMBRE_USUARIO>;
GRANT CREATE PROCEDURE TO <NOMBRE_USUARIO>;
GRANT CREATE TRIGGER TO <NOMBRE_USUARIO>;
GRANT CREATE SEQUENCE TO <NOMBRE_USUARIO>;
GRANT CREATE JOB TO <NOMBRE_USUARIO>;
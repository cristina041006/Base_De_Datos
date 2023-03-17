#CREATE DATA BASE
#USE DATA BASE

CREATE TABLE DEPARTAMENTOS
(
	CODIGO INT(10) AUTO_INCREMENT,
	DESCRIPCION VARCHAR(100),
	CONSTRAINT PK_DEP PRIMARY KEY (CODIGO)
	
);

INSERT INTO DEPARTAMENTOS (DESCRIPCION) VALUES ('COMERCIO');
INSERT INTO DEPARTAMENTOS (DESCRIPCION) VALUES ('PUBLICIDAD');
INSERT INTO DEPARTAMENTOS (DESCRIPCION) VALUES ('MANTENIMIENTO');
INSERT INTO DEPARTAMENTOS (DESCRIPCION) VALUES ('LIMPIEZA');
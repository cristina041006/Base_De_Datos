CREATE TABLE PROFESORES
(
	DNI VARCHAR2(8),
	NOMBRE VARCHAR2(10),
	APELLIDO1 VARCHAR2(10),
	APELLIDO2 VARCHAR2(10),
	DIRECCION VARCHAR2(50),
	TITULO VARCHAR2(20),
	GANA VARCHAR2 (10),
	CONSTRAINT PK_PROF PRIMARY KEY (DNI)
);

INSERT INTO PROFESORES VALUES ('32432455', 'JUAN', 'ARCH', 'LOPEZ', 'PUERTA NEGRA, 4', 'ING.INFORMATICA', '7500');
INSERT INTO PROFESORES VALUES ('43215643', 'MARIA', 'OLIVIA', 'RUBIO', 'JUAN ALFONSO, 32', 'LDA.FIL.INGLESA', '5400');
INSERT INTO PROFESORES VALUES ('32432458', 'JUAN', 'ARCH', 'LOPEZ', 'PUERTA NEGRA, 4', 'ING.INFORMATICA', null);

CREATE TABLE CURSOS 
(
	COD_CURSO VARCHAR2(10),
	NOMBRE_CURSO VARCHAR2(50),
	DNI_PROFESOR VARCHAR2(8),
	MAXIMO_ALUMNOS NUMBER(10),
	FECHA_INICIO DATE,
	FEHCA_FIN DATE,
	NUM_HORAS NUMBER (10),
	CONSTRAINT PK_CURSOS PRIMARY KEY (COD_CURSO),
	CONSTRAINT FK1_CURSOS FOREIGN KEY (DNI_PROFESOR) REFERENCES PROFESORES(DNI)	
);

INSERT INTO CURSOS VALUES ('1','Inglés Básico', '43215643', 15, TO_DATE('01/11/00','DD/MM/YY'),TO_DATE('22/12/00','DD/MM/YY'),120);
INSERT INTO CURSOS (COD_CURSO, NOMBRE_CURSO, DNI_PROFESOR, FECHA_INICIO, NUM_HORAS) VALUES ('2','Administracion linux', '32432455', TO_DATE('01/09/00','DD/MM/YY'), 80);

CREATE TABLE ALUMNOS
(
	DNI VARCHAR2(8),
	NOMBRE VARCHAR2(10),
	APELLIDO1 VARCHAR2(10),
	APELLIDO2 VARCHAR2(10),
	DIRECCION VARCHAR2 (20),
	SEXO VARCHAR2(1),
	FECHA_NACIMIENTO DATE,
	CURSO VARCHAR2 (10),
	CONSTRAINT PK_ALUMNOS PRIMARY KEY (DNI),
	CONSTRAINT FK_ALUMNOS FOREIGN KEY (CURSO) REFERENCES CURSOS(COD_CURSO),
	CONSTRAINT CHK1_ALUMNOS CHECK (SEXO='F' OR SEXO='M')
);

INSERT INTO ALUMNOS VALUES ('123523', 'LUCAS','MANILVA','LOPEZ','ALHAMAR, 3', 'M', TO_DATE('01/11/79','DD/MM/YY'),'1');
INSERT INTO ALUMNOS VALUES ('2567567', 'ANTONIA','LOPEZ','ALCANTARA','MANIQUI, 21', 'M','','2');
INSERT INTO ALUMNOS VALUES ('3123689', 'MANUEL','ALCANTARA','PEDROS','JULIAN, 2','M','','2');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, SEXO, FECHA_NACIMIENTO, CURSO)  VALUES ('123526', 'SERGIO','NAVAS','RETAL','M','','2');
INSERT INTO ALUMNOS VALUES ('4896765', 'JOSE','PEREZ','CABALLAR','JARCHAR, 5', 'M', TO_DATE('03/02/77','DD/MM/YY'),'1');
INSERT INTO ALUMNOS (DNI, NOMBRE, APELLIDO1, APELLIDO2, DIRECCION, SEXO, FECHA_NACIMIENTO) VALUES ('789678', 'MARIA','JAEN','SEVILLA','MARTOS, 5', 'M','');

UPDATE ALUMNOS SET FECHA_NACIMIENTO=TO_DATE('23/12/76','DD/MM/YY') WHERE NOMBRE='ANTONIA';
UPDATE ALUMNOS SET CURSO='1' WHERE NOMBRE='ANTONIA';
DELETE FROM PROFESORES WHERE NOMBRE='LAURA';
ALTER TABLE CURSOS ADD NUMERO_ALUMNOS NUMBER(10);
UPDATE ALUMNOS SET FECHA_NACIMIENTO=TO_DATE('01/01/12','DD/MM/YY') WHERE FECHA_NACIMIENTO='';
UPDATE ALUMNOS SET DNI='1234567' WHERE NOMBRE='JUAN';
UPDATE PROFESORES SET DNI='2345678' WHERE DNI='7654321';
UPDATE ALUMNOS SET SEXO='F' WHERE NOMBRE='MARIA';




















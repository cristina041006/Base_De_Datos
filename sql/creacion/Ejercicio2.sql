CREATE TABLE vehiculo
(
	MATRICULA VARCHAR2(7),
	MARCA VARCHAR2(10) NOT NULL,
	MODELO VARCHAR2(10) NOT NULL,
	FECHA_COMPRA DATE,
	PRECIO NUMBER(5,2),
	CONSTRAINT PK_VEHICULO PRIMARY KEY (MATRICULA)
);

ALTER TABLE vehiculo ADD CONSTRAINT CHCK_1 CHECK (PRECIO>0);
ALTER TABLE vehiculo ADD CONSTRAINT CHCK_2 CHECK ((EXTRACT(YEAR FROM FECHA_COMPRA))>2001);

CREATE TABLE cliente 
(
	DNI VARCHAR2(9),
	NOMBRE VARCHAR2(30) NOT NULL,
	NACIONALIDAD VARCHAR2(30),
	FECHA_NACIMIENTO DATE,
	DIRECCION VARCHAR2(50),
	CONSTRAINT PK_CLIENTE PRIMARY KEY (DNI)
);

CREATE TABLE alquileres
(
	MATRICULA VARCHAR2(7) NOT NULL,
	DNI VARCHAR2(9) NOT NULL,
	FECHA_HORA DATE,
	NUM_DIAS NUMBER(2) NOT NULL,
	KILOMETROS NUMBER(4) DEFAULT 0,
	CONSTRAINT PK_ALQUILERES PRIMARY KEY (MATRICULA, DNI, FECHA_HORA),
	CONSTRAINT FK_AL1 FOREIGN KEY (MATRICULA) REFERENCES vehiculo(MATRICULA),
	CONSTRAINT FK_AL2 FOREIGN KEY (DNI) REFERENCES cliente(DNI)
);

ALTER TABLE cliente ADD CONSTRAINT CHCK_3 CHECK (regexp_like(DNI,'^[0-9]{8}-[A-Z | a-z]{1}$'));
ALTER TABLE vehiculo ADD CONSTRAINT CHCK_4 CHECK (regexp_like(MATRICULA,'^[0-9]{4}[A-Z]{3}$'));
ALTER TABLE vehiculo ADD TOTAL_KILOMETROS NUMBER(4);
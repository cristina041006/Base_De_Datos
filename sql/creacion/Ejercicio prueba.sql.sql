CREATE TABLE cliente 
(
	DNI VARCHAR2(9),
	Nombre VARCHAR2(50) NOT NULL,
	Apellidos VARCHAR2(100) NOT NULL,
	Fecha_nacimiento DATE,
	Direccion VARCHAR2(50),
	CONSTRAINT PK_cliente PRIMARY KEY (DNI)
);

CREATE TABLE categoria 
(
	Nombre VARCHAR2(50),
	CONSTRAINT PK_categoria PRIMARY KEY (Nombre)
);

CREATE TABLE producto 
(
	Nombre VARCHAR2(50),
	precio NUMBER(5,2),
	cantidad NUMBER(10),
	Nombre_categoria VARCHAR2(50),
	CONSTRAINT PK_producto PRIMARY KEY (Nombre),
	CONSTRAINT FK_producto FOREIGN KEY (Nombre_categoria) REFERENCES categoria(Nombre)
);

CREATE TABLE compra 
(
	DNI VARCHAR2(9),
	Nombre VARCHAR2(50),
	Fecha DATE NOT NULL,
	CONSTRAINT PK_compra PRIMARY KEY (DNI, Nombre, Fecha),
	CONSTRAINT FK1_compra FOREIGN KEY (DNI) REFERENCES cliente(DNI),
	CONSTRAINT FK2_compra FOREIGN KEY (Nombre) REFERENCES producto(Nombre)
);

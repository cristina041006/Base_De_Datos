
--DROP TABLE PUBLICACIONES CASCADE CONSTRAINT;
--DROP TABLE EDITORIAL CASCADE CONSTRAINT; 
--DROP TABLE LIBRO_AUTOR CASCADE CONSTRAINT; 
--DROP TABLE AUTOR CASCADE CONSTRAINT;
--DROP TABLE LIBRO CASCADE CONSTRAINT; 
--DROP TABLE TEMA CASCADE CONSTRAINT;


CREATE TABLE tema 
(
	cod_tema NUMBER(10),
	denominacion VARCHAR2(100),
	cod_tema_padre NUMBER(10),
	CONSTRAINT PK_tema PRIMARY KEY (cod_tema),
	CONSTRAINT FK_tema FOREIGN KEY (cod_tema_padre) REFERENCES tema(cod_tema)
);

CREATE TABLE libro 
(
	cod_libro VARCHAR2(50),
	titulo VARCHAR2(50) NOT NULL,
	f_creacion DATE,
	cod_tema NUMBER(10),
	autor_principal VARCHAR2(50),
	CONSTRAINT PK_libro PRIMARY KEY (cod_libro)
	
);

CREATE TABLE autor 
(
	cod_autor VARCHAR2(50),
	nombre VARCHAR2(50) NOT NULL,
	f_nacimiento DATE,
	libro_principal VARCHAR2(50),
	CONSTRAINT PK_autor PRIMARY KEY (cod_autor)
);

CREATE TABLE libro_autor
(
	cod_libro VARCHAR2(50),
	cod_autor VARCHAR2(50),
	orden VARCHAR2(50) NOT NULL,
	CONSTRAINT PK_libro_autor PRIMARY KEY (cod_libro, cod_autor),
	CONSTRAINT FK_libro_autor FOREIGN KEY (cod_libro) REFERENCES libro(cod_libro),
	CONSTRAINT FK2_libro_autor FOREIGN KEY (cod_autor) REFERENCES autor(cod_autor)
);

CREATE TABLE editorial 
(
	cod_editorial VARCHAR2(50),
	denominacion VARCHAR2(100),
	CONSTRAINT PK_editorial PRIMARY KEY (cod_editorial)
);

CREATE TABLE publicaciones
(
	cod_editorial VARCHAR2(50),
	cod_libro VARCHAR2(50),
	precio NUMBER(5,2) NOT NULL,
	f_publicacion DATE DEFAULT SYSDATE,
	CONSTRAINT PK_publicaciones PRIMARY KEY (cod_editorial, cod_libro),
	CONSTRAINT FK_publicaciones FOREIGN KEY (cod_libro) REFERENCES libro(cod_libro),
	CONSTRAINT FK2_publicaciones FOREIGN KEY (cod_editorial) REFERENCES editorial(cod_editorial) ON DELETE CASCADE
);

ALTER TABLE autor ADD CONSTRAINT FK_autor FOREIGN KEY (libro_principal) REFERENCES libro(cod_libro);
ALTER TABLE libro ADD CONSTRAINT FK_libro FOREIGN KEY (autor_principal) REFERENCES autor(cod_autor);
ALTER TABLE libro ADD CONSTRAINT FK2_libro FOREIGN KEY (cod_tema) REFERENCES tema(cod_tema);
ALTER TABLE libro_autor ADD CONSTRAINT chk1_libro_autor CHECK (orden BETWEEN 1 AND 5);
ALTER TABLE tema ADD CONSTRAINT chk1_tema CHECK (cod_tema_padre>cod_tema);
ALTER TABLE publicaciones ADD CONSTRAINT chk1_precio CHECK (precio>0);

--ALTER TABLE autor DROP CONSTRAINT FK_AUTOR;



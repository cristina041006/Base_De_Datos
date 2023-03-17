CREATE TABLE FABRICANTE
(
	CODIGO INT(10),
	NOMBRE VARCHAR(100),
	CONSTRAINT PK_FAB PRIMARY KEY (CODIGO)
);

CREATE TABLE PRODUCTO 
(
	CODIGO INT(10),
	NOMBRE VARCHAR(100),
	PRECIO DOUBLE,
	CODIGO_FABRICANTE INT(10),
	CONSTRAINT PK_PRODUCTO PRIMARY KEY (CODIGO),
	CONSTRAINT FK_PRODUCTO FOREIGN KEY (CODIGO_FABRICANTE) REFERENCES FABRICANTE(CODIGO)
);

INSERT INTO FABRICANTE VALUES (1, 'ASUS');
INSERT INTO FABRICANTE VALUES (2, 'LENOVO');
INSERT INTO FABRICANTE VALUES (3, 'HEWLWTT-PACKARD');
INSERT INTO FABRICANTE VALUES (4, 'SAMSUNG');
INSERT INTO FABRICANTE VALUES (5, 'SEAGATE');
INSERT INTO FABRICANTE VALUES (6, 'CRUCIAL');
INSERT INTO FABRICANTE VALUES (7, 'GIGABYTE');
INSERT INTO FABRICANTE VALUES (8, 'HUAWEI');
INSERT INTO FABRICANTE VALUES (9, 'XIAOMI');

INSERT INTO PRODUCTO VALUES (1, 'DISCO DURO SATA3 1TB', 86.99, 5);
INSERT INTO PRODUCTO VALUES (2, 'Memoria RAM DDR4 8GB', 120, 6); 
INSERT INTO PRODUCTO VALUES (3, 'Disco SSD 1 TB', 150.99, 4); 
INSERT INTO PRODUCTO VALUES (4, 'GeForce GTX 1050Ti', 185, 7); 
INSERT INTO PRODUCTO VALUES (5, 'GeForce GTX 1080 Xtreme', 755, 6); 
INSERT INTO PRODUCTO VALUES (6, 'Monitor 24 LED Full HD', 202, 1); 
INSERT INTO PRODUCTO VALUES (7, 'Monitor 27 LED Full HD', 245.99, 1); 
INSERT INTO PRODUCTO VALUES (8, 'Portátil Yoga 520', 559, 2);
INSERT INTO PRODUCTO VALUES (9, 'Portátil Ideapd 320', 444, 2); 
INSERT INTO PRODUCTO VALUES (10, 'Impresora HP Deskjet 3720', 59.99, 3); 
INSERT INTO PRODUCTO VALUES (11, 'Impresora HP Laserjet Pro M26nw', 180, 3); 

INSERT INTO FABRICANTE VALUES (10, 'APPLE');
INSERT INTO FABRICANTE (NOMBRE) VALUES ('OPPO');
#NO SE PUEDE PORQUE FALTA LA PRIMARY KEY
INSERT INTO PRODUCTO VALUES (12, 'APPLE WACHT', 200, 10);
INSERT INTO PRODUCTO (NOMBRE, PRECIO, CODIGO_FABRICANTE) VALUES ('OPPO GALAXY 23', 207, 10);
#NO SE PUEDE PORQUE FALTA LA PRIMARY KEY
DELETE FROM FABRICANTE WHERE NOMBRE='ASUS';
#NO ES POSIBLE BORRARLO PORQUE ALGUNOS PRODUCTOS DEPENDEN DE EL, PRIMERO DEBERIAMOS BORRAR LOS PRODUCTOS O HACER EL BORRADO EN CASCADA
DELETE FROM FABRICANTE WHERE NOMBRE='XIAOMI';
#SI ES POSIBLE PORQUE NINGUN PRODUCTO DEPENDE DE ESE FABRICANTE
UPDATE  FABRICANTE SET CODIGO=20 WHERE NOMBRE='LENOVO';
#NO ES POSIBLE BORRARLO PORQUE ALGUNOS PRODUCTOS DEPENDEN DE EL, DEBERIAMOS ACTUALIZAR TODOS SUS PRODUCTOS
UPDATE FABRICANTE SET CODIGO=30 WHERE NOMBRE='HUAWEI';
#SI ES POSIBLE PORQUE NINGUN PRODUCTO DEPENDE DE ESE FABRICANTE
UPDATE PRODUCTO SET PRECIO=(PRECIO+5);
DELETE FROM PRODUCTO WHERE REGEXP_LIKE(NOMBRE,'^IMPRESORA');
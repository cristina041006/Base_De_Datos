--1 

SELECT C.NOMBRE, P.NOMBRE
FROM CLIENTES C, PUEBLOS P
WHERE C.CODPUE = P.CODPUE;

--2

SELECT P.NOMBRE, PR.NOMBRE
FROM PUEBLOS P, PROVINCIAS PR
WHERE P.CODPRO = PR.CODPRO

--3

SELECT C.NOMBRE, P.NOMBRE, PR.NOMBRE
FROM CLIENTES C, PUEBLOS P, PROVINCIAS PR
WHERE  C.CODPUE = P.CODPUE AND P.CODPRO = PR.CODPRO;

--4

SELECT DISTINCT PR.NOMBRE
FROM PROVINCIAS PR, CLIENTES C, PUEBLOS P
WHERE C.CODPUE = P.CODPUE AND P.CODPRO = PR.CODPRO;

--5

SELECT DISTINCT A.DESCRIP
FROM ARTICULOS A, LINEAS_FAC LF
WHERE A.CODART = LF.CODART AND LF.CANT >10; 

--6

SELECT F.FECHA, LF.CODART, LF.CANT 
FROM FACTURAS F, LINEAS_FAC LF
WHERE F.CODFAC =LF.CODFAC
ORDER BY F.FECHA DESC, LF.CODART, LF.CANT DESC 

--7

SELECT F.CODFAC, F.FECHA 
FROM FACTURAS F,CLIENTES C
WHERE F.CODCLI =C.CODCLI AND C.CODPOSTAL LIKE '%7%';

--8

SELECT F.CODFAC, F.FECHA, C.NOMBRE 
FROM FACTURAS F, CLIENTES C 
WHERE  F.CODCLI =C.CODCLI;

--9

SELECT F.CODFAC , F.FECHA , F.IVA , F.DTO ,C.NOMBRE 
FROM FACTURAS F, CLIENTES C
WHERE F.CODCLI =C.CODCLI AND ((F.IVA IS NULL OR F.IVA =0) OR (F.DTO IS NULL));

--10

SELECT A.DESCRIP, A.PRECIO, LF.PRECIO  
FROM ARTICULOS A, LINEAS_FAC LF
WHERE A.CODART =LF.CODART AND (LF.PRECIO < A.PRECIO); 

--11

SELECT F.CODFAC , F.FECHA , F.IVA , F.DTO , A.DESCRIP,   LF.DTO , LF.PRECIO 
FROM FACTURAS F, ARTICULOS A, LINEAS_FAC LF
WHERE F.CODFAC = LF.CODFAC AND LF.CODART = A.CODART ;

--12

SELECT F.CODFAC , F.FECHA , F.IVA , F.DTO , A.DESCRIP,   LF.DTO , LF.PRECIO, C.NOMBRE 
FROM FACTURAS F, ARTICULOS A, LINEAS_FAC LF, CLIENTES C
WHERE F.CODFAC = LF.CODFAC AND LF.CODART = A.CODART AND C.CODCLI= F.CODCLI 

-- 13

SELECT C.NOMBRE, PR.NOMBRE 
FROM CLIENTES C, PROVINCIAS PR, PUEBLOS P
WHERE C.CODPUE = P.CODPUE AND P.CODPRO  = PR.CODPRO AND (PR.NOMBRE) LIKE '%ma%'; 

-- 14

SELECT C.CODCLI 
FROM CLIENTES C, ARTICULOS A, FACTURAS F, LINEAS_FAC LF
WHERE C.CODCLI =F.CODCLI AND F.CODFAC = LF.CODFAC AND LF.CODART = A.CODART AND A.STOCK < A.STOCK_MIN; 

-- 15

SELECT DISTINCT A.DESCRIP 
FROM ARTICULOS A, LINEAS_FAC LF
WHERE A.CODART =LF.CODART; 

-- 16

SELECT A.CODART, LF.PRECIO-((LF.PRECIO*LF.DTO)/100) 
FROM ARTICULOS A, LINEAS_FAC LF
WHERE A.CODART = LF.CODART 

-- 17 

SELECT A.DESCRIP, C.NOMBRE, PR.NOMBRE 
FROM ARTICULOS A, CLIENTES C, FACTURAS F, LINEAS_FAC LF, PUEBLOS P, PROVINCIAS PR
WHERE A.CODART =LF.CODART AND LF.CODFAC =F.CODFAC AND F.CODCLI = C.CODCLI AND C.CODPUE =P.CODPUE AND P.CODPRO =PR.CODPRO AND PR.NOMBRE LIKE '%a';

-- 18 

SELECT DISTINCT C.NOMBRE, F.DTO 
FROM CLIENTES C, FACTURAS F
WHERE C.CODCLI =F.CODCLI AND F.DTO > 10;

-- 19

SELECT DISTINCT C.NOMBRE
FROM CLIENTES C, FACTURAS F, LINEAS_FAC LF
WHERE C.CODCLI =F.CODCLI AND F.CODFAC = LF.CODFAC AND (F.DTO > 10 OR LF.DTO >10);

-- 20

SELECT C.NOMBRE, A.DESCRIP, A.PRECIO, LF.CANT
FROM ARTICULOS A, CLIENTES C, FACTURAS F, LINEAS_FAC LF
WHERE  A.CODART =LF.CODART AND LF.CODFAC =F.CODFAC AND F.CODCLI = C.CODCLI AND C.NOMBRE LIKE 'MARIA MERCEDES';






















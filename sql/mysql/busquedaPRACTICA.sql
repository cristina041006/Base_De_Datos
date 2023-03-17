/*1 Averigua el DNI de todos los clientes.*/

SELECT c.DNI  
FROM CLIENTE c;

/* 2 Consulta todos los datos de todos los programas.*/

SELECT * 
FROM PROGRAMA p ;

/*3 Obtén un listado con los nombres de todos los programas.*/

SELECT p.NOMBRE  
FROM PROGRAMA p ;

/* 4 Genera una lista con todos los comercios.*/
 
SELECT *
FROM COMERCIO c ;

/*5 Genera una lista de las ciudades con establecimientos donde se venden
programas, sin que aparezcan valores duplicados (utiliza DISTINCT).*/

SELECT DISTINCT  C.CIUDAD 
FROM COMERCIO C , PROGRAMA P , DISTRIBUYE D 
WHERE C.CIF =D.CIF 
AND D.CODIGO =P.CODIGO ;

/*6 Obtén una lista con los nombres de programas, sin que aparezcan valores
duplicados (utiliza DISTINCT)*/

SELECT DISTINCT P.NOMBRE 
FROM PROGRAMA P ;

/*7 Obtén el DNI más 4 de todos los clientes.*/

SELECT C.DNI+4 
FROM CLIENTE C;

/*8 Haz un listado con los códigos de los programas multiplicados por 7.*/

SELECT P.CODIGO *7
FROM PROGRAMA P ;

/* 9 ¿Cuáles son los programas cuyo código es inferior o igual a 10?*/

SELECT P.NOMBRE 
FROM PROGRAMA P 
WHERE P.CODIGO >=10;

/*10 ¿Cuál es el programa cuyo código es 11?*/

SELECT P.NOMBRE 
FROM PROGRAMA P 
WHERE P.CODIGO =11;

/*11 ¿Qué fabricantes son de Estados Unidos?*/

SELECT F.NOMBRE 
FROM FABRICANTE F
WHERE F.NOMBRE LIKE 'Estados Unidos';

/* 12 ¿Cuáles son los fabricantes no españoles? Utilizar el operador IN.*/

SELECT F.NOMBRE 
FROM FABRICANTE F
WHERE F.NOMBRE not in ('España');

/*13 Obtén un listado con los códigos de las distintas versiones de Windows.*/

SELECT P.VERSIONES 
FROM PROGRAMA P 
WHERE P.NOMBRE LIKE 'Windows';

/*14 ¿En qué ciudades comercializa programas El Corte Inglés?*/

SELECT C.CIUDAD 
FROM COMERCIO C 
WHERE C.NOMBRE LIKE 'El Corte Inglés';

/*15 ¿Qué otros comercios hay, además de El Corte Inglés? Utilizar el operador
IN.*/

SELECT C.NOMBRE  
FROM COMERCIO C 
WHERE C.NOMBRE not in ('El Corte Ingles');


/*16 Genera una lista con los códigos de las distintas versiones de Windows y
Access. Utilizar el operador IN.*/

SELECT P.VERSIONES 
FROM PROGRAMA P 
WHERE P.NOMBRE LIKE 'Windows' OR P.NOMBRE LIKE 'Access';

/*17 Obtén un listado que incluya los nombres de los clientes de edades
comprendidas entre 10 y 25 y de los mayores de 50 años. Da una solución con
BETWEEN y otra sin BETWEEN.*/

SELECT C.NOMBRE 
FROM CLIENTE C
WHERE C.EDAD BETWEEN 10 AND 25
OR(EDAD>=50);

SELECT C.NOMBRE 
FROM CLIENTE C
WHERE C.EDAD>=10 
AND C.EDAD <=25 OR (EDAD>=50);

/*18 Saca un listado con los comercios de Sevilla y Madrid. No se admiten
valores duplicados.*/

SELECT DISTINCT *
FROM COMERCIO C
WHERE C.CIUDAD IN ('Sevilla' , 'Madrid');

/*19 ¿Qué clientes terminan su nombre en la letra “o”?*/

SELECT *
FROM CLIENTE C
WHERE C.NOMBRE LIKE '%o';

/*20 ¿Qué clientes terminan su nombre en la letra “o” y, además, son mayores de
30 años?*/

SELECT *
FROM CLIENTE C
WHERE C.NOMBRE LIKE '%o'
AND C.EDAD >=30;

/* 21 Obtén un listado en el que aparezcan los programas cuya versión finalice
por una letra i, o cuyo nombre comience por una A o por una W.*/

SELECT *
FROM PROGRAMA P
WHERE P.VERSIONES LIKE '%o'
OR P.NOMBRE LIKE 'A%' 
OR P.NOMBRE LIKE 'W%';

/*22 Obtén un listado en el que aparezcan los programas cuya versión finalice
por una letra i, o cuyo nombre comience por una A y termine por una S*/

SELECT *
FROM PROGRAMA P
WHERE P.VERSIONES LIKE '%i'
and  ((P.NOMBRE LIKE 'A%')
OR (P.NOMBRE LIKE '%S'));

/*23 Obtén un listado en el que aparezcan los programas cuya versión finalice
por una letra i, y cuyo nombre no comience por una A*/

SELECT *
FROM PROGRAMA P
WHERE P.VERSIONES LIKE '%i'
AND P.NOMBRE NOT LIKE 'A%' ;

/* 24 Obtén una lista de empresas por orden alfabético ascendente.*/

SELECT *
FROM FABRICANTE F
ORDER BY F.NOMBRE ;

/*25 Genera un listado de empresas por orden alfabético descendente.*/


SELECT *
FROM FABRICANTE F
ORDER BY F.NOMBRE DESC;







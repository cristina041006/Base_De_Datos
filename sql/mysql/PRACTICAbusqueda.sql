/* 1 Mostrar el apellido, oficio y número de departamento de cada empleado.*/

SELECT APELLIDO, OFICIO, DEPT_NO  
FROM EMPLE; 

/* 2 Mostrar el número, nombre y localización de cada departamento.*/

SELECT DEPT_NO, DNOMBRE, LOC  
FROM DEPART; 

/* 3 Mostrar todos los datos de todos los empleados.*/

SELECT *
FROM EMPLE;

/* 4 Datos de los empleados ordenados por apellidos.*/

SELECT *
FROM EMPLE
ORDER BY APELLIDO; 

/* 5 Datos de los empleados ordenados por número de departamento descendentemente.*/

SELECT *
FROM EMPLE
ORDER BY DEPT_NO DESC;

/* 6 Datos de los empleados ordenados por número de departamento
descendentemente y dentro de cada departamento ordenados por apellido
ascendentemente.*/

SELECT DEPT_NO, APELLIDO  
FROM EMPLE 
ORDER BY DEPT_NO DESC, APELLIDO;

/* 8 Mostrar los datos de los empleados cuyo salario sea mayor que 2000000.*/

SELECT * 
FROM EMPLE
WHERE SALARIO > 2000000;

/* 9 Mostrar los datos de los empleados cuyo oficio sea ʻANALISTAʼ.*/

SELECT *
FROM EMPLE
WHERE OFICIO LIKE 'ANALISTA';

/*10 Seleccionar el apellido y oficio de los empleados del departamento número 20.*/

SELECT APELLIDO , OFICIO 
FROM EMPLE 
WHERE DEPT_NO = 20;

/* 11 Mostrar todos los datos de los empleados ordenados por apellido.*/

SELECT *
FROM EMPLE
ORDER BY APELLIDO; 

/* 12 Seleccionar los empleados cuyo oficio sea ʻVENDEDORʼ. Mostrar los datos ordenados por apellido*/

SELECT *
FROM EMPLE
WHERE OFICIO LIKE 'VENDEDOR' ORDER BY APELLIDO;

/* 13 Mostrar los empleados cuyo departamento sea 10 y cuyo oficio sea ʻANALISTAʼ. Ordenar el resultado por apellido.*/

SELECT *
FROM EMPLE
WHERE DEPT_NO =10 
AND OFICIO LIKE 'ANALISTA' 
ORDER BY APELLIDO; 

/* 14 Mostrar los empleados que tengan un salario mayor que 200000 o que
pertenezcan al departamento número 20. */

SELECT *
FROM EMPLE 
WHERE (SALARIO >20000) OR(DEPT_NO =20);

/* 15 Ordenar los empleados por oficio, y dentro de oficio por nombre*/

SELECT *
FROM EMPLE 
ORDER BY OFICIO, APELLIDO;

/* 16 Seleccionar de la tabla EMPLE los empleados cuyo apellido empiece por ʻAʼ*/

SELECT *
FROM EMPLE 
WHERE APELLIDO LIKE 'A%';

/* 17  Seleccionar de la tabla EMPLE los empleados cuyo apellido termine por ʻZʼ*/

SELECT *
FROM EMPLE 
WHERE APELLIDO LIKE '%Z';

/* 18 Seleccionar de la tabla EMPLE aquellas filas cuyo APELLIDO empiece por
ʻAʼ y el OFICIO tenga una ʻEʼ en cualquier posición.*/

SELECT *
FROM EMPLE 
WHERE APELLIDO LIKE 'A%' 
AND OFICIO LIKE '%E%';

/* 19 Seleccionar los empleados cuyo salario esté entre 100000 y 200000. Utilizar
el operador BETWEEN.*/

SELECT *
FROM EMPLE 
WHERE SALARIO BETWEEN 100000 AND 200000;

/* 20 Obtener los empleados cuyo oficio sea ʻVENDEDORʼ y tengan una comisión
superior a 100000.*/

SELECT *
FROM EMPLE 
WHERE OFICIO LIKE 'VENDEDOR'
AND COMISION >100000;

/* 21 Seleccionar los datos de los empleados ordenados por número de
departamento, y dentro de cada departamento ordenados por apellido.*/

SELECT * 
FROM EMPLE 
ORDER BY DEPT_NO, APELLIDO;  

/* 22 Número y apellidos de los empleados cuyo apellido termine por ʻZʼ y tengan
un salario superior a 300000.*/

SELECT APELLIDO, EMP_NO  
FROM EMPLE 
WHERE APELLIDO LIKE '%Z'
AND SALARIO >300000;

/* 23. Datos de los departamentos cuya localización empiece por ʻBʼ.*/

SELECT *
FROM DEPART
WHERE LOC LIKE 'B%';

/* 24 Datos de los empleados cuyo oficio sea ʻEMPLEADOʼ, tengan un salario
superior a 100000 y pertenezcan al departamento número 10.*/

SELECT *
FROM EMPLE
WHERE OFICIO LIKE 'EMPLEADO'
AND SALARIO >100000
AND DEPT_NO =10;

/* 25. Mostrar los apellidos de los empleados que no tengan comisión*/

SELECT APELLIDO 
FROM EMPLE
WHERE COMISION IS NULL;

/* 26. Mostrar los apellidos de los empleados que no tengan comisión y cuyo
apellido empiece por ʻJʼ.*/

SELECT APELLIDO 
FROM EMPLE
WHERE COMISION IS NULL
AND APELLIDO LIKE 'J%';

/* 27. Mostrar los apellidos de los empleados cuyo oficio sea ʻVENDEDORʼ,
ʻANALISTAʼ o ʻEMPLEADOʼ.*/ 

SELECT APELLIDO 
FROM EMPLE 
WHERE OFICIO LIKE 'VENDEDOR'
OR OFICIO LIKE 'ANALISTA'
OR OFICIO LIKE 'EMPLEADO';

/*28 Mostrar los apellidos de los empleados cuyo oficio no sea ni ʻANALISTAʼ ni
ʻEMPLEADOʼ, y además tengan un salario mayor de 200000.*/

SELECT APELLIDO 
FROM EMPLE 
WHERE (OFICIO NOT LIKE 'ANALISTA'
OR OFICIO NOT LIKE 'EMPLEADO')
AND SALARIO >200000;

/* 29 Seleccionar de la tabla EMPLE los empleados cuyo salario esté entre
2000000 y 3000000 (utilizar BETWEEN).*/

SELECT *
FROM EMPLE 
WHERE SALARIO BETWEEN 2000000 AND 3000000;


/* 31. Mostrar el apellido y número de los empleados cuyo salario no esté entre
100000 y 200000 (utilizar BETWEEN).*/


SELECT APELLIDO , EMP_NO 
FROM EMPLE 
WHERE SALARIO NOT BETWEEN 100000 AND 200000;

/* 32.Obtener el apellidos de todos los empleados en minúscula*/

SELECT LOWER(APELLIDO)
FROM EMPLE ;

/* 33.En una consulta concatena el apellido de cada empleado con su oficio*/

SELECT CONCAT( APELLIDO , OFICIO) 
FROM EMPLE;


/* 34. Mostrar el apellido y la longitud del apellido (función LENGTH) de todos
los empleados, ordenados por la longitud de los apellidos de los
empleados descendentemente.*/

SELECT APELLIDO , LENGTH(APELLIDO) AS LONGITUD
FROM EMPLE 
ORDER BY LENGTH(APELLIDO) DESC;


/* 35.Obtener el año de contratación de todos los empleados (función YEAR).*/


#SELECT (EXTRACT (YEAR 
#FROM EMPLE

/* 36. Mostrar los datos de los empleados que hayan sido contratados en el
año 1992.*/

/* 37. Mostrar los datos de los empleados que hayan sido contratados en el
mes de febrero de cualquier año (función MONTHNAME).*/

/* 38. Para cada empleado mostrar el apellido y el mayor valor del salario y la
comisión que tienen*/

SELECT APELLIDO , SALARIO , COMISION 
FROM EMPLE;


/* 39. Mostrar los datos de los empleados cuyo apellido empiece por 'A' y
hayan sido contratados en el año 1990.*/

SELECT *
FROM EMPLE
WHERE APELLIDO LIKE 'A%';

/* 40. Mostrar los datos de los empleados del departamento 10 que no tengan
comisión.*/


SELECT *
FROM EMPLE 
WHERE DEPT_NO =10
AND COMISION IS NULL;



















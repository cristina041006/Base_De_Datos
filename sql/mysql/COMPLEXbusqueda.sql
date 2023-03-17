/* 1. Visualizar el número de empleados de cada departamento. Utilizar
GROUP BY para agrupar por departamento.*/

SELECT E.DEPT_NO , COUNT(E.EMP_NO)  
FROM EMPLE E  
GROUP BY E.DEPT_NO ;

/*2. Visualizar los departamentos con más de 5 empleados. Utilizar GROUP
BY para agrupar por departamento y HAVING para establecer la condición
sobre los grupos.*/

SELECT E.DEPT_NO  
FROM EMPLE E  
GROUP BY E.DEPT_NO
HAVING COUNT(E.EMP_NO)>5;

/*3. Hallar la media de los salarios de cada departamento (utilizar la función
avg y GROUP BY).*/

SELECT AVG(E.SALARIO) 
FROM EMPLE E  
GROUP BY E.DEPT_NO;

/*4. Visualizar el nombre de los empleados vendedores del departamento
ʻVENTASʼ (Nombre del departamento=ʼVENTASʼ, oficio=ʼVENDEDORʼ).*/

SELECT E.APELLIDO 
FROM EMPLE E, DEPART D
WHERE E.DEPT_NO =D.DEPT_NO 
AND E.OFICIO LIKE 'VENDEDOR'
AND D.DNOMBRE LIKE 'VENTAS';


/*5. Visualizar el número de vendedores del departamento ʻVENTASʼ (utilizar
la función COUNT sobre la consulta anterior).*/

SELECT COUNT(E.EMP_NO) 
FROM EMPLE E, DEPART D
WHERE E.DEPT_NO =D.DEPT_NO 
AND E.OFICIO LIKE 'VENDEDOR'
AND D.DNOMBRE LIKE 'VENTAS';


/*6. Visualizar los oficios de los empleados del departamento ʻVENTASʼ.*/

SELECT DISTINCT E.OFICIO 
FROM DEPART D, EMPLE E
WHERE D.DEPT_NO =E.DEPT_NO 
AND D.DNOMBRE LIKE 'VENTAS';


/*7. A partir de la tabla EMPLE, visualizar el número de empleados de cada
departamento cuyo oficio sea ʻEMPLEADOʼ (utilizar GROUP BY para
agrupar por departamento. En la cláusula WHERE habrá que indicar que el
oficio es ʻEMPLEADOʼ).*/

SELECT COUNT(E.EMP_NO) 
FROM EMPLE E, DEPART D
WHERE E.DEPT_NO =D.DEPT_NO 
AND E.OFICIO LIKE 'EMPLEADO'
GROUP BY D.DEPT_NO ;


/*8. Visualizar el departamento con más empleados.*/


SELECT  COUNT(E.EMP_NO) 
FROM EMPLE E
GROUP BY E.DEPT_NO
ORDER BY COUNT(E.EMP_NO) DESC LIMIT 1;


/*9. Mostrar los departamentos cuya suma de salarios sea mayor que la
media de salarios de todos los empleados.*/

SELECT D.DEPT_NO 
FROM DEPART D, EMPLE E
WHERE E.DEPT_NO =D.DEPT_NO 
GROUP BY D.DEPT_NO 
HAVING SUM(E.SALARIO)> AVG(E.SALARIO); 


/*10. Para cada oficio obtener la suma de salarios.*/


SELECT E.OFICIO , SUM(E.SALARIO) 
FROM EMPLE E
GROUP BY E.OFICIO ;

/*11. Visualizar la suma de salarios de cada oficio del departamento
ʻVENTASʼ.*/

SELECT E.OFICIO , SUM(E.SALARIO) 
FROM EMPLE E, DEPART D
WHERE E.DEPT_NO =D.DEPT_NO 
AND D.DNOMBRE LIKE 'VENTAS'
GROUP BY E.OFICIO ;


/*12. Visualizar el número de departamento que tenga más empleados cuyo
oficio sea empleado.*/

SELECT D.DEPT_NO 
FROM DEPART D, EMPLE E
WHERE D.DEPT_NO =E.DEPT_NO 
AND E.OFICIO LIKE 'EMPLEADO'
GROUP BY D.DEPT_NO 
ORDER BY COUNT(E.EMP_NO) DESC LIMIT 1;


/*13. Mostrar el número de oficios distintos de cada departamento.*/


SELECT D.DEPT_NO , COUNT(DISTINCT E.OFICIO)  
FROM EMPLE E, DEPART D
WHERE E.DEPT_NO =D.DEPT_NO 
GROUP BY D.DEPT_NO ;


/*14. Mostrar los departamentos que tengan más de dos personas
trabajando en la misma profesión.*/

SELECT DEPART.DNOMBRE #, EMPLE.OFICIO , COUNT(EMPLE.OFICIO)
FROM DEPART, EMPLE
WHERE DEPART.DEPT_NO = EMPLE.DEPT_NO 
GROUP BY DEPART.DNOMBRE , EMPLE.OFICIO 
HAVING COUNT(EMPLE.OFICIO)>2; 

/*15. Dada la tabla HERRAMIENTAS, visualizar por cada estantería la suma
de las unidades.*/

SELECT H.ESTANTERIA , SUM(H.UNIDADES)  
FROM HERRAMIENTAS H
GROUP BY H.ESTANTERIA ;

/*16. Visualizar la estantería con más unidades de la tabla HERRAMIENTAS.*/

SELECT H.ESTANTERIA 
FROM HERRAMIENTAS H
GROUP BY H.ESTANTERIA 
ORDER BY SUM(H.UNIDADES) DESC LIMIT 1;


/*17. Mostrar el número de médicos que pertenecen a cada hospital,
ordenado por número descendente de hospital.*/

SELECT H.COD_HOSPITAL , COUNT(M.DNI) 
FROM MEDICOS M, HOSPITALES H
WHERE M.COD_HOSPITAL =H.COD_HOSPITAL 
GROUP BY H.COD_HOSPITAL 
ORDER BY H.COD_HOSPITAL DESC ;

/*18. Realizar una consulta en la que se muestre por cada hospital el
nombre de las especialidades que tiene.*/

SELECT H.COD_HOSPITAL , M.ESPECIALIDAD 
FROM HOSPITALES H, MEDICOS M
WHERE H.COD_HOSPITAL =M.COD_HOSPITAL 
GROUP BY H.COD_HOSPITAL, M.ESPECIALIDAD ;

/*19. Realizar una consulta en la que aparezca por cada hospital y en cada
especialidad el número de médicos (tendrás que partir de la consulta anterior
y utilizar GROUP BY).*/

SELECT H.COD_HOSPITAL , M.ESPECIALIDAD, COUNT(M.DNI)  
FROM HOSPITALES H, MEDICOS M
WHERE H.COD_HOSPITAL =M.COD_HOSPITAL 
GROUP BY H.COD_HOSPITAL , M.ESPECIALIDAD ;


/*20. Obtener por cada hospital el número de empleados.*/

SELECT H.COD_HOSPITAL , COUNT(P.DNI) 
FROM HOSPITALES H, PERSONAS P
WHERE H.COD_HOSPITAL =P.COD_HOSPITAL 
GROUP BY H.COD_HOSPITAL ;


/*21. Obtener por cada especialidad el número de trabajadores.*/

SELECT M.ESPECIALIDAD , COUNT(M.DNI) 
FROM MEDICOS M
GROUP BY M.ESPECIALIDAD ;

/*22. Visualizar la especialidad que tenga más médicos.*/

SELECT M.ESPECIALIDAD , COUNT(M.DNI) 
FROM MEDICOS M
GROUP BY M.ESPECIALIDAD 
ORDER BY COUNT(M.DNI) DESC LIMIT 1 ;

/*23. ¿Cuál es el nombre del hospital que tiene mayor número de plazas?*/

SELECT MAX(H.NUM_PLAZAS), H.NOMBRE  
FROM HOSPITALES H
GROUP BY H.NOMBRE 
ORDER BY MAX(H.NUM_PLAZAS) DESC LIMIT 2;



/*24. Visualizar las diferentes estanterías de la tabla HERRAMIENTAS
ordenados descendentemente por estantería.*/

SELECT DISTINCT  H.ESTANTERIA 
FROM HERRAMIENTAS H
ORDER BY H.ESTANTERIA DESC ;


/*25. Averiguar cuántas unidades tiene cada estantería.*/

SELECT H.ESTANTERIA , SUM(H.UNIDADES) 
FROM HERRAMIENTAS H
GROUP BY H.ESTANTERIA ;


/*26. Visualizar las estanterías que tengan más de 15 unidades*/

SELECT H.ESTANTERIA , SUM(H.UNIDADES) 
FROM HERRAMIENTAS H
GROUP BY H.ESTANTERIA 
HAVING SUM(H.UNIDADES)>15 ;

/*27. ¿Cuál es la estantería que tiene más unidades?*/


SELECT H.ESTANTERIA , SUM(H.UNIDADES) 
FROM HERRAMIENTAS H
GROUP BY H.ESTANTERIA 
ORDER BY SUM(H.UNIDADES)  DESC LIMIT 1  ;


/*28. A partir de las tablas EMPLE y DEPART mostrar los datos del
departamento que no tiene ningún empleado.*/

SELECT *
FROM EMPLE E, DEPART D
WHERE E.DEPT_NO(+)  =D.DEPT_NO
AND E.DEPT_NO IS NULL;

/*29. Mostrar el número de empleados de cada departamento. En la salida
se debe mostrar también los departamentos que no tienen ningún
empleado.*/

SELECT COUNT(E.EMP_NO), D.DEPT_NO  
FROM EMPLE E, DEPART D
WHERE E.DEPT_NO=D.DEPT_NO 
GROUP BY D.DEPT_NO 
UNION
SELECT *
FROM EMPLE E, DEPART D
WHERE E.DEPT_NO(+) =D.DEPT_NO 
AND E.DEPT_NO IS NULL;


/*30. Obtener la suma de salarios de cada departamento, mostrando las
columnas DEPT_NO, SUMA DE SALARIOS y DNOMBRE. En el resultado
también se deben mostrar los departamentos que no tienen asignados
empleados.*/

SELECT D.DEPT_NO , SUM(E.SALARIO), D.DNOMBRE  
FROM DEPART D, EMPLE E
WHERE D.DEPT_NO =E.DEPT_NO 
GROUP BY D.DEPT_NO , D.DNOMBRE;
UNION
SELECT *
FROM EMPLE E, DEPART D
WHERE E.DEPT_NO(+) =D.DEPT_NO 
AND E.DEPT_NO IS NULL;

/*31. Utilizar la función IFNULL en la consulta anterior para que en el caso
de que un departamento no tenga empleados, aparezca como suma de
salarios el valor 0.*/

SELECT DEPART.DEPT_NO , IFNULL(SUM(EMPLE.SALARIO),0) AS SUMA_SALARIO, DEPART.DNOMBRE  
FROM DEPART LEFT JOIN EMPLE
ON DEPART.DEPT_NO = EMPLE.DEPT_NO 
GROUP BY DEPART.DEPT_NO ;

/*32. Obtener el número de médicos que pertenecen a cada hospital,
mostrando las columnas COD_HOSPITAL, NOMBRE y NÚMERO DE
MÉDICOS. En el resultado deben aparecer también los datos de los
hospitales que no tienen médicos.*/




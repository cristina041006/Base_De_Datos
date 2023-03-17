/* 1. Nombre de los trabajadores cuya tarifa este entre 10 y 12 euros*/

SELECT *
FROM TRABAJADOR t 
WHERE T.TARIFA BETWEEN 10 AND 12;

/*2. ¿Cuáles son los oficios de los trabajadores asignados al edificio 435?*/

SELECT T.OFICIO 
FROM TRABAJADOR t , ASIGNACION a 
WHERE T.ID_T =A.ID_T 
AND A.ID_E = 435;

/*3. Indicar el nombre del trabajador y el de su supervisor*/

SELECT T.NOMBRE , T2.NOMBRE 
FROM TRABAJADOR t , TRABAJADOR t2  
WHERE T.ID_T =T2.ID_SUPV ;

/* 4. Nombre de los trabajadores asignados a oficinas.*/

SELECT DISTINCT T.NOMBRE  
FROM TRABAJADOR t , ASIGNACION a, EDIFICIO e  
WHERE T.ID_T =A.ID_T 
AND A.ID_E =E.ID_E 
AND E.TIPO LIKE 'OFICINA';

/*5. ¿Qué trabajadores reciben una tarifa por hora mayor que la de su supervisor?*/
-- NO ME SALE IGUAL
SELECT *
FROM TRABAJADOR t, TRABAJADOR t2  
WHERE T.ID_T =T2.ID_SUPV 
AND T.TARIFA > T2.TARIFA ;

/*6. ¿Cuál es el número total de días que se han dedicado a fontanería en el edificio 312?*/
-- NO SALE IGUAL
SELECT SUM(A.NUM_DIAS) 
FROM TRABAJADOR t , ASIGNACION a , EDIFICIO e 
WHERE T.ID_T =A.ID_T 
AND A.ID_E =E.ID_E 
AND T.OFICIO LIKE 'FONTANERO'
AND E.ID_E = 312;

/* 7. ¿Cuántos tipos de oficios diferentes hay?*/
-- NO SALE IGUAL
SELECT COUNT(DISTINCT T.OFICIO) 
FROM TRABAJADOR t ;

/* 8. Para cada supervisor, ¿Cuál es la tarifa por hora más alta que se paga a un trabajador
que informa a esesupervisor?*/


/* 9. Para cada supervisor que supervisa a más de un trabajador, ¿cuál es la tarifa más alta
que se para a un trabajador que informa a ese supervisor?*/

/*10. Para cada tipo de edificio, ¿Cuál es el nivel de calidad medio de los edificios con
categoría 1? Considérense sólo aquellos tipos de edificios que tienen un nivel de calidad
máximo no mayor que 3.
*/

SELECT DISTINCT E.TIPO , E.NIVEL_CALIDAD 
FROM EDIFICIO e 
WHERE E.CATEGORIA =1
AND E.NIVEL_CALIDAD <=3;

/*11. ¿Qué trabajadores reciben una tarifa por hora menor que la del promedio?*/

SELECT AVG(T.TARIFA), T.NOMBRE 
FROM TRABAJADOR t 
HAVING AVG(T.TARIFA)<T.TARIFA 
GROUP BY T.NOMBRE, T.TARIFA  ;

/*12. ¿Qué trabajadores reciben una tarifa por hora menor que la del promedio de los
trabajadores que tienen su mismo oficio?*/

SELECT AVG(T.TARIFA), T.NOMBRE 
FROM TRABAJADOR t , TRABAJADOR t2
WHERE T.OFICIO LIKE T2.OFICIO 
HAVING AVG(T.TARIFA)<T.TARIFA 
GROUP BY T.NOMBRE, T.TARIFA  ;

/*13. ¿Qué trabajadores reciben una tarifa por hora menor que la del promedio de los
trabajadores que dependen del mismo supervisor que él?*/

SELECT AVG(T.TARIFA), T.NOMBRE 
FROM TRABAJADOR t , TRABAJADOR t2
WHERE T.ID_SUPV  LIKE T2.ID_SUPV  
HAVING AVG(T.TARIFA)<T.TARIFA 
GROUP BY T.NOMBRE, T.TARIFA  ;

/*14. Seleccione el nombre de los electricistas asignados al edificio 435 y la fecha en la que
empezaron a trabajar enél.*/

SELECT T.NOMBRE , A.FECHA_INICIO 
FROM TRABAJADOR t , ASIGNACION a 
WHERE T.ID_T =A.ID_T 
AND T.OFICIO LIKE 'ELECTRICISTA'
AND A.ID_E =435;

SELECT t.nombre, to_char(a.fecha_inicio,'YYYY-MM-DD') AS FECHA_INICIO
FROM trabajador t, asignacion a
WHERE t.id_t = a.id_t
AND UPPER(t.oficio) LIKE 'ELECTRICISTA'
AND a.id_e = 435;

/* 15. ¿Qué supervisores tienen trabajadores que tienen una tarifa por hora por encima de
los 12 euros?*/

SELECT DISTINCT  T.NOMBRE 
FROM TRABAJADOR t , TRABAJADOR t2 
WHERE T.ID_SUPV =T.ID_T 
AND T2.TARIFA >12;


SELECT distinct(T.nombre) 
	from trabajador t, trabajador T2
	where T.ID_T = T2.ID_SUPV 
	AND T2.tarifa > '12' 
	and T2.nombre not in (select nombre from trabajador 
						 WHERE id_t = id_supv)








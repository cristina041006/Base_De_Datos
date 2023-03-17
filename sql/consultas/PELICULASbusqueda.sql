/* 1. Obtén las diferentes ciudades donde hay cines*/

SELECT C.CIUDAD_CINE 
FROM CINE c ;

/* 2. Obtener las películas con un presupuesto mayor de 2000 o cuya duración sea superior a 100.*/

SELECT *
FROM PELICULA p 
WHERE (P.PRESUPUESTO >2000) OR (P.DURACION >100);

/*3. Obtener las películas cuyo título (da igual el original o el español) contenga la cadena la sin
importar que esté en mayúsculas o minúsculas.*/

SELECT *
FROM PELICULA p 
WHERE (UPPER(P.TITULO_P) LIKE '%LA%') OR (UPPER(P.TITULO_S) LIKE '%LA%'); 

/* 4. Obtener el nombre y la nacionalidad de los personajes que sean hombres ordenado por
nacionalidad y nombre.*/

SELECT P.NOMBRE_PERSONA , P.NACIONALIDAD_PERSONA 
FROM PERSONAJE p 
WHERE P.SEXO_PERSONA LIKE 'H'
ORDER BY P.NACIONALIDAD_PERSONA , P.NOMBRE_PERSONA ;

/* 5. Obtener las películas estrenadas en el mes de septiembre.*/

SELECT P.TITULO_P 
FROM PELICULA p , PROYECCION p2 
WHERE P.CIP =P2.CIP 
AND (EXTRACT (MONTH FROM P2.FECHA_ESTRENO)) = 09;

/* 6. Obtener las diferentes tareas que ha desempeñado alguna persona alguna vez.*/

SELECT DISTINCT T.TAREA 
FROM TRABAJO t;

/* 7. Obtener el numero de sala y el aforo de todas las salas de los cines que terminen en vocal*/

SELECT S.SALA , S.AFORO 
FROM SALA s 
WHERE (UPPER(S.CINE) LIKE '%A') OR  UPPER(S.CINE) LIKE '%A' OR  UPPER(S.CINE) LIKE '%A' OR  UPPER(S.CINE) LIKE '%A' OR  UPPER(S.CINE) LIKE '%A';

/*8. Obtener las distintas ciudades que tienen cines con alguna sala con aforo superior a 100 */

SELECT DISTINCT  C.CIUDAD_CINE 
FROM CINE c , SALA s 
WHERE C.CINE =S.CINE 
AND S.AFORO >100
ORDER BY C.CIUDAD_CINE DESC;

/* 9. Obtener los títulos (ambos) y la nacionalidad de las películas que hayan obtenido una
recaudación en alguna sala 10000 mayor que su presupuesto ordenadas de mayor a menor
beneficio.*/

SELECT P.TITULO_P , P.TITULO_S , P.NACIONALIDAD
FROM PELICULA p , PROYECCION p2 
WHERE P.CIP =P2.CIP 
AND (P2.RECAUDACION - P.PRESUPUESTO)>10000
ORDER BY (P2.RECAUDACION-P.PRESUPUESTO) DESC;

/* 10. Obtener el nombre de los actores hombres que participen en la película Viaje al centro de la
tierra.*/

SELECT P.NOMBRE_PERSONA 
FROM PERSONAJE p , TRABAJO t  , PELICULA p3 
WHERE P.NOMBRE_PERSONA =T.NOMBRE_PERSONA 
AND T.CIP =P3.CIP 
AND P.SEXO_PERSONA LIKE 'H'
AND UPPER(T.TAREA) LIKE '%ACTOR%'
AND P3.TITULO_S LIKE 'Viaje al centro de la tierra';

/* 11. Obtener el nombre del cine y el número de películas diferentes estrenadas por cada cine
ordenadas por el número de películas ordenadas de mayor a menor.*/

SELECT P.CINE , COUNT(DISTINCT P.CIP)
FROM PROYECCION p
GROUP BY P.CINE 
ORDER BY COUNT(P.CIP) DESC ;

/*12. Obtener el nombre y nacionalidad de las personas que hayan trabajado en alguna película de
diferente nacionalidad a la suya.*/ 

SELECT P.NOMBRE_PERSONA , P.NACIONALIDAD_PERSONA 
FROM PERSONAJE p , TRABAJO t , PELICULA p2 
WHERE P.NOMBRE_PERSONA =T.NOMBRE_PERSONA 
AND T.CIP =P2.CIP 
AND P.NACIONALIDAD_PERSONA NOT LIKE P2.NACIONALIDAD ;

/*13. Obtener por cada cine, el nombre, las salas y el nombre de la película.*/

SELECT P.CINE , P.SALA , P2.TITULO_P 
FROM PROYECCION p , PELICULA p2 
WHERE P.CIP =P2.CIP 


/* 14. Obtener la recaudación total de cada cine ordenada de mayor a menor recaudación total.*/

SELECT SUM(P.RECAUDACION)
FROM PROYECCION p 
GROUP BY P.CINE 
ORDER BY SUM(P.RECAUDACION) DESC ;

/*15. Obtener aquellas personas que hayan realizado una tarea cuyo sexo sea diferente al suyo,
teniendo en cuenta que para productor y director no hay un sexo definido.*/

SELECT * 
FROM PERSONAJE p , TRABAJO t , TAREA t2 
WHERE P.NOMBRE_PERSONA=T.NOMBRE_PERSONA 
AND T.TAREA =T2.TAREA 
AND (T2.SEXO_TAREA NOT LIKE 'N') 
AND (T2.SEXO_TAREA NOT LIKE P.SEXO_PERSONA);

SELECT PERSONAJE.NOMBRE_PERSONA
FROM PERSONAJE, TRABAJO, TAREA 
WHERE PERSONAJE.NOMBRE_PERSONA = TRABAJO.NOMBRE_PERSONA 
AND TRABAJO.TAREA = TAREA.TAREA
AND TAREA.SEXO_TAREA != PERSONAJE.SEXO_PERSONA;

/* 16. Obtener el título, al año de producción, el presupuesto y la recaudación total de las películas
que han sido proyectadas en algún cine de la ciudad de Córdoba*/

SELECT PELICULA.TITULO_P, PELICULA.ANO_PRODUCCION, PELICULA.PRESUPUESTO, SUM(PROYECCION.RECAUDACION)
FROM PELICULA, PROYECCION, SALA, CINE
WHERE PELICULA.CIP = PROYECCION.CIP 
AND PROYECCION.CINE = SALA.CINE
AND PROYECCION.SALA = SALA.SALA
AND SALA.CINE = CINE.CINE
AND CINE.CIUDAD_CINE LIKE 'Cordoba'
GROUP BY PELICULA.TITULO_P, PELICULA.ANO_PRODUCCION, PELICULA.PRESUPUESTO;

/*17. Obtener el título de las películas cuya recaudación por espectador (con 2 decimales) sea
mayor de 700.*/

SELECT P.TITULO_P , (P2.RECAUDACION / P2.ESPECTADORES )
FROM PELICULA p , PROYECCION p2 
WHERE P.CIP =P2.CIP 
AND (P2.RECAUDACION / P2.ESPECTADORES )>700;

SELECT P.TITULO_P,ROUND(P2.RECAUDACION / P2.ESPECTADORES , 2) AS RECAUDACION_POR_ESPEC
FROM PELICULA p , PROYECCION p2 
WHERE P.CIP =P2.CIP 
AND (P2.RECAUDACION / P2.ESPECTADORES )>700;

/*18. Obtener el nombre de los actores que han participado en más de 2 películas*/
















--1 Para cada titulación ordenar por coste mostrando primero las asignaturas más caras y para las asignaturas del 
--mismo coste mostrar por orden alfabético de nombre de asignatura. 


SELECT A.IDTITULACION, T.NOMBRE,  A.COSTEBASICO  
FROM ASIGNATURA A, TITULACION T
WHERE A.IDTITULACION = T.IDTITULACION  ORDER BY A.COSTEBASICO DESC, A.NOMBRE;  

/* 2 Mostrar el nombre y los apellidos de los profesores.
 */

SELECT P.NOMBRE, P.APELLIDO  
FROM PERSONA P, PROFESOR PR
WHERE P.DNI = PR.DNI; 

-- 3. Mostrar el nombre de las asignaturas impartidas por profesores de Sevilla. 

SELECT A.NOMBRE 
FROM ASIGNATURA A, PROFESOR P, PERSONA PER
WHERE A.IDPROFESOR =P.IDPROFESOR AND PER.DNI =P.DNI AND PER.CIUDAD LIKE 'Sevilla';

--4 Mostrar el nombre y los apellidos de los alumnos.

SELECT P.NOMBRE, P.APELLIDO  
FROM PERSONA P, ALUMNO A 
WHERE P.DNI =A.DNI; 

--5 Mostrar el DNI, nombre y apellidos de los alumnos que viven en Sevilla. 

SELECT P.NOMBRE, P.APELLIDO, A.DNI  
FROM PERSONA P, ALUMNO A 
WHERE P.DNI =A.DNI AND P.CIUDAD LIKE 'Sevilla';

--6 Mostrar el DNI, nombre y apellidos de los alumnos matriculados en la asignatura "Seguridad Vial". 

SELECT P.NOMBRE, P.APELLIDO, A.DNI  
FROM PERSONA P, ALUMNO A, ASIGNATURA AI, ALUMNO_ASIGNATURA AA 
WHERE P.DNI =A.DNI AND A.IDALUMNO =AA.IDALUMNO AND AA.IDASIGNATURA = AI.IDASIGNATURA AND AI.NOMBRE LIKE 'Seguridad Vial';


/*
 * 7. Mostrar el Id de las titulaciones en las que está matriculado el 
 * alumno con DNI 20202020A. Un alumno está matriculado en una titulación si está matriculado en una asignatura de la titulación.
 */

SELECT T.IDTITULACION  
FROM TITULACION T, ASIGNATURA A, ALUMNO_ASIGNATURA AA, ALUMNO AL
WHERE T.IDTITULACION = A.IDTITULACION AND A.IDASIGNATURA =AA.IDASIGNATURA AND AA.IDALUMNO = AL.IDALUMNO AND AL.DNI LIKE '20202020A';

-- 8. Obtener el nombre de las asignaturas en las que está matriculada Rosa Garcia.

SELECT A.NOMBRE 
FROM ASIGNATURA A, ALUMNO_ASIGNATURA AA, ALUMNO AL, PERSONA P
WHERE A.IDASIGNATURA =AA.IDASIGNATURA AND AA.IDALUMNO = AL.IDALUMNO AND AL.DNI =P.DNI AND P.NOMBRE LIKE 'Rosa' AND P.APELLIDO LIKE 'Garcia';

--9 Obtener el DNI de los alumnos a los que le imparte clase el profesor Jorge Saenz.

SELECT  A.DNI  
FROM ALUMNO A, ALUMNO_ASIGNATURA AA, ASIGNATURA AI, PROFESOR P, PERSONA PR
WHERE A.IDALUMNO = AA.IDALUMNO 
AND AA.IDASIGNATURA =AI.IDASIGNATURA 
AND AI.IDPROFESOR = P.IDPROFESOR 
AND P.DNI =PR.DNI 
AND PR.NOMBRE  LIKE 'Jorge' 
AND PR.APELLIDO LIKE 'Saenz';

-- 10 Obtener el DNI, nombre y apellido de los alumnos a los que imparte clase el profesor Jorge Sáenz. 

SELECT p1.DNI, p1.NOMBRE, p1.APELLIDO
FROM PERSONA p1, PERSONA p2, ALUMNO, ALUMNO_ASIGNATURA, ASIGNATURA, PROFESOR
WHERE ALUMNO.DNI = p1.DNI
AND ALUMNO.IDALUMNO = ALUMNO_ASIGNATURA.IDALUMNO 
AND ALUMNO_ASIGNATURA.IDASIGNATURA = ASIGNATURA.IDASIGNATURA 
AND ASIGNATURA.IDPROFESOR = PROFESOR.IDPROFESOR 
AND PROFESOR.DNI = p2.DNI
AND p2.NOMBRE LIKE 'Jorge'
AND p2.APELLIDO LIKE 'Saenz';

-- 11 Mostrar el nombre de las titulaciones que tengan al menos una asignatura de 4 créditos. 

SELECT T.NOMBRE 
FROM ASIGNATURA A, TITULACION T
WHERE A.IDTITULACION = T.IDTITULACION AND A.CREDITOS = 4;

-- 12 Mostrar el nombre y los créditos de las asignaturas del primer cuatrimestre junto con 
-- el nombre de la titulación a la que pertenecen.

SELECT A.NOMBRE, A.CREDITOS, T.NOMBRE  
FROM ASIGNATURA A, TITULACION T
WHERE A.IDTITULACION =T.IDTITULACION AND A.CUATRIMESTRE =1;

/*
 * 13. Mostrar el nombre y el coste básico de las asignaturas de más de 4,5 créditos junto
 *  con el nombre de las personas matriculadas
 */

SELECT A.NOMBRE, A.COSTEBASICO, P.NOMBRE  
FROM ASIGNATURA A, ALUMNO_ASIGNATURA AA, ALUMNO AL, PERSONA P
WHERE A.IDASIGNATURA = AA.IDASIGNATURA 
AND AA.IDALUMNO =AL.IDALUMNO 
AND AL.DNI =P.DNI
AND A.CREDITOS >4.5;

/*
 * 14 Mostrar el nombre de los profesores que imparten asignaturas con coste entre 25 y 35 euros,
 *  ambos incluidos
 */

SELECT PR.NOMBRE 
FROM ASIGNATURA A, PROFESOR P, PERSONA PR
WHERE A.IDPROFESOR =P.IDPROFESOR 
AND P.DNI =PR.DNI 
AND A.COSTEBASICO  BETWEEN 25 AND 35;

/*
 *  15 Mostrar el nombre de los alumnos matriculados en la asignatura '150212' 
 *  ó en la '130113' ó en ambas.
 */

SELECT P.NOMBRE 
FROM ALUMNO A, PERSONA P, ALUMNO_ASIGNATURA AA
WHERE P.DNI =A.DNI 
AND A.IDALUMNO =AA.IDALUMNO 
AND (AA.IDASIGNATURA  LIKE '150212' OR AA.IDASIGNATURA  LIKE '130113');

/*
 * 16 Mostrar el nombre de las asignaturas del 2º cuatrimestre que no sean de 6 créditos, 
 * junto con el nombre de la titulación a la que pertenece.
 */

SELECT A.NOMBRE , T.NOMBRE 
FROM ASIGNATURA A, TITULACION T
WHERE A.IDTITULACION = T.IDTITULACION 
AND A.CUATRIMESTRE =2
AND A.CREDITOS !=6;

/*
 * 17. Mostrar el nombre y el número de horas de todas las asignaturas. (1cred.=10 horas) 
 * junto con el dni de los alumnos que están matriculados.
 */

SELECT A.NOMBRE , A.CREDITOS*10 AS HORAS , AL.DNI 
FROM ASIGNATURA A, ALUMNO_ASIGNATURA AA, ALUMNO AL
WHERE A.IDASIGNATURA =AA.IDASIGNATURA 
AND AA.IDALUMNO =AL.IDALUMNO;

/*
 * 18. Mostrar el nombre de todas las mujeres que viven en “Sevilla” y 
 * que estén matriculados de alguna asignatura
 */

SELECT P.NOMBRE 
FROM PERSONA P, ALUMNO A, ALUMNO_ASIGNATURA AA 
WHERE P.DNI = A.DNI 
AND A.IDALUMNO =AA.IDALUMNO 
AND P.VARON =0
AND P.CIUDAD LIKE 'Sevilla';

/*
 * 19. Mostrar el nombre de la asignatura de primero y que lo imparta el profesor con identificador p101.
 */

SELECT A.NOMBRE 
FROM ASIGNATURA A, PROFESOR P
WHERE A.IDPROFESOR =P.IDPROFESOR 
AND P.IDPROFESOR LIKE 'P101';


/*
 * 20. Mostrar el nombre de los alumnos que se ha matriculado tres o más veces en alguna asignatura.
 * 
 */

SELECT P.NOMBRE 
FROM ALUMNO A, PERSONA P, ALUMNO_ASIGNATURA AA
WHERE P.DNI =A.DNI 
AND A.IDALUMNO  =AA.IDALUMNO
AND AA.NUMEROMATRICULA >=3;

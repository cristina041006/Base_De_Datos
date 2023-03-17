/*     1. Mostrar el identificador de los alumnos matriculados en cualquier asignatura excepto la '150212' y la '130113'.*/

SELECT A.IDALUMNO 
FROM ALUMNO a, ALUMNO_ASIGNATURA aa  
WHERE A.IDALUMNO = AA.IDALUMNO 
AND AA.IDASIGNATURA IN (
						SELECT A.IDASIGNATURA  
						FROM ASIGNATURA a
						WHERE A.IDASIGNATURA NOT IN ('150212', '130113')

);

--solucion maestra

select distinct(idalumno)
from alumno_asignatura
where idalumno not IN(
						select idalumno 
						from alumno_asignatura
						where idasignatura = '150212' or idasignatura = '130113'
);


/*    2. Mostrar el nombre de las asignaturas que tienen más créditos que "Seguridad Vial".*/ 


SELECT A.NOMBRE 
FROM ASIGNATURA a
WHERE A.CREDITOS > (
					SELECT A.CREDITOS 
					FROM ASIGNATURA a 
					WHERE A.NOMBRE LIKE 'Seguridad Vial'

);



/*    3. Obtener el Id de los alumnos matriculados en las asignaturas "150212" y "130113" a la vez. */

SELECT A.IDALUMNO 
FROM ALUMNO a, ALUMNO_ASIGNATURA aa 
WHERE AA.IDASIGNATURA = ALL (
							SELECT A.IDASIGNATURA  
							FROM ASIGNATURA a 
							WHERE A.IDASIGNATURA IN ('150212', '130113')

);


--solucion maestra

select distinct(idalumno)
from alumno_asignatura
where idalumno in (select idalumno from alumno_asignatura where idasignatura='150212')
And idalumno in (select idalumno from alumno_asignatura where idasignatura='130113');

/*    4. Mostrar el Id de los alumnos matriculados en las asignatura "150212" ó "130113", en una o en otra pero no en ambas a la vez. */

SELECT A.IDALUMNO 
FROM ALUMNO a, ALUMNO_ASIGNATURA aa 
WHERE AA.IDASIGNATURA = ANY (
							SELECT A.IDASIGNATURA  
							FROM ASIGNATURA a 
							WHERE A.IDASIGNATURA LIKE '150212'
							OR A.IDASIGNATURA LIKE '130113'
);

-- solucion 

select distinct(idalumno)
from alumno_asignatura
where (idasignatura = 130113 and idalumno not in
(select idalumno from alumno_asignatura where idasignatura=150212))
Or
(idasignatura = 150212 and idalumno not in
(select idalumno from alumno_asignatura where idasignatura=130113));


/*   5. Mostrar el nombre de las asignaturas de la titulación "130110" cuyos costes básicos sobrepasen el coste básico promedio por asignatura en esa titulación.*/


--solucion

select nombre
from asignatura a
where costebasico>(select avg(nvl(a.costebasico,0)) from asignatura a
				where idtitulacion='130110')
	   and idtitulacion='130110';


/*    6. Mostrar el identificador de los alumnos matriculados en cualquier asignatura excepto la "150212" y la "130113”*/

select distinct(idalumno)
from alumno_asignatura
where idalumno not IN(
						select idalumno 
						from alumno_asignatura
						where idasignatura = '150212' or idasignatura = '130113'
);


/*    7. Mostrar el Id de los alumnos matriculados en la asignatura "150212" pero no en la "130113". */

SELECT A.IDALUMNO 
FROM ALUMNO a, ALUMNO_ASIGNATURA aa  
WHERE A.IDALUMNO = AA.IDALUMNO 
AND AA.IDASIGNATURA IN (
						SELECT A.IDASIGNATURA  
						FROM ASIGNATURA a
						WHERE A.IDASIGNATURA IN ('150212')

)AND AA.IDASIGNATURA NOT IN (
						SELECT A.IDASIGNATURA  
						FROM ASIGNATURA a
						WHERE A.IDASIGNATURA IN ('130113')

);

--solucion

select idalumno
from alumno_asignatura
where idasignatura = '150212'
	and idalumno not in(SELECT idalumno
			from alumno_asignatura
			where  idasignatura = '130113');

/*    8. Mostrar el nombre de las asignaturas que tienen más créditos que "Seguridad Vial". */

SELECT A.NOMBRE 
FROM ASIGNATURA a
WHERE A.CREDITOS > (
					SELECT A.CREDITOS 
					FROM ASIGNATURA a 
					WHERE A.NOMBRE LIKE 'Seguridad Vial'

);


--opcional

select distinct(nombre)
from asignatura
where creditos>(select creditos
			from asignatura
			where ltrim(lower(nombre))='seguridad vial'); --para quitar los espacios de la izquierda y que lo coga en masyuscula

/*    9. Mostrar las personas que no son ni profesores ni alumnos.*/


SELECT *
FROM PERSONA p
WHERE P.DNI NOT IN (
					SELECT DISTINCT  P.DNI 
					FROM PERSONA p , ALUMNO a, PERSONA p2 , PROFESOR p3  
					WHERE P.DNI = A.DNI 
					AND P2.DNI =P3.DNI
);


--select * from persona
where dni not in(select dni from alumno )
and dni not in(select dni from profesor);
 

/*    10. Mostrar el nombre de las asignaturas que tengan más créditos.*/

SELECT *
FROM (
		SELECT A.NOMBRE 
		FROM ASIGNATURA a
		ORDER BY A.CREDITOS DESC
)
WHERE ROWNUM=1;

--solucion 

select  nombre
from asignatura
where creditos = (select max(creditos)
                from asignatura);
/*    11. Lista de asignaturas en las que no se ha matriculado nadie. */


SELECT *
FROM ALUMNO_ASIGNATURA aa , ALUMNO a 
WHERE AA.IDALUMNO (+) = A.IDALUMNO 
AND AA.IDASIGNATURA IS NULL;

--solucion 

SELECT NOMBRE 
FROM ASIGNATURA 
WHERE IDASIGNATURA NOT IN(SELECT IDASIGNATURA
						FROM ALUMNO_ASIGNATURA);

/*    12. Ciudades en las que vive algún profesor y también algún alumno. */


SELECT DISTINCT P.CIUDAD 
FROM PERSONA p 
WHERE P.CIUDAD = ANY (
						SELECT DISTINCT P.CIUDAD 
						FROM PERSONA p , ALUMNO a
						WHERE P.DNI = A.DNI
)AND P.CIUDAD = ANY (
						SELECT DISTINCT P.CIUDAD 
						FROM PERSONA p , PROFESOR p2 
						WHERE P.DNI =P2.DNI 
); 




--solucion 

select distinct(p.ciudad)
from persona p, persona p1
where  p.dni in(select dni from alumno)
and p1.dni in(select dni from profesor)
and p.ciudad=p1.ciudad;








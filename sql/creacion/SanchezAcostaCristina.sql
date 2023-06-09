/* 1.*/

SELECT P.NOMBRE , P.APELLIDOS 
FROM PERSONAS p 
WHERE EXTRACT(YEAR FROM P.FECHA_NACIMIENTO)>0079
ORDER BY P.FECHA_NACIMIENTO DESC;

/* 2. */

SELECT DISTINCT C.CODCABALLO
FROM CABALLOS c , PARTICIPACIONES p 
WHERE C.CODCABALLO =P.CODCABALLO 
AND P.POSICIONFINAL <=3
ORDER BY C.CODCABALLO ;

/* 3. */

SELECT *
FROM CARRERAS c 
WHERE C.IMPORTEPREMIO >50000;

/* 4. */

SELECT DISTINCT C.NOMBRE , C.DNI 
FROM CLIENTES c , APUESTAS a , CABALLOS cb, PERSONAS p 
WHERE C.DNI =A.DNICLIENTE 
AND A.CODCABALLO =CB.CODCABALLO 
AND CB.PROPIETARIO = P.CODIGO 
AND (P.NOMBRE LIKE 'Jose' 
OR P.NOMBRE LIKE 'Inmaculada');

/* 5. */

SELECT C.NOMBRE , C.DNI , c.NACIONALIDAD 
FROM CLIENTES c 
WHERE C.NACIONALIDAD NOT IN ('Britanico', 'Britanica')
AND C.NACIONALIDAD NOT IN ('Escoces', 'Escocesa');


/* 6. SE QUE SE PUEDE HACER CON MONTHNAME YA QUE ME DICES EL MES CON NOMBRE PERO ME DA ERROR*/

SELECT C.PROPIETARIO , C.NOMBRE
FROM CABALLOS c 
WHERE (EXTRACT (MONTH FROM C.FECHANACIMIENTO)= 11) 
OR (C.PESO >= 260)
ORDER BY C.PROPIETARIO , C.NOMBRE; 

/* 7. */

SELECT P.NOMBRE 
FROM PERSONAS p 
WHERE P.NOMBRE LIKE '%J%'
AND P.NOMBRE LIKE '%e%';


/* 8. */

SELECT C.CODCABALLO 
FROM CABALLOS c , PARTICIPACIONES p 
WHERE C.CODCABALLO = P.CODCABALLO
AND P.POSICIONFINAL = 1
GROUP BY C.CODCABALLO 
HAVING COUNT(P.CODCARRERA) > 1 ;


/* 9. */

SELECT * FROM (
			SELECT C.DNI 
			FROM CLIENTES c , APUESTAS a 
			WHERE C.DNI = A.DNICLIENTE 
			GROUP BY C.DNI 
			ORDER BY COUNT(A.CODCARRERA) DESC
) WHERE ROWNUM=1;

/* 10. */

SELECT P2.NOMBRE , COUNT(DISTINCT P.CODCABALLO)AS CABALLOS_MONTADOS 
FROM PARTICIPACIONES p , PERSONAS p2 
WHERE P.JOCKEY =P2.CODIGO 
GROUP BY P2.NOMBRE
ORDER BY COUNT(DISTINCT P.CODCABALLO) DESC, P2.NOMBRE ;

/* 11. */

SELECT P2.NOMBRE , P2.APELLIDOS , C.NOMBRE 
FROM PARTICIPACIONES p , PERSONAS p2 , CABALLOS c
WHERE P.JOCKEY =P2.CODIGO 
AND P.CODCABALLO =C.CODCABALLO
AND P.POSICIONFINAL = 1;


/* 12. */ 

SELECT C.NOMBRECARRERA , C2.NOMBRE , A.IMPORTE 
FROM CARRERAS c , APUESTAS a , CLIENTES c2 
WHERE C.CODCARRERA = A.CODCARRERA 
AND A.DNICLIENTE =C2.DNI 
AND A.IMPORTE > C.APUESTALIMITE ;

/*13*/

SELECT P.NOMBRE || ' ' || P.APELLIDOS AS NOMBRE_Y_APELLIDO, C.NOMBRE AS NOMBRE_CABALLO
FROM CABALLOS c , PERSONAS p, PARTICIPACIONES p2  
WHERE C.PROPIETARIO = P.CODIGO 
AND C.CODCABALLO = P2.CODCABALLO 
GROUP BY P.NOMBRE || ' ' || P.APELLIDOS , C.NOMBRE
HAVING COUNT(P2.CODCARRERA)>2; 

/* 14. */

SELECT cb.NOMBRE AS NOMBRE_CABALLO, pp.NOMBRE AS NOMBRE_PROPIETARIO, pj.NOMBRE AS NOMBRE_JOCKER, c.NOMBRECARRERA
FROM CARRERAS c , PARTICIPACIONES par , CABALLOS cb , PERSONAS pj , PERSONAS pp 
WHERE c.CODCARRERA = par.CODCARRERA 
AND par.JOCKEY =pj.CODIGO 
AND par.CODCABALLO = cb.CODCABALLO 
AND cb.PROPIETARIO = pp.CODIGO
AND EXTRACT (YEAR FROM C.FECHAHORA) = 2009
AND EXTRACT (MONTH FROM C.FECHAHORA) = 07
AND EXTRACT (DAY FROM C.FECHAHORA) = 12; 

/* 15. */ 

SELECT C.NOMBRE , C.NACIONALIDAD 
FROM CLIENTES c , APUESTAS a 
WHERE C.DNI = A.DNICLIENTE 
GROUP BY C.NOMBRE , C.NACIONALIDAD
HAVING SUM(A.IMPORTE)> 800;

/* 16. */

SELECT *
FROM CLIENTES c , APUESTAS a 
WHERE C.DNI= A.DNICLIENTE(+)
AND A.DNICLIENTE IS NULL;


  

/*     1. Muestra el nombre de las empresas productoras de Huelva o Málaga ordenadas por el nombre en orden alfabético inverso.*/

SELECT E.NOMBRE_EMPRESA 
FROM EMPRESAPRODUCTORA e
WHERE (E.CIUDAD_EMPRESA LIKE 'Huelva')
OR (E.CIUDAD_EMPRESA LIKE 'Malaga')
ORDER BY E.NOMBRE_EMPRESA DESC ;


/*    2. Mostrar los nombres de los destinos cuya ciudad contenga una b mayúscula o minúscula.*/

SELECT D.NOMBRE_DESTINO 
FROM DESTINO d 
WHERE UPPER(D.CIUDAD_DESTINO) LIKE '%B%';

/*    3. Obtener el código de los residuos con una cantidad superior a 4 del constituyente 116.*/

SELECT RC.COD_RESIDUO 
FROM RESIDUO_CONSTITUYENTE rc   
WHERE RC.CANTIDAD>4
AND RC.COD_CONSTITUYENTE =116

/*    4. Muestra el tipo de transporte, los kilómetros y el coste de los traslados realizados en diciembre de 1994.*/

--CREAR UNA VISTA

CREATE /*OR REPACE*/ VIEW RESUMEN 
(TIPO_TRANSPORTE, KMS, COSTE)
AS (
SELECT T.TIPO_TRANSPORTE , T.KMS , T.COSTE 
FROM TRASLADO t 
WHERE EXTRACT (YEAR FROM T.FECHA_ENVIO)=1994
AND EXTRACT (MONTH FROM T.FECHA_ENVIO)=12

);

SELECT * FROM RESUMEN r ;

SELECT T.TIPO_TRANSPORTE , T.KMS , T.COSTE 
FROM TRASLADO t 
WHERE EXTRACT (YEAR FROM T.FECHA_ENVIO)=1994
AND EXTRACT (MONTH FROM T.FECHA_ENVIO)=12;

--OTRA SOLUCION POSIBLE

SELECT TIPO_TRANSPORTE, KMS, COSTE
FROM TRASLADO
WHERE TO_DATE(FECHA_ENVIO, 'YYYY-MM') = TO_DATE('1994-12', 'YYYY-MM');

/*    5. Mostrar el código del residuo y el número de constituyentes de cada residuo.*/

SELECT RC.COD_RESIDUO , RC.CANTIDAD 
FROM RESIDUO_CONSTITUYENTE rc; 

--solucion´

SELECT RC.COD_RESIDUO , COUNT(RC.COD_CONSTITUYENTE)
FROM RESIDUO_CONSTITUYENTE rc 
GROUP BY RC.COD_RESIDUO ;

/*    6. Mostrar la cantidad media de residuo vertida por las empresas durante el año 1994.*/

SELECT NVL(AVG(NVL(RE.CANTIDAD,0)),0)
FROM RESIDUO_EMPRESA re 
WHERE EXTRACT (YEAR FROM RE.FECHA)=1994; 

/*    7. Mostrar el mayor número de kilómetros de un traslado realizado el mes de marzo.*/

SELECT MAX(T.KMS)
FROM TRASLADO t 
WHERE EXTRACT (MONTH FROM T.FECHA_ENVIO) =3; 

/*    8. Mostrar el número de constituyentes distintos que genera cada empresa, mostrando también el nif de 
 * la empresa, para aquellas empresas que generen más de 4 constituyentes.*/

SELECT COUNT(DISTINCT RESIDUO_CONSTITUYENTE.COD_CONSTITUYENTE), RESIDUO_EMPRESA.NIF_EMPRESA
FROM RESIDUO_EMPRESA, RESIDUO, RESIDUO_CONSTITUYENTE
WHERE RESIDUO_EMPRESA.COD_RESIDUO = RESIDUO.COD_RESIDUO
AND RESIDUO.COD_RESIDUO = RESIDUO_CONSTITUYENTE.COD_RESIDUO
GROUP BY RESIDUO_EMPRESA.NIF_EMPRESA
HAVING COUNT(RESIDUO_CONSTITUYENTE.COD_CONSTITUYENTE)>4

/*    9. Mostrar el nombre de las diferentes empresas que han enviado residuos que contenga la palabra metales en su descripción.*/

SELECT DISTINCT E.NOMBRE_EMPRESA 
FROM EMPRESAPRODUCTORA e , RESIDUO_EMPRESA re , RESIDUO r 
WHERE E.NIF_EMPRESA = RE.NIF_EMPRESA 
AND RE.COD_RESIDUO = R.COD_RESIDUO 
AND R.OD_RESIDUO LIKE '%metales%';

/*    10. Mostrar el número de envíos que se han realizado entre cada ciudad, indicando también la ciudad origen y la ciudad destino.*/

SELECT COUNT(T.FECHA_ENVIO), D.CIUDAD_DESTINO, E.CIUDAD_EMPRESA 
FROM DESTINO d , TRASLADO t , EMPRESAPRODUCTORA e
WHERE D.COD_DESTINO =T.COD_DESTINO 
AND T.NIF_EMPRESA = E.NIF_EMPRESA
GROUP BY D.CIUDAD_DESTINO, E.CIUDAD_EMPRESA;  

/*    11. Mostrar el nombre de la empresa transportista que ha transportado para una empresa que esté en Málaga o en Huelva un residuo que contenga Bario o Lantano. Mostrar también la fecha del transporte.*/

SELECT DISTINCT E.NOMBRE_EMPTRANSPORTE , t.FECHA_ENVIO 
FROM EMPRESATRANSPORTISTA e , TRASLADO t , EMPRESAPRODUCTORA e2 , RESIDUO r , RESIDUO_CONSTITUYENTE rc , CONSTITUYENTE c
WHERE E.NIF_EMPTRANSPORTE = T.NIF_EMPTRANSPORTE 
AND T.NIF_EMPRESA = E2.NIF_EMPRESA 
AND T.COD_RESIDUO = R.COD_RESIDUO 
AND R.COD_RESIDUO = RC.COD_RESIDUO 
AND RC.COD_CONSTITUYENTE = C.COD_CONSTITUYENTE
AND E2.CIUDAD_EMPRESA IN ('Huelva', 'Malaga')
--AND((E2.CIUDAD_EMPRESA LIKE 'Huelva')
--OR (E2.CIUDAD_EMPRESA LIKE 'Malaga'))
--AND ((C.NOMBRE_CONSTITUYENTE LIKE 'Bario')
--OR (C.NOMBRE_CONSTITUYENTE LIKE 'Lantano'));
AND C.NOMBRE_CONSTITUYENTE  IN ('Bario', 'Lantano');


/*    12. Mostrar el coste por kilómetro del total de traslados encargados por la empresa productora Carbonsur.*/

SELECT SUM(T.COSTE)/SUM(T.KMS)
FROM TRASLADO t , EMPRESAPRODUCTORA e 
WHERE T.NIF_EMPRESA  = E.NIF_EMPRESA 
AND E.NOMBRE_EMPRESA  LIKE 'Carbonsur';

/*    13. Mostrar el número de constituyentes de cada residuo.*/

SELECT COUNT(RC.CANTIDAD), RC.COD_RESIDUO 
FROM RESIDUO_CONSTITUYENTE rc 
GROUP BY RC.COD_RESIDUO ;

/*    14. Mostrar la descripción de los residuos y la fecha que se
 *  generó el residuo, para aquellos residuos que se han generado 
 * en los últimos 30 días por una empresa cuyo nombre tenga una c. 
 * La consulta debe ser válida para cualquier fecha y el listado debe 
 * aparecer ordenado por la descripción del residuo y la fecha.*/

SELECT R.OD_RESIDUO , RE.FECHA  
FROM RESIDUO_EMPRESA re , EMPRESAPRODUCTORA e , RESIDUO r 
WHERE RE.NIF_EMPRESA = E.NIF_EMPRESA 
AND RE.COD_RESIDUO = R.COD_RESIDUO 
AND RE.FECHA > SYSDATE -30
AND E.NOMBRE_EMPRESA LIKE '%c%'
ORDER BY R.OD_RESIDUO, RE.FECHA;  

--ADD MOTHN(SYSDATE, 3)

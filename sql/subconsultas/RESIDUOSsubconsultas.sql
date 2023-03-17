/*     1. Teniendo en cuenta los residuos generados por todas las empresas, mostrar el código del residuo que más se ha generado por todas ellas.*/



SELECT RE.CANTIDAD 
FROM RESIDUO_EMPRESA re 
GROUP BY RE.COD_RESIDUO 
HAVING (MAX(RE.CANTIDAD));

--S

SELECT RE.COD_RESIDUO 
FROM RESIDUO_EMPRESA re 
WHERE CANTIDAD = (SELECT MAX(CANTIDAD) 
FROM RESIDUO_EMPRESA re2)


       
/*    2. Mostrar el nombre dela empresa transportista que sólo trabajó para la empresa con nif R-12356711-Q*/


SELECT E2.NOMBRE_EMPTRANSPORTE  
FROM EMPRESATRANSPORTISTA e2 
WHERE E2.NIF_EMPTRANSPORTE  IN  (
								SELECT DISTINCT T.NIF_EMPTRANSPORTE 
								FROM EMPRESAPRODUCTORA e , TRASLADO t
								WHERE E.NIF_EMPRESA = T.NIF_EMPRESA 
								AND E.NIF_EMPRESA LIKE 'R-12356711-Q'
);

       
/*    3. Mostrar el nombre de la empresa transportitas que realizó el primer transporte que está registrado en la base de datos.*/

SELECT E.NOMBRE_EMPTRANSPORTE 
FROM EMPRESATRANSPORTISTA e , (
		SELECT T.NIF_EMPTRANSPORTE  
		FROM TRASLADO t 
		ORDER BY T.FECHA_ENVIO 
)WHERE ROWNUM = 1;


--ALTERNATIVA

SELECT EMPRESATRANSPORTISTA.NOMBRE_EMPTRANSPORTE
FROM EMPRESATRANSPORTISTA, TRASLADO
WHERE EMPRESATRANSPORTISTA.NIF_EMPTRANSPORTE = TRASLADO.NIF_EMPTRANSPORTE
AND TRASLADO.FECHA_ENVIO = (SELECT MIN(FECHA_ENVIO)
  						  FROM TRASLADO);
   
/*    4. Mostrar todas las características de los traslados, para aquellos traslados cuyo coste sea superior a la media de todos los traslados.*/

SELECT * 
FROM TRASLADO t 
WHERE T.COSTE > (
				SELECT AVG(NVL(T.COSTE, 0))
				FROM TRASLADO t
);

 
       
/*    5. Obtener el nombre de las ciudades más cercanas entre las que se ha realizado un envío.*/


SELECT DISTINCT  D.CIUDAD_DESTINO 
FROM DESTINO d , TRASLADO t 
WHERE D.COD_DESTINO =T.COD_DESTINO 
AND T.KMS = (
			SELECT MIN(T.KMS) 
			FROM TRASLADO t
);


--S

SELECT DISTINCT  EMPRESAPRODUCTORA.CIUDAD_EMPRESA, DESTINO.CIUDAD_DESTINO
FROM EMPRESAPRODUCTORA, TRASLADO, DESTINO
WHERE EMPRESAPRODUCTORA.NIF_EMPRESA = TRASLADO.NIF_EMPRESA
AND TRASLADO.COD_DESTINO = DESTINO.COD_DESTINO
AND TRASLADO.KMS =(SELECT MIN(KMS)
  				  FROM TRASLADO)

       
 /*   6. Obtener el nombre de las empresas que nunca han utilizado el Ferrocarril como medio de transporte.*/


SELECT E.NOMBRE_EMPRESA
FROM EMPRESAPRODUCTORA e  
WHERE E.NIF_EMPRESA NOT IN (
					SELECT T.NIF_EMPRESA 
					FROM TRASLADO t 
					WHERE T.TIPO_TRANSPORTE LIKE 'Ferrocarril'
);

SELECT DISTINCT E.NOMBRE_EMPRESA
FROM EMPRESAPRODUCTORA e , TRASLADO t2 
WHERE E.NIF_EMPRESA =T2.NIF_EMPRESA 
AND T2.TIPO_TRANSPORTE  NOT IN (
					SELECT T.TIPO_TRANSPORTE  
					FROM TRASLADO t 
					WHERE T.TIPO_TRANSPORTE LIKE 'Ferrocarril'
);
       
/*    7. Obtener el nombre de la empresa que ha realizado más envíos a Madrid.*/

SELECT E.NOMBRE_EMPRESA 
FROM TRASLADO t , EMPRESAPRODUCTORA e 
WHERE T.NIF_EMPRESA = E.NIF_EMPRESA  
HAVING COUNT(DISTINCT T.COD_DESTINO) IN (
										SELECT COUNT(DISTINCT D.COD_DESTINO) 
										FROM DESTINO d , TRASLADO t 
										WHERE D.COD_DESTINO =T.COD_DESTINO  
										AND TRIM(D.CIUDAD_DESTINO)  LIKE 'Madrid'
										GROUP BY T.NIF_EMPRESA 
);


       
/*    8. Vamos a crear una nueva tabla llamada envios, que tendrá un campo llamdo Ciudad_destino, otro
       llamado ciudad_origen, y otro cantidad_total, en la que guardaremos donde van los residuos.
        La primary key de la tabla debe ser ciudad_destino y ciudad_origen, así podremos evitar que metan dos registros con la misma ciudad destino y origen.
       Cargar dicha tabla con los registros oportunos según nuestra base de datos, teniendo en cuenta que en cantidad total se debe guardar el total de las 
       cantidades que se ha enviado desde ciudad_origen a ciudad_destino*/



       
 /*   9. Vamos a modificar la tabla residuo para añadir un nuevo campo llamado num_constituyentes. Una vez hayas añadido el nuevo campo crea la sentencia sql necesaria para que este campo tomen los valores adecuados.*/
      


/*    10. Modifica la tabla empresaproductora añadiendo un campo nuevo llamado nif, que es el nif de la empresa matriz, es decir, 
 *  de la que depende, por lo que este nuevo campo será una fk sobre el campo nif_empresa. Mostrar un listado en donde salga el nombre
 *  de la empresa matriz y el nombre de la empresa de la que depende ordenado por empresa matriz. El nuevo campo llamado nif tomará valores 
 * nulos cuando se trate de una empresa que no depende de nadie. No es necesario hacer los cambios, sólo la consulta.
*/
       
/* Número de clientes que tienen alguna factura con IVA 16%.*/

SELECT COUNT(F2.CODCLI)
FROM FACTURAS f2  
WHERE F2.CODFAC IN (
		SELECT F.CODFAC  
		FROM FACTURAS f
		WHERE F.IVA = 16

);

/*Número de clientes que no tienen ninguna factura con un 16% de IVA.*/

SELECT COUNT(F2.CODCLI)
FROM FACTURAS f2  
WHERE F2.CODFAC NOT IN (
		SELECT F.CODFAC  
		FROM FACTURAS f
		WHERE F.IVA = 16

);

/*Número de clientes que en todas sus facturas tienen un 16% de IVA (los clientes deben tener al menos una factura).*/

SELECT COUNT(F2.CODCLI)
FROM FACTURAS f2  
WHERE F2.CODFAC = ANY ( /*porque es al menos 1 una factura*/
		SELECT F.CODFAC  
		FROM FACTURAS f
		WHERE F.IVA = 16

);

/*Fecha de la factura con mayor importe (sin tener en cuenta descuentos ni impuestos).*/


SELECT F.FECHA  
FROM LINEAS_FAC lf , FACTURAS f 
WHERE LF.CODFAC = F.CODFAC 
GROUP BY LF.CODFAC , F.FECHA 
HAVING SUM(LF.PRECIO)  =(
		SELECT MAX(SUM(LF2.PRECIO)) /*se cpge la suma eñ mayor importe*/ 
		FROM LINEAS_FAC lf2 
		GROUP BY LF2.CODFAC 
);

/*Número de pueblos en los que no tenemos clientes.*/

SELECT COUNT(C.CODPUE) 
FROM CLIENTES c
WHERE C.CODPUE NOT IN (
					SELECT C.CODPUE 
					FROM CLIENTES c 
);


/*Número de artículos cuyo stock supera las 20 unidades, con precio superior a 15 euros y de los que no hay ninguna factura en el último trimestre del año pasado.*/

SELECT COUNT(A.CODART) 
FROM ARTICULOS a , LINEAS_FAC lf 
WHERE A.CODART = lf.CODART 
AND A.STOCK > 20
AND A.PRECIO > 15
AND LF.CODFAC NOT IN (
			SELECT F.CODFAC 
			FROM FACTURAS f  
			WHERE EXTRACT (YEAR FROM F.FECHA) = EXTRACT (YEAR FROM SYSDATE)-1
			AND EXTRACT(MONTH FROM F.FECHA)>9
);


/*Obtener el número de clientes que en todas las facturas del año pasado NO han pagado IVA (no se ha pagado IVA si es cero o nulo).*/


SELECT COUNT(C.CODCLI) 
FROM CLIENTES c , FACTURAS f 
WHERE F.CODCLI =C.CODCLI 
AND F.CODCLI IN (
		SELECT F.CODFAC 
		FROM FACTURAS f 
		WHERE (F.IVA IS NULL) OR (F.IVA =0)

)
AND EXTRACT (YEAR FROM F.FECHA) = EXTRACT (YEAR FROM SYSDATE)-1;

/*Clientes (código y nombre) que fueron preferentes durante el mes de noviembre del año pasado y que en diciembre de ese mismo año no tienen ninguna factura. Son clientes preferentes de un mes aquellos que han solicitado más de 60,50 euros en facturas durante ese mes, sin tener en cuenta descuentos ni impuestos.*/


SELECT C.CODCLI , C.NOMBRE 
FROM CLIENTES c , FACTURAS f , LINEAS_FAC lf
WHERE C.CODCLI = F.CODCLI 
AND F.CODFAC = LF.CODFAC 
AND LF.PRECIO >60.50
AND EXTRACT(MONTH FROM F.FECHA)>10
AND EXTRACT (YEAR FROM F.FECHA) = EXTRACT (YEAR FROM SYSDATE)-1
AND F.CODFAC IN (
				SELECT CODCLI
			   	FROM FACTURAS
			   	WHERE CODFAC IS NULL
					  
);


/*Código, descripción y precio de los diez artículos más caros. */


SELECT *
FROM (	SELECT A.CODART 
		FROM ARTICULOS a
		ORDER BY A.PRECIO )
WHERE ROWNUM <11;



/*Nombre de la provincia con mayor número de clientes.*/


SELECT *
FROM (	SELECT P.NOMBRE
		FROM PROVINCIAS p , PUEBLOS p2 , CLIENTES c 
		WHERE P.CODPRO = P2.CODPRO
		AND P2.CODPUE = C.CODPUE
		GROUP BY P.NOMBRE
		ORDER BY COUNT(C.CODCLI) DESC )
WHERE ROWNUM =1;

/*Código y descripción de los artículos cuyo precio es mayor de 90,15 euros y se han vendido menos de 10 unidades (o ninguna) durante el año ppasado.*/

SELECT DISTINCT ARTICULOS.CODART , ARTICULOS.DESCRIP
FROM ARTICULOS, LINEAS_FAC, FACTURAS
WHERE ARTICULOS.CODART = LINEAS_FAC.CODART
AND LINEAS_FAC.CODFAC = FACTURAS.CODFAC
AND EXTRACT (YEAR FROM FECHA)=EXTRACT (YEAR FROM SYSDATE)-1
AND ARTICULOS.CODART IN (SELECT DISTINCT CODART
   					  FROM LINEAS_FAC
   					  WHERE (CANT<10 AND CANT>=0)
   					  AND PRECIO>90.15);

/*Código y descripción de los artículos cuyo precio es más de tres mil veces mayor que el precio mínimo de cualquier artículo. */

 
SELECT A.CODART , A.DESCRIP 
FROM ARTICULOS a 
WHERE A.PRECIO > (3000* (SELECT MIN(PRECIO)
						FROM ARTICULOS a2 ));


/*Nombre del cliente con mayor facturación.*/

/*Código y descripción de aquellos artículos con un precio superior a la media y que hayan sido comprados por más de 5 clientes.
*/
SELECT ARTICULOS.CODART, ARTICULOS.DESCRIP
FROM ARTICULOS, LINEAS_FAC, FACTURAS
WHERE ARTICULOS.CODART = LINEAS_FAC.CODART
AND LINEAS_FAC.CODFAC = FACTURAS.CODFAC
AND ARTICULOS.PRECIO >(SELECT AVG(NVL (PRECIO,0))
   					   FROM LINEAS_FAC)
GROUP BY ARTICULOS.CODART, ARTICULOS.DESCRIP
HAVING COUNT(FACTURAS.CODCLI)>5 ;












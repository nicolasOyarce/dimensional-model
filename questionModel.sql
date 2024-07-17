--1. Cual es la cantidad de unidades de peliculas arrendadas desde el 24 de julio hasta el 24 de diciembre del 2005
SELECT
	DT.ANNIO AS ANNIO,
	DT.MES AS MES,
	DT.DIA AS DIA,
	SUM(FR.UNIDADES) as TOTAL_UNIDADES
FROM FACT_RENTAL FR
	JOIN DIM_TIEMPO DT ON FR.ID_TIEMPO = DT.ID_TIEMPO
WHERE DT.ANNIO = 2005
	AND ((DT.MES = 7 AND DT.DIA >= 24)
	OR (DT.MES BETWEEN 8 AND 11)
	OR (DT.MES = 12 AND DT.DIA <= 24))
GROUP BY ANNIO, MES, DIA
ORDER BY MES;
	
-- 2. Cual fue la cantidad de unidades de peliculas arrendadas de la categoria "Family" durante el mes de julio de 2005?
SELECT 
	DC.CATEGORIA AS CATEGORIA,
	DT.ANNIO AS ANNIO,
	DT.MES AS MES,
	SUM(FR.UNIDADES) AS TOTAL_UNIDADES
FROM FACT_RENTAL FR
	JOIN DIM_TIEMPO DT ON FR.ID_TIEMPO = DT.ID_TIEMPO
	JOIN DIM_CATEGORIA DC ON FR.ID_CATEGORIA = DC.ID_CATEGORIA
WHERE DT.ANNIO = 2005
	AND DT.MES = 7
	AND DC.CATEGORIA = 'Family'
GROUP BY DC.CATEGORIA, ANNIO, MES;

-- 3. Cuantas unidades de peliculas arrendadas con idioma ingles y de la categoria "games" se realizaron en la Tienda 1, en el mes julio del 2005
SELECT 
	FR.ID_TIENDA,
	DC.CATEGORIA AS CATEGORIA,
	DL.LENGUAJE AS LENGUAJE,
	DT.ANNIO AS ANNIO,
	DT.MES AS MES,
	SUM(FR.UNIDADES) AS TOTAL_UNIDADES
FROM FACT_RENTAL FR
	JOIN DIM_TIEMPO DT ON FR.ID_TIEMPO = DT.ID_TIEMPO
	JOIN DIM_CATEGORIA DC ON FR.ID_CATEGORIA = DC.ID_CATEGORIA
	JOIN DIM_LENGUAJE DL ON FR.ID_LENGUAJE = DL.ID_LENGUAJE
WHERE DT.ANNIO = 2005
	AND DT.MES = 7
	AND DC.CATEGORIA = 'Games'
	AND DL.LENGUAJE = 'English'
	AND FR.ID_TIENDA = 1
GROUP BY FR.ID_TIENDA, DC.CATEGORIA, DL.LENGUAJE, ANNIO, MES;

-- 4. Cantidad de unidades de peliculas arrendadas de la categoria "Horror" por tienda durante el mes de Agosto de 2005
SELECT 
	FR.ID_TIENDA, 
	DC.CATEGORIA AS CATEGORIA,
	DT.ANNIO AS ANNIO,
	DT.MES AS MES,
	SUM(FR.UNIDADES) AS TOTAL_UNIDADES
FROM FACT_RENTAL FR
	JOIN DIM_TIEMPO DT ON FR.ID_TIEMPO = DT.ID_TIEMPO
	JOIN DIM_CATEGORIA DC ON FR.ID_CATEGORIA = DC.ID_CATEGORIA
WHERE DT.ANNIO = 2005
	AND DT.MES = 8
	AND DC.CATEGORIA = 'Horror'
GROUP BY FR.ID_TIENDA, CATEGORIA, ANNIO, MES;

-- 5. Cantidad de unidades de peliculas de la categoria "Music" en la Tienda 2, entre junio y agosto del 2005
SELECT 
	FR.ID_TIENDA AS TIENDA,
	DC.CATEGORIA AS CATEGORIA,
	DT. MES AS MES,
	DT.ANNIO AS ANNIO,
	SUM(FR.UNIDADES) AS TOTAL_UNIDADES
FROM FACT_RENTAL FR
	JOIN DIM_TIEMPO DT ON FR.ID_TIEMPO = DT.ID_TIEMPO
	JOIN DIM_CATEGORIA DC ON FR.ID_CATEGORIA = DC.ID_CATEGORIA
WHERE DT.ANNIO = 2005
	AND DT.MES BETWEEN 6 AND 8
	AND DC.CATEGORIA = 'Music'
	AND FR.ID_TIENDA = 2
GROUP BY FR.ID_TIENDA, CATEGORIA, MES, ANNIO;

-- 6. Cantidad de unidades de peliculas arrendadas de la categoria "Sports" en Australia durante agosto de 2005
SELECT 
	DD.PAIS AS PAIS,
	DC.CATEGORIA AS CATEGORIA,
	DT.ANNIO AS ANNIO,
	DT.MES AS MES,
	SUM(FR.UNIDADES) as TOTAL_UNIDADES
FROM FACT_RENTAL FR
	JOIN DIM_TIEMPO DT ON FR.ID_TIEMPO = DT.ID_TIEMPO
	JOIN DIM_CATEGORIA DC ON FR.ID_CATEGORIA = DC.ID_CATEGORIA
	JOIN DIM_DIRECCION DD ON FR.ID_DIRECCION = DD.ID_DIRECCION
WHERE DT.ANNIO = 2005
	AND DT.MES = 8
	AND DC.CATEGORIA = 'Sports'
	AND DD.PAIS = 'Australia'
GROUP BY PAIS, CATEGORIA, ANNIO, MES;

-- 7. Cantidad de unidades de peliculas arrendadas entre 2005 y 2006 con idioma Ingles
SELECT 
	DL.LENGUAJE AS LENGUAJE,
	DT.ANNIO AS ANNIO,
	SUM(FR.UNIDADES) AS TOTAL_UNIDADES
FROM FACT_RENTAL FR
	JOIN DIM_TIEMPO DT ON FR.ID_TIEMPO = DT.ID_TIEMPO
	JOIN DIM_LENGUAJE DL ON FR.ID_LENGUAJE = DL.ID_LENGUAJE
WHERE DT.ANNIO IN (2005, 2006)
	AND DL.LENGUAJE = 'English'
GROUP BY LENGUAJE, ANNIO;

-- 8. Peliculas arrendadas en 2005 con costo de reemplazo entre 15 y 25 dolares
SELECT 
	DP.remplazar_costo,
	DT.ANNIO AS ANNIO,
	SUM(FR.UNIDADES) AS TOTAL_UNIDADES
FROM FACT_RENTAL FR
	JOIN DIM_TIEMPO DT ON FR.ID_TIEMPO = DT.ID_TIEMPO
	JOIN DIM_PELICULA DP ON FR.ID_PELICULA = DP.ID_FILM
WHERE DT.ANNIO = 2005
	AND DP.remplazar_costo BETWEEN 15 AND 25
GROUP BY DP.remplazar_costo, ANNIO;

-- 9. Peliculas arrendadas en la tienda 1 en 2005 entre enero y septiembre
SELECT 
	FR.ID_TIENDA,
	DT.ANNIO AS ANNIO,
	DT.MES AS MES,
	SUM(FR.UNIDADES) AS TOTAL_UNIDADES
FROM FACT_RENTAL FR
	JOIN DIM_TIEMPO DT ON FR.ID_TIEMPO = DT.ID_TIEMPO
WHERE DT.ANNIO = 2005
	AND DT.MES BETWEEN 1 AND 9
	AND FR.ID_TIENDA = 1
GROUP BY FR.ID_TIENDA, ANNIO, MES;

-- 10. Monto total de ingresos por alquileres en la tienda 1 durante mayo de 2005
SELECT 
	DTT.ID_TIENDA,
	DT.ANNIO AS ANNIO,
	DT.MES AS MES,
	SUM(FR.DINERO) as TotalIngresos
FROM FACT_RENTAL FR
	JOIN DIM_TIEMPO DT ON FR.ID_TIEMPO = DT.ID_TIEMPO
	JOIN DIM_TIENDA DTT ON FR.ID_TIENDA = DTT.ID_TIENDA
WHERE DT.ANNIO = 2005
	AND DT.MES = 5
	AND DTT.ID_TIENDA = 1
GROUP BY DTT.ID_TIENDA, ANNIO, MES;

-- 11. Cantidad promedio de dias de alquiler para peliculas de "Action" de abril a junio de 2005
SELECT 
	DC.CATEGORIA AS CATEGORIA,
	DT.ANNIO AS ANNIO,
	DT.MES AS MES,
	AVG(CAST(FR.UNIDADES AS FLOAT)) AS PROMEDIO_DIAS_ALQUILER
FROM FACT_RENTAL FR
	JOIN DIM_TIEMPO DT ON FR.ID_TIEMPO = DT.ID_TIEMPO
	JOIN DIM_CATEGORIA DC ON FR.ID_CATEGORIA = DC.ID_CATEGORIA	
WHERE DT.ANNIO = 2005
	AND DT.MES BETWEEN 4 AND 6
	AND DC.CATEGORIA = 'Action'
GROUP BY CATEGORIA, ANNIO, MES;

-- 12. Categoria mas alquilada por clientes de idioma ingles en 2006
SELECT TOP 1
	DC.CATEGORIA, 
	DT.ANNIO,
	DL.LENGUAJE AS LENGUAJE,
	COUNT(*) AS TOTAL_UNIDADES
FROM FACT_RENTAL FR
	JOIN DIM_TIEMPO DT ON FR.ID_TIEMPO = DT.ID_TIEMPO
	JOIN DIM_CATEGORIA DC ON FR.ID_CATEGORIA = DC.ID_CATEGORIA
	JOIN DIM_LENGUAJE DL ON FR.ID_LENGUAJE = DL.ID_LENGUAJE
WHERE DT.ANNIO = 2006
	AND DL.LENGUAJE = 'English'
GROUP BY DC.CATEGORIA, DT.ANNIO, DL.LENGUAJE;

-- 13. Costo promedio de reemplazo de peliculas alquiladas por clientes con mas de 5 annios de registro en 2005
SELECT 
	DT.ANNIO AS ANNIO,
	AVG(DP.remplazar_costo) AS PROMEDIO_COSTO_REMPLAZO
FROM FACT_RENTAL FR
	JOIN DIM_TIEMPO DT ON FR.ID_TIEMPO = DT.ID_TIEMPO
	JOIN DIM_CLIENTE DC ON FR.ID_CLIENTE = DC.ID_CLIENTE
	JOIN DIM_PELICULA DP ON FR.ID_PELICULA = DP.ID_FILM
WHERE DT.ANNIO = 2005
	AND DATEDIFF(YEAR, DC.CREAR_DATOS, DT.ID_TIEMPO) > 5
GROUP BY ANNIO;

-- 14. Top 5 clientes con mayores ingresos por alquiler entre 2005 y 2006
SELECT TOP 5 
	DC.ID_CLIENTE, 
	DC.NOMBRE, 
	DC.APELLIDO,
	DT.ANNIO,
	SUM(FR.DINERO) AS TOTAL_INGRESOS
FROM FACT_RENTAL FR
	JOIN DIM_TIEMPO DT ON FR.ID_TIEMPO = DT.ID_TIEMPO
	JOIN DIM_CLIENTE DC ON FR.ID_CLIENTE = DC.ID_CLIENTE
WHERE DT.ANNIO IN (2005, 2006)
GROUP BY DC.ID_CLIENTE, DC.NOMBRE, DC.APELLIDO, DT.ANNIO;	

-- 15. Ingreso total por alquileres de peliculas de "Horror" en la tienda 2 durante 2005
SELECT 
	FR.ID_TIENDA,
	DC.CATEGORIA AS CATEGORIA,
	DT.ANNIO AS ANNIO,
	SUM(FR.DINERO) AS TOTAL_INGRESOS
FROM FACT_RENTAL FR
	JOIN DIM_CATEGORIA DC ON FR.ID_CATEGORIA = DC.ID_CATEGORIA
	JOIN DIM_TIEMPO DT ON FR.ID_TIEMPO = DT.ID_TIEMPO
WHERE DC.CATEGORIA = 'Horror'
	AND FR.ID_TIENDA = 2
	AND DT.ANNIO = 2005
GROUP BY FR.ID_TIENDA, CATEGORIA, ANNIO;

-- 16. Ingreso total por alquileres de todas las peliculas en la tienda 2 durante 2005
SELECT 
	FR.ID_TIENDA AS TIENDA,
	DT.ANNIO AS ANNIO,
	SUM(FR.DINERO) AS TOTAL_INGRESOS
FROM FACT_RENTAL FR
	JOIN DIM_TIEMPO DT ON FR.ID_TIEMPO = DT.ID_TIEMPO
WHERE DT.ANNIO = 2005
	AND FR.ID_TIENDA = 2
GROUP BY ID_TIENDA, ANNIO;

-- 17. Unidades de peliculas alquiladas a clientes con mas de 1 annio de registro durante 2005
SELECT 
	DT.ANNIO AS ANNIO,
	DC.CREAR_DATOS,
	SUM(FR.UNIDADES) AS TOTAL_UNIDADES
FROM FACT_RENTAL FR
	JOIN DIM_CLIENTE DC ON FR.ID_CLIENTE = DC.ID_CLIENTE
	JOIN DIM_TIEMPO DT ON FR.ID_TIEMPO = DT.ID_TIEMPO
WHERE DATEDIFF(YEAR, DC.CREAR_DATOS, GETDATE()) > 1
	AND DT.ANNIO = 2005
GROUP BY DC.CREAR_DATOS, ANNIO;

-- 18. Unidades de peliculas de "Animacion" alquiladas por clientes de habla inlgesa en 2005
SELECT 
	DC.CATEGORIA AS CATEGORIA,
	DL.LENGUAJE AS LENGUAJE,
	DT.ANNIO AS ANNIO,
	SUM(FR.UNIDADES) AS TOTAL_UNIDADES
FROM FACT_RENTAL FR
	JOIN DIM_TIEMPO DT ON FR.ID_TIEMPO = DT.ID_TIEMPO
	JOIN DIM_CATEGORIA DC ON FR.ID_CATEGORIA = DC.ID_CATEGORIA
	JOIN DIM_LENGUAJE DL ON FR.ID_LENGUAJE = DL.ID_LENGUAJE
WHERE DT.ANNIO = 2005
	AND DC.CATEGORIA = 'Animation'
	AND DL.LENGUAJE = 'English'
GROUP BY CATEGORIA, LENGUAJE, ANNIO;

-- 19. Ingreso total por arriendos de peliculas de "Viajes" en la tienda 1 durante el 2005 y 2006
SELECT 
	FR.ID_TIENDA AS TIENDA,
	DC.CATEGORIA AS CATEGORIA,
	DT.ANNIO AS ANNIO,
	SUM(FR.DINERO) AS TOTAL_INGRESOS
FROM FACT_RENTAL FR
	JOIN DIM_TIEMPO DT ON FR.ID_TIEMPO = DT.ID_TIEMPO
	JOIN DIM_CATEGORIA DC ON FR.ID_CATEGORIA = DC.ID_CATEGORIA
WHERE DT.ANNIO = 2005
	AND DC.CATEGORIA = 'Travel'
	AND FR.ID_TIENDA = 1
GROUP BY FR.ID_TIENDA, CATEGORIA, ANNIO;

-- 20. Cantidad de unidades de peliculas arrendadas por dia durante mayo de 2005
SELECT 
	DT.ANNIO AS ANNIO, 
	DT.MES AS MES,
	DT.DIA AS DIA ,
	SUM(FR.UNIDADES) AS TOTAL_UNIDADES
FROM FACT_RENTAL FR
	JOIN DIM_TIEMPO DT ON FR.ID_TIEMPO = DT.ID_TIEMPO
WHERE DT.ANNIO = 2005
	AND DT.MES = 5
GROUP BY ANNIO, MES, DIA;

-- 21. Total de ingresos por arriendos de peliculas de "Action" en Lethbridge, Canada durante los ultimos 6 meses de 2005
SELECT
	DD.PAIS AS PAIS,
	DD.CIUDAD AS CIUDAD,
	DC.CATEGORIA AS CATEGORIA,
	DT.ANNIO AS ANNIO,
	DT.MES AS MES,
	SUM(FR.DINERO) AS TOTAL_INGRESOS
FROM FACT_RENTAL FR
	JOIN DIM_TIEMPO DT ON FR.ID_TIEMPO = DT.ID_TIEMPO
	JOIN DIM_CATEGORIA DC ON FR.ID_CATEGORIA = DC.ID_CATEGORIA
	JOIN DIM_DIRECCION DD ON FR.ID_DIRECCION = DD.ID_DIRECCION
WHERE DT.ANNIO = 2005
	 AND DT.MES BETWEEN 6 AND 12
	 AND DC.CATEGORIA = 'Action'
	 AND DD.CIUDAD = 'Lethbridge'
	 AND DD.PAIS = 'Canada'
GROUP BY PAIS, CIUDAD, CATEGORIA, ANNIO, MES;
GO
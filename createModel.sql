--DIM_PELICULA
CREATE TABLE DIM_PELICULA (
    ID_FILM INT PRIMARY KEY,
    REMPLAZAR_COSTO DECIMAL(10,2)
);

SELECT 
    F.film_id AS ID_FILM, 
    F.replacement_cost AS REMPLAZAR_COSTO
FROM SAKILA.DBO.film AS F
GROUP BY F.film_id, F.replacement_cost;


--DIM_CATEGORIA
CREATE TABLE DIM_CATEGORIA (
    ID_CATEGORIA INT PRIMARY KEY,
    CATEGORIA VARCHAR(255)
);

SELECT 
    C.category_id AS ID_CATEGORIA, 
    C.name AS CATEGORIA
FROM SAKILA.DBO.category AS C
GROUP BY C.category_id, C.NAME;


--DIM_CLIENTE
CREATE TABLE DIM_CLIENTE (
    ID_CLIENTE INT PRIMARY KEY,
    NOMBRE VARCHAR(50),
    APELLIDO VARCHAR(50),
    CREAR_DATOS DATETIME
);

SELECT 
	CL.customer_id AS ID_CLIENTE, 
	CL.first_name AS NOMBRE,
	CL.last_name AS APELLIDO,
	CL.create_date AS CREAR_DATOS
FROM sakila.DBO.customer AS CL
GROUP BY CL.customer_id, CL.first_name, CL.last_name,CL.create_date;


--DIM_TIENDA
CREATE TABLE DIM_TIENDA (
    ID_TIENDA INT PRIMARY KEY
);

SELECT 
	S.store_id AS ID_TIENDA
FROM SAKILA.DBO.store AS S 
GROUP BY S.store_id;


--DIM_DIRECCION
CREATE TABLE DIM_DIRECCION (
	ID_DIRECCION INT PRIMARY KEY,
	ID_CIUDAD INT,
	CIUDAD VARCHAR(100),
	ID_PAIS INT,
	PAIS VARCHAR(100),
);

SELECT
	DI.address_id AS ID_DIRECCION,
	CI.city_id AS ID_CIUDAD, 
	CI.city AS CIUDAD, 
	P.country_id AS ID_PAIS , 
	P.country AS PAIS 
FROM SAKILA.DBO.address AS DI
	INNER JOIN SAKILA.DBO.city AS CI ON DI.city_id = CI.city_id
	INNER JOIN SAKILA.DBO.country AS P ON CI.country_id = P.country_id 
GROUP BY DI.address_id, CI.city_id, Ci.city, P.country_id, P.country;


--DIM_LENGUAJE
CREATE TABLE DIM_LENGUAJE (
    ID_LENGUAJE INT PRIMARY KEY,
    LENGUAJE VARCHAR(50)
);

SELECT 
    L.language_id AS ID_LENGUAJE, 
    L.name AS LENGUAJE
FROM SAKILA.DBO.language AS L
GROUP BY L.language_id, L.name;


--DIM_TIEMPO
CREATE TABLE DIM_TIEMPO (
    ID_TIEMPO DATE PRIMARY KEY,
    ANNIO INT,
    MES INT,
    DIA INT
);

SELECT 
    CONVERT(DATE, r.rental_date) AS id_tiempo, 
    YEAR(r.rental_date) AS annio,
    MONTH(r.rental_date) AS mes,
    DAY(r.rental_date) AS dia
FROM 
    sakila.dbo.rental AS r
GROUP BY 
    CONVERT(DATE, r.rental_date), 
    YEAR(r.rental_date), 
    MONTH(r.rental_date), 
    DAY(r.rental_date);


--FACT_RENTAL
CREATE TABLE [dbo].[FACT_RENTAL] (
    ID_CATEGORIA INT,
    ID_PELICULA INT,
    ID_TIENDA INT,
    ID_LENGUAJE INT,
    ID_DIRECCION INT,
    ID_CLIENTE INT,
    ID_TIEMPO DATE,
    UNIDADES INT,
    DINERO DECIMAL(10, 2),
    PRIMARY KEY (ID_CATEGORIA, ID_PELICULA, ID_TIENDA, ID_LENGUAJE, ID_DIRECCION, ID_CLIENTE, ID_TIEMPO)
);

SELECT 
    C.category_id AS ID_CATEGORIA,
    F.film_id AS ID_PELICULA,
    S.store_id AS ID_TIENDA,
    L.language_id AS ID_LENGUAJE,
    CI.city_id AS ID_Direccion,
    CU.customer_id AS ID_Cliente,
    CONVERT(date, R.rental_date) AS ID_TIEMPO,
    COUNT(F.film_id) AS UNIDADES,
    SUM(P.amount) AS DINERO
FROM sakila.DBO.rental AS R 
    INNER JOIN sakila.DBO.inventory AS I ON R.inventory_id = I.inventory_id
    INNER JOIN sakila.DBO.film AS F ON I.film_id = F.film_id
    INNER JOIN sakila.DBO.film_category AS FC ON F.film_id = FC.film_id
    INNER JOIN sakila.DBO.category AS C ON FC.category_id = C.category_id
    INNER JOIN sakila.DBO.language AS L ON F.language_id = L.language_id
    INNER JOIN sakila.DBO.staff AS ST ON R.staff_id = ST.staff_id
    INNER JOIN sakila.DBO.store AS S ON ST.store_id = S.store_id
    INNER JOIN sakila.DBO.customer AS CU ON S.store_id = CU.store_id
    INNER JOIN sakila.DBO.address AS A ON ST.address_id = A.address_id
    INNER JOIN sakila.DBO.city AS CI ON A.city_id = CI.city_id
    INNER JOIN sakila.DBO.country AS CO ON CI.country_id = CO.country_id
    INNER JOIN sakila.DBO.payment AS P ON R.rental_id = P.rental_id
GROUP BY 
    C.category_id, F.film_id, S.store_id, L.language_id, CI.city_id, CU.customer_id, CONVERT(date, R.rental_date);

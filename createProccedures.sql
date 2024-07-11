--PA PELICULA
CREATE PROCEDURE [dbo].[CARGA_DIM_PELICULA] 
AS
BEGIN
    DECLARE @aux INT;
    SET @aux = (SELECT COUNT(*) FROM [MODELO_DIMENSIONAL].[dbo].DIM_PELICULA);

    IF @aux > 0
    BEGIN 
        DELETE FROM [MODELO_DIMENSIONAL].[dbo].DIM_PELICULA;
        INSERT INTO [dbo].DIM_PELICULA (ID_FILM, REMPLAZAR_COSTO)
            SELECT 
                F.film_id AS ID_FILM, 
                F.replacement_cost AS REMPLAZAR_COSTO
            FROM SAKILA.DBO.film AS F
            GROUP BY F.film_id, F.replacement_cost;
    END
    ELSE 
    BEGIN
        INSERT INTO [dbo].DIM_PELICULA (ID_FILM, REMPLAZAR_COSTO)
            SELECT 
                F.film_id AS ID_FILM, 
                F.replacement_cost AS REMPLAZAR_COSTO
            FROM SAKILA.DBO.film AS F
            GROUP BY F.film_id, F.replacement_cost;
    END 
END
GO

--PA CATEGORIA
CREATE PROCEDURE [dbo].[CARGA_DIM_CATEGORIA] 
AS
BEGIN
    DECLARE @aux INT;
    SET @aux = (SELECT COUNT(*) FROM [MODELO_DIMENSIONAL].[dbo].DIM_CATEGORIA);

    IF @aux > 0
    BEGIN 
        DELETE FROM [MODELO_DIMENSIONAL].[dbo].DIM_CATEGORIA;
        INSERT INTO [dbo].DIM_CATEGORIA (ID_CATEGORIA, CATEGORIA)
            SELECT 
                C.category_id AS ID_CATEGORIA, 
                C.name AS CATEGORIA
            FROM SAKILA.DBO.category AS C
            GROUP BY C.category_id, C.name;
    END
    ELSE 
    BEGIN
        INSERT INTO [dbo].DIM_CATEGORIA (ID_CATEGORIA, CATEGORIA)
            SELECT 
                C.category_id AS ID_CATEGORIA, 
                C.name AS CATEGORIA
            FROM SAKILA.DBO.category AS C
            GROUP BY C.category_id, C.name;
    END 
END
GO


--PA CLIENTE
CREATE PROCEDURE [dbo].[CARGA_DIM_CLIENTE] 
AS
BEGIN
    DECLARE @aux INT;
    SET @aux = (SELECT COUNT(*) FROM [MODELO_DIMENSIONAL].[dbo].DIM_CLIENTE);

    IF @aux > 0
    BEGIN 
        DELETE FROM [MODELO_DIMENSIONAL].[dbo].DIM_CLIENTE;
        INSERT INTO [dbo].DIM_CLIENTE (ID_CLIENTE, NOMBRE, APELLIDO, CREAR_DATOS)
            SELECT 
                CL.customer_id AS ID_CLIENTE, 
                CL.first_name AS NOMBRE,
                CL.last_name AS APELLIDO,
                CL.create_date AS CREAR_DATOS
            FROM sakila.DBO.customer AS CL
            GROUP BY CL.customer_id, CL.first_name, CL.last_name, CL.create_date;
    END
    ELSE 
    BEGIN
        INSERT INTO [dbo].DIM_CLIENTE (ID_CLIENTE, NOMBRE, APELLIDO, CREAR_DATOS)
            SELECT 
                CL.customer_id AS ID_CLIENTE, 
                CL.first_name AS NOMBRE,
                CL.last_name AS APELLIDO,
                CL.create_date AS CREAR_DATOS
            FROM sakila.DBO.customer AS CL
            GROUP BY CL.customer_id, CL.first_name, CL.last_name, CL.create_date;
    END 
END
GO


--PA STORE
CREATE PROCEDURE [dbo].[CARGA_DIM_TIENDA] 
AS
BEGIN
    DECLARE @aux INT;
    SET @aux = (SELECT COUNT(*) FROM [MODELO_DIMENSIONAL].[dbo].DIM_TIENDA);

    IF @aux > 0
    BEGIN 
        DELETE FROM [MODELO_DIMENSIONAL].[dbo].DIM_TIENDA;
        INSERT INTO [dbo].DIM_TIENDA (ID_TIENDA)
            SELECT 
                S.store_id AS ID_TIENDA
            FROM SAKILA.DBO.store AS S
            GROUP BY S.store_id;
    END
    ELSE 
    BEGIN
        INSERT INTO [dbo].DIM_TIENDA (ID_TIENDA)
            SELECT 
                S.store_id AS ID_TIENDA
            FROM SAKILA.DBO.store AS S
            GROUP BY S.store_id;
    END 
END
GO


--PA DIRECCION
CREATE PROCEDURE [dbo].[CARGA_DIM_DIRECCION] 
AS
BEGIN
    DECLARE @aux INT;
    SET @aux = (SELECT COUNT(*) FROM [MODELO_DIMENSIONAL].[dbo].DIM_DIRECCION);

    IF @aux > 0
    BEGIN 
        DELETE FROM [MODELO_DIMENSIONAL].[dbo].DIM_DIRECCION;
        INSERT INTO [dbo].DIM_DIRECCION (ID_DIRECCION, ID_CIUDAD, CIUDAD, ID_PAIS, PAIS)
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
    END
    ELSE 
    BEGIN
        INSERT INTO [dbo].DIM_DIRECCION (ID_DIRECCION, ID_CIUDAD, CIUDAD, ID_PAIS, PAIS)
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
    END 
END
GO


--PA LENGUAJE
CREATE PROCEDURE [dbo].[CARGA_DIM_LENGUAJE] 
AS
BEGIN
    DECLARE @aux INT;
    SET @aux = (SELECT COUNT(*) FROM [MODELO_DIMENSIONAL].[dbo].DIM_LENGUAJE);

    IF @aux > 0
    BEGIN 
        DELETE FROM [MODELO_DIMENSIONAL].[dbo].DIM_LENGUAJE;
        INSERT INTO [dbo].DIM_LENGUAJE (ID_LENGUAJE, LENGUAJE)
            SELECT 
                L.language_id AS ID_LENGUAJE, 
                L.name AS LENGUAJE
            FROM SAKILA.DBO.language AS L
            GROUP BY L.language_id, L.name;
    END
    ELSE 
    BEGIN
        INSERT INTO [dbo].DIM_LENGUAJE (ID_LENGUAJE, LENGUAJE)
            SELECT 
                L.language_id AS ID_LENGUAJE, 
                L.name AS LENGUAJE
            FROM SAKILA.DBO.language AS L
            GROUP BY L.language_id, L.name;
    END 
END
GO


--PA TIEMPO
CREATE PROCEDURE [dbo].[CARGA_DIM_TIEMPO]
AS
BEGIN

    DECLARE @aux INT;
    SET @aux = (SELECT COUNT(*) FROM [MODELO_DIMENSIONAL].[dbo].DIM_TIEMPO);
     
    IF @aux > 0
    BEGIN 
        DELETE [MODELO_DIMENSIONAL].[dbo].DIM_TIEMPO;
        INSERT INTO [dbo].DIM_TIEMPO (ID_TIEMPO, ANNIO, MES, DIA)
        SELECT 
            CONVERT(DATE, r.rental_date) AS ID_TIEMPO, 
            YEAR(r.rental_date) AS ANNIO,
            MONTH(r.rental_date) AS MES,
            DAY(r.rental_date) AS DIA
        FROM 
            sakila.dbo.rental AS r
        GROUP BY 
            CONVERT(DATE, r.rental_date), 
            YEAR(r.rental_date), 
            MONTH(r.rental_date), 
            DAY(r.rental_date);
    END
    ELSE 
    BEGIN
        INSERT INTO [dbo].DIM_TIEMPO (ID_TIEMPO, ANNIO, MES, DIA)
        SELECT 
            CONVERT(DATE, r.rental_date) AS ID_TIEMPO, 
            YEAR(r.rental_date) AS ANNIO,
            MONTH(r.rental_date) AS MES,
            DAY(r.rental_date) AS DIA
        FROM 
            sakila.dbo.rental AS r
        GROUP BY 
            CONVERT(DATE, r.rental_date), 
            YEAR(r.rental_date), 
            MONTH(r.rental_date), 
            DAY(r.rental_date);
    END
END
GO


--PA FACT_RENTAL
CREATE PROCEDURE [dbo].[CARGA_FACT_RENTAL]
AS
BEGIN

    DECLARE @aux INT;
    SET @aux = (SELECT COUNT(*) FROM [MODELO_DIMENSIONAL].[dbo].FACT_RENTAL);

    IF @aux > 0
    BEGIN
        DELETE FROM [MODELO_DIMENSIONAL].[dbo].FACT_RENTAL;
        INSERT INTO [dbo].FACT_RENTAL (ID_CATEGORIA, ID_PELICULA, ID_TIENDA, ID_LENGUAJE, ID_DIRECCION, ID_CLIENTE, ID_TIEMPO, UNIDADES, DINERO)
			SELECT 
				C.category_id AS ID_CATEGORIA,
				F.film_id AS ID_PELICULA,
				S.store_id AS ID_TIENDA,
				L.language_id AS ID_LENGUAJE,
				A.address_id AS ID_DIRECCION,
				CU.customer_id AS ID_CLIENTE,
				CONVERT(date, R.rental_date) AS ID_TIEMPO,
				COUNT(F.film_id) AS UNIDADES,
				SUM(P.amount) AS DINERO
			FROM sakila.DBO.rental AS R 
				INNER JOIN sakila.DBO.customer AS CU ON R.customer_id = CU.customer_id
				INNER JOIN sakila.DBO.inventory AS I ON R.inventory_id = I.inventory_id
				INNER JOIN sakila.DBO.store AS S ON I.store_id = S.store_id
				INNER JOIN sakila.DBO.film AS F ON I.film_id = F.film_id
				INNER JOIN sakila.DBO.film_category AS FC ON F.film_id = FC.film_id
				INNER JOIN sakila.DBO.category AS C ON FC.category_id = C.category_id
				INNER JOIN sakila.DBO.language AS L ON F.language_id = L.language_id
				INNER JOIN sakila.DBO.staff AS ST ON R.staff_id = ST.staff_id
				INNER JOIN sakila.DBO.address AS A ON S.address_id = A.address_id
				INNER JOIN sakila.DBO.city AS CI ON A.city_id = CI.city_id
				INNER JOIN sakila.DBO.country AS CO ON CI.country_id = CO.country_id
				INNER JOIN sakila.DBO.payment AS P ON R.rental_id = P.rental_id
			GROUP BY 
				C.category_id, F.film_id, S.store_id, L.language_id, A.address_id, CU.customer_id, CONVERT(date, R.rental_date);

    END
    ELSE
    BEGIN
        INSERT INTO [dbo].FACT_RENTAL (ID_CATEGORIA, ID_PELICULA, ID_TIENDA, ID_LENGUAJE, ID_DIRECCION, ID_CLIENTE, ID_TIEMPO, UNIDADES, DINERO)
			SELECT 
				C.category_id AS ID_CATEGORIA,
				F.film_id AS ID_PELICULA,
				S.store_id AS ID_TIENDA,
				L.language_id AS ID_LENGUAJE,
				A.address_id AS ID_DIRECCION,
				CU.customer_id AS ID_CLIENTE,
				CONVERT(date, R.rental_date) AS ID_TIEMPO,
				COUNT(F.film_id) AS UNIDADES,
				SUM(P.amount) AS DINERO
			FROM sakila.DBO.rental AS R 
				INNER JOIN sakila.DBO.customer AS CU ON R.customer_id = CU.customer_id
				INNER JOIN sakila.DBO.inventory AS I ON R.inventory_id = I.inventory_id
				INNER JOIN sakila.DBO.store AS S ON I.store_id = S.store_id
				INNER JOIN sakila.DBO.film AS F ON I.film_id = F.film_id
				INNER JOIN sakila.DBO.film_category AS FC ON F.film_id = FC.film_id
				INNER JOIN sakila.DBO.category AS C ON FC.category_id = C.category_id
				INNER JOIN sakila.DBO.language AS L ON F.language_id = L.language_id
				INNER JOIN sakila.DBO.staff AS ST ON R.staff_id = ST.staff_id
				INNER JOIN sakila.DBO.address AS A ON S.address_id = A.address_id
				INNER JOIN sakila.DBO.city AS CI ON A.city_id = CI.city_id
				INNER JOIN sakila.DBO.country AS CO ON CI.country_id = CO.country_id
				INNER JOIN sakila.DBO.payment AS P ON R.rental_id = P.rental_id
			GROUP BY 
				C.category_id, F.film_id, S.store_id, L.language_id, A.address_id, CU.customer_id, CONVERT(date, R.rental_date);

    END
END
GO


--PA COMPLETO
CREATE PROCEDURE [dbo].[PROCESO_DIMENSIONAL_COMPLETO]
AS
BEGIN

    DECLARE @aux INT;
    DELETE FROM [dbo].[FACT_RENTAL];
    SET @aux = (SELECT COUNT(*) FROM [dbo].[FACT_RENTAL]);

    IF @aux = 0
    BEGIN
		DELETE FROM [dbo].[DIM_CATEGORIA];
		DELETE FROM [dbo].[DIM_CLIENTE];
		DELETE FROM [dbo].[DIM_DIRECCION];
		DELETE FROM [dbo].[DIM_LENGUAJE];
		DELETE FROM [dbo].[DIM_PELICULA];
		DELETE FROM [dbo].[DIM_TIEMPO];
		DELETE FROM [dbo].[DIM_TIENDA];
    END
    ELSE
    BEGIN
        PRINT 'No se puede borrar debido a que FACT_RENTAL aún tiene datos';
    END

    EXEC [dbo].[CARGA_DIM_PELICULA]
	EXEC [dbo].[CARGA_DIM_CATEGORIA]
	EXEC [dbo].[CARGA_DIM_CLIENTE]
	EXEC [dbo].[CARGA_DIM_TIENDA]
	EXEC [dbo].[CARGA_DIM_DIRECCION]
	EXEC [dbo].[CARGA_DIM_LENGUAJE]
	EXEC [dbo].[CARGA_DIM_TIEMPO]
	EXEC [dbo].[CARGA_FACT_RENTAL]
END
GO

--Pregunta 1:X
SELECT
	DATEPART(YEAR, rental_date) AS YEAR,
    DATEPART(MONTH, rental_date) AS MONTH,
	DATEPART(DAY, rental_date) AS DAY,
	COUNT(rental_id) AS RENTAL_COUNT
FROM rental
	WHERE rental_date BETWEEN '2005-07-24' AND '2005-12-24'
GROUP BY
    DATEPART(YEAR, rental_date),
    DATEPART(MONTH, rental_date),
	DATEPART(DAY, rental_date);

--Pregunta 2:
SELECT 
    c.name AS CATEGORY,
    DATEPART(YEAR, r.rental_date) AS YEAR,
    DATEPART(MONTH, r.rental_date) AS MONTH,
    COUNT(f.film_id) AS TOTAL_UNITS
FROM 
    rental r
    INNER JOIN inventory i ON r.inventory_id = i.inventory_id
    INNER JOIN film f ON i.film_id = f.film_id
    INNER JOIN film_category fc ON f.film_id = fc.film_id
    INNER JOIN category c ON fc.category_id = c.category_id
WHERE 
    c.name = 'Family'
    AND r.rental_date BETWEEN '2005-07-01' AND '2005-08-01'
GROUP BY
    c.name,
    DATEPART(YEAR, r.rental_date),
    DATEPART(MONTH, r.rental_date);

--Pregunta 3:X
SELECT 
	i.store_id AS ID_STORE,
	c.name AS CATEGORY,
	l.name AS LANGUAGE,
	DATEPART(YEAR, r.rental_date) AS YEAR,
    DATEPART(MONTH, r.rental_date) AS MONTH,
	COUNT(f.film_id) AS TOTAL_UNITS
FROM rental r
	INNER JOIN inventory i ON r.inventory_id=i.inventory_id
	INNER JOIN film f ON i.film_id=f.film_id
	INNER JOIN film_category fc ON f.film_id=fc.film_id
	INNER JOIN category c ON fc.category_id=c.category_id
	INNER JOIN language l ON f.language_id=l.language_id
WHERE c.name='Games'
	 AND i.store_id = 1
	 AND l.name='English'
	 AND r.rental_date BETWEEN'2005-07-01'AND'2005-08-01'
GROUP BY
	i.store_id,
    c.name,
	l.name,
    DATEPART(YEAR, r.rental_date),
    DATEPART(MONTH, r.rental_date);

--Pregunta 4:X
SELECT 
	s.store_id AS ID_STORE,
	c.name AS CATEGORY,
	DATEPART(YEAR, r.rental_date) AS YEAR,
    DATEPART(MONTH, r.rental_date) AS MONTH,
	COUNT(r.rental_id) AS TOTAL_UNITS
FROM rental r
	JOIN inventory i ON r.inventory_id=i.inventory_id
	JOIN store s ON i.store_id=s.store_id
	JOIN film f ON i.film_id=f.film_id
	JOIN film_category fc ON f.film_id=fc.film_id
	JOIN category c ON fc.category_id=c.category_id
WHERE c.name='Horror'
	AND r.rental_date BETWEEN'2005-08-01'AND'2005-08-31'
GROUP BY 
	s.store_id,
	c.name,
	DATEPART(YEAR, r.rental_date),
    DATEPART(MONTH, r.rental_date);

--Pregunta 5:X
SELECT 
	i.store_id AS ID_STORE,
	c.name AS CATEGORY,
	DATEPART(YEAR, r.rental_date) AS YEAR,
    DATEPART(MONTH, r.rental_date) AS MONTH,	
	COUNT(F.film_id) AS TOTAL_UNITS
FROM rental r
	JOIN inventory i ON r.inventory_id=i.inventory_id
	JOIN film f ON i.film_id=f.film_id
	JOIN film_category fc ON f.film_id=fc.film_id
	JOIN category c ON fc.category_id=c.category_id
WHERE c.name='Music'
	AND i.store_id = 2
	AND r.rental_date BETWEEN'2005-06-01'AND'2005-08-31'
GROUP BY 
	i.store_id,
	c.name,
	DATEPART(YEAR, r.rental_date),
    DATEPART(MONTH, r.rental_date);

--Pregunta 6:
SELECT 
	co.country AS COUNTRY,
	c.name AS CATEGORY,
	DATEPART(YEAR, r.rental_date) AS YEAR,
    DATEPART(MONTH, r.rental_date) AS MONTH,	
	COUNT(*) AS TOTAL_UNITS
FROM rental r
	INNER JOIN inventory i ON r.inventory_id = i.inventory_id
	INNER JOIN film f ON i.film_id = f.film_id
	INNER JOIN film_category fc ON f.film_id = fc.film_id
	INNER JOIN category c ON fc.category_id = c.category_id
	INNER JOIN customer cu ON r.customer_id = cu.customer_id
	INNER JOIN address a ON cu.address_id = a.address_id
	INNER JOIN city ci ON a.city_id = ci.city_id
	INNER JOIN country co ON ci.country_id = co.country_id
WHERE c.name = 'Sports'
	AND co.country = 'Australia'
	AND r.rental_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY
	co.country,
	c.name,
	DATEPART(YEAR, r.rental_date),
    DATEPART(MONTH, r.rental_date);

--Pregunta 7:X
SELECT 
	l.name AS LANGUAGE,
	DATEPART(YEAR, r.rental_date) AS YEAR,
	COUNT(*) AS TOTAL_UNITS
FROM rental r
	JOIN inventory i ON r.inventory_id=i.inventory_id
	JOIN film f ON i.film_id=f.film_id
	JOIN language l ON f.language_id=l.language_id
WHERE l.name='English'
	AND r.rental_date BETWEEN'2005-01-01'AND'2006-12-31'
GROUP BY
	l.name,
	DATEPART(YEAR, r.rental_date);

--Pregunta 8:X
SELECT 
	f.replacement_cost AS REMPLACEMENT_COST,
	DATEPART(YEAR, r.rental_date) AS YEAR,
	COUNT(*) AS TOTAL_UNITS
FROM rental r
	JOIN inventory i ON r.inventory_id=i.inventory_id
	JOIN film f ON i.film_id=f.film_id
WHERE f.replacement_cost BETWEEN 15 AND 25
	AND r.rental_date BETWEEN'2005-01-01'AND'2005-12-31'
GROUP BY
	f.replacement_cost,
	DATEPART(YEAR, r.rental_date);

--Pregunta 9:X
SELECT 
	i.store_id AS ID_STORE,
	DATEPART(YEAR, r.rental_date) AS YEAR,
    DATEPART(MONTH, r.rental_date) AS MONTH,	
	COUNT(*) AS TOTAL_UNITS
FROM rental r
	INNER JOIN inventory i ON r.inventory_id=i.inventory_id
WHERE i.store_id=1
	AND r.rental_date BETWEEN'2005-01-01'AND'2005-09-30'
GROUP BY 
	i.store_id,
	DATEPART(YEAR, r.rental_date),
    DATEPART(MONTH, r.rental_date);

--Pregunta 10:
SELECT 
	i.store_id AS ID_STORE,
	DATEPART(YEAR, r.rental_date) AS YEAR,
    DATEPART(MONTH, r.rental_date) AS MONTH,	
	SUM(p.amount) AS TOTAL_AMOU
FROM payment p
	INNER JOIN rental r ON p.rental_id = r.rental_id
	INNER JOIN inventory i ON r.inventory_id=i.inventory_id
WHERE r.rental_date BETWEEN '2005-05-01' AND '2005-06-01'
	AND r.inventory_id IN (
		SELECT i.inventory_id
		FROM inventory i
		WHERE i.store_id = 1
	)
GROUP BY 
	i.store_id,
	DATEPART(YEAR, r.rental_date),
    DATEPART(MONTH, r.rental_date);

--Pregunta 11:
SELECT 
	co.country AS COUNTRY,
	DATEPART(YEAR, r.rental_date) AS YEAR,
    DATEPART(MONTH, r.rental_date) AS MONTH,
	SUM(p.amount) AS TOTAL_AMOUNT
FROM payment p
	INNER JOIN rental r ON p.rental_id = r.rental_id
	INNER JOIN staff s ON r.staff_id = s.staff_id
	INNER JOIN store st ON s.store_id = st.store_id
	INNER JOIN address a ON st.address_id = a.address_id
	INNER JOIN city c ON a.city_id = c.city_id
	INNER JOIN country co ON c.country_id = co.country_id
WHERE co.country = 'Canada'
	AND p.payment_date BETWEEN '2005-07-01' AND '2005-08-01'
GROUP BY 
	co.country,
	DATEPART(YEAR, r.rental_date),
    DATEPART(MONTH, r.rental_date);

--Pregunta 12: X


--Pregunta 13:
SELECT 
	COUNT(r.rental_id) AS TOTAL_UNITS
FROM rental r
	INNER JOIN staff s ON r.staff_id = s.staff_id
	INNER JOIN store st ON s.store_id = st.store_id
	INNER JOIN address a ON st.address_id = a.address_id
	INNER JOIN city c ON a.city_id = c.city_id
WHERE c.city = 'Lethbridge'
  AND SUBSTRING(r.rental_date, 1, 10) = '2005-08-22';

--Pregunta 14:X
SELECT 
	DATEPART(YEAR, r.rental_date) AS YEAR,
	DATEPART(MONTH, r.rental_date) AS MONTH,
    COUNT(*) AS TOTAL_UNITS
FROM rental AS r
	WHERE rental_date LIKE '2006%'
GROUP BY 
	DATEPART(YEAR, r.rental_date),
    DATEPART(MONTH, r.rental_date);

--Pregunta 15:
SELECT 
	S.store_id AS ID_STORE,
	C.name AS CATEGORY,
	DATEPART(YEAR, r.rental_date) AS YEAR,
    SUM(P.amount) AS INGRESO_TOTAL
FROM 
    category C
    INNER JOIN film_category FC ON C.category_id = FC.category_id
    INNER JOIN film F ON FC.film_id = F.film_id
    INNER JOIN inventory I ON F.film_id = I.film_id
	INNER JOIN store S ON S.store_id = I.store_id
    INNER JOIN rental R ON I.inventory_id = R.inventory_id
    INNER JOIN payment P ON R.rental_id = P.rental_id
WHERE 
    C.name = 'Horror'
    AND R.rental_date >= '2004-01-01' 
	AND R.rental_date < '2006-01-01'
    AND S.store_id = 2
GROUP BY
	S.store_id,
	C.name,
	DATEPART(YEAR, r.rental_date);

--Pregunta 16:
SELECT 
	S.store_id AS ID_STORE,
	DATEPART(YEAR, r.rental_date) AS YEAR,
	SUM(p.amount) AS TOTAL_AMOUNT
FROM rental r 
	INNER JOIN payment p ON r.rental_id = p.rental_id 
	INNER JOIN inventory i ON r.inventory_id = i.inventory_id 
	INNER JOIN store s ON i.store_id = s.store_id 
WHERE s.store_id = 2 
	AND YEAR(r.rental_date) = 2005
GROUP BY
	S.store_id,
	DATEPART(YEAR, r.rental_date);


--Pregunta 17:
SELECT 
	DATEPART(YEAR, r.rental_date) AS YEAR,
	c.create_date AS CREATE_DATE,
	COUNT(*) AS TOTAL_UNITS
FROM rental r
	INNER JOIN inventory i ON r.inventory_id = i.inventory_id
	INNER JOIN customer c ON r.customer_id = c.customer_id
WHERE DATEDIFF(YEAR, c.create_date, GETDATE()) > 1
	AND r.rental_date BETWEEN '2005-01-01' AND '2005-12-31'
GROUP BY
	c.create_date,
	DATEPART(YEAR, r.rental_date);

--Pregunta 18:X
SELECT 
	c.name AS CATEGORY,
	l.name AS LANGUAGE,
	DATEPART(YEAR, r.rental_date) AS YEAR,
	COUNT(*) AS TOTAL_UNITS
FROM rental r
	INNER JOIN inventory i ON r.inventory_id = i.inventory_id
	INNER JOIN film f ON i.film_id = f.film_id
	INNER JOIN film_category fc ON f.film_id = fc.film_id
	INNER JOIN category c ON fc.category_id = c.category_id
	INNER JOIN customer cu ON r.customer_id = cu.customer_id
	INNER JOIN language l ON l.language_id = f.language_id
WHERE c.name = 'Animation'
	AND f.language_id = (SELECT language_id FROM language WHERE name = 'English')
	AND r.rental_date BETWEEN '2005-01-01' AND '2006-01-01'
GROUP BY
	c.name,
	l.name,
	DATEPART(YEAR, r.rental_date);

--Pregunta 19:X
SELECT 
	S.store_id AS ID_STORE,
	c.name AS CATEGORY,
	DATEPART(YEAR, r.rental_date) AS YEAR,
	SUM(p.amount) AS TOTAL_AMOUNT
FROM payment p
	INNER JOIN rental r ON p.rental_id = r.rental_id
	INNER JOIN inventory i ON r.inventory_id = i.inventory_id
	INNER JOIN film f ON i.film_id = f.film_id
	INNER JOIN film_category fc ON f.film_id = fc.film_id
	INNER JOIN category c ON fc.category_id = c.category_id
	INNER JOIN store s ON i.store_id = s.store_id
	INNER JOIN address a ON s.address_id = a.address_id
WHERE c.name = 'Travel'
	AND s.store_id = 1
	AND p.payment_date BETWEEN '2005-01-01' AND '2006-01-01'
GROUP BY
	S.store_id,
	c.name,
	DATEPART(YEAR, r.rental_date);
	                                                                             
--Pregunta 20:X
SELECT 
	DATEPART(YEAR, rental_date) AS YEAR,
    DATEPART(MONTH, rental_date) AS MONTH,
	DATEPART(DAY, rental_date) AS DAY,
	COUNT(*) AS TOTAL_UNITS
FROM rental r
WHERE r.rental_date BETWEEN '2005-05-01' AND '2005-06-01'
GROUP BY
    DATEPART(YEAR, rental_date),
    DATEPART(MONTH, rental_date),
	DATEPART(DAY, rental_date);

--Pregunta 21:
SELECT 
	co.country AS COUNTRY,
	c.city AS CITY,
	ca.name AS CATEGORY,
	DATEPART(YEAR, rental_date) AS YEAR,
    DATEPART(MONTH, rental_date) AS MONTH,
	SUM(p.amount)AS TOTAL_AMOUNT
FROM payment P
	INNER JOIN rental r ON p.rental_id=r.rental_id	
	INNER JOIN inventory i ON r.inventory_id=i.inventory_id
	INNER JOIN store s ON i.store_id=s.store_id
	INNER JOIN address a ON s.address_id=a.address_id
	INNER JOIN city c ON a.city_id=c.city_id
	INNER JOIN country co ON c.country_id=co.country_id
	INNER JOIN film f ON i.film_id=f.film_id
	INNER JOIN film_category fc ON f.film_id=fc.film_id
	INNER JOIN category ca ON fc.category_id=ca.category_id
WHERE ca.name='Action'
	AND c.city='Lethbridge'
	AND co.country='Canada'
	AND p.payment_date BETWEEN'2005-06-01' AND '2005-12-31'
GROUP BY
	co.country,
	c.city,
	ca.name,
	DATEPART(YEAR, rental_date),
    DATEPART(MONTH, rental_date);
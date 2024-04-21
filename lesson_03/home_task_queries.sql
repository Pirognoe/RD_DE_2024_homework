/*
 Завдання на SQL до лекції 03.
 */


/*
1.
Вивести кількість фільмів в кожній категорії.
Результат відсортувати за спаданням.
*/
-- SQL code goes here...

-- https://www.getdbt.com/blog/write-better-sql-a-defense-of-group-by-1
WITH
	FILM_PER_CATEGORY_COUNT AS (
		SELECT
			CATEGORY_ID,
			COUNT(*) AS FILM_COUNT
		FROM
			PUBLIC.FILM_CATEGORY
		GROUP BY
			1
	)
SELECT
	CATEGORY.NAME,
	FILM_PER_CATEGORY_COUNT.FILM_COUNT
FROM
	FILM_PER_CATEGORY_COUNT
	JOIN PUBLIC.CATEGORY USING (CATEGORY_ID)
ORDER BY
	FILM_COUNT DESC;


/*
2.
Вивести 10 акторів, чиї фільми брали на прокат найбільше.
Результат відсортувати за спаданням.
*/
-- SQL code goes here...
WITH
	FILM_RENTAL_COUNT AS (
		SELECT
			FILM_ID,
			COUNT(*) AS FILM_RENTAL_COUNT
		FROM
			PUBLIC.INVENTORY
		GROUP BY
			1
	),
	ACTOR_FILM_RENTAL_COUNT AS (
		SELECT
			ACTOR_ID,
			SUM(FILM_RENTAL_COUNT) AS FILM_RENTAL_PER_ACTOR_COUNT
		FROM
			FILM_RENTAL_COUNT
			JOIN PUBLIC.FILM_ACTOR USING (FILM_ID)
		GROUP BY
			1
	)
SELECT
	ACTOR.FIRST_NAME,
	ACTOR.LAST_NAME,
	FILM_RENTAL_PER_ACTOR_COUNT
FROM
	ACTOR_FILM_RENTAL_COUNT
	JOIN PUBLIC.ACTOR USING (ACTOR_ID)
ORDER BY
	FILM_RENTAL_PER_ACTOR_COUNT DESC
LIMIT
	10


/*
3.
Вивести категорія фільмів, на яку було витрачено найбільше грошей
в прокаті
*/
-- SQL code goes here...



/*
4.
Вивести назви фільмів, яких не має в inventory.
Запит має бути без оператора IN
*/
-- SQL code goes here...


/*
5.
Вивести топ 3 актори, які найбільше зʼявлялись в категорії фільмів “Children”.
*/
-- SQL code goes here...

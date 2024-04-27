USE movies

-- Задача 1 --
SELECT address
FROM studio
WHERE name = 'MGM'

-- Задача 2 --
SELECT birthdate
FROM moviestar
WHERE name = 'Sandra Bullock'

-- Задача 2' -- Имената на всички филми, които съдържат 'star' в името си.
SELECT title
FROM movie
WHERE title LIKE '%star%'

USE ships

-- Задача 3 --
SELECT name AS shipName
FROM ships
WHERE launched < 1918

-- Задача 3' -- Класовете на всички кораби, пуснати на вода преди 1918.
SELECT DISTINCT class
FROM ships
WHERE launched < 1918

USE movies

-- Задача 4 --
SELECT me.name
FROM studio s
	JOIN movieexec me ON s.presc# = me.cert#
WHERE s.name = 'MGM'

-- Задача 5 -- Тълкувание 1 - има единствен филм с име 'Star Wars'.
SELECT title
FROM movie
WHERE length > (SELECT length
		FROM movie
		WHERE title = 'Star Wars' AND year = 1977)

-- Задача 5 -- Тълкувание 2 - има много филми с име 'Star Wars'.
SELECT title
FROM movie
WHERE length > ALL (SELECT length
		    FROM movie
		    WHERE title = 'Star Wars')

USE pc

-- Задача 6 --
SELECT l.model, price
FROM laptop l
	JOIN product p ON l.model = p.model
WHERE maker = 'B'
UNION
SELECT pc.model, price
FROM pc
	JOIN product p ON pc.model = p.model
WHERE maker = 'B'
UNION
SELECT pr.model, price
FROM printer pr
	JOIN product p ON pr.model = p.model
WHERE maker = 'B'
ORDER BY price DESC

USE movies

-- Задача 7 --
SELECT name
FROM moviestar
WHERE gender = 'F' AND name IN (SELECT name
				FROM movieexec
				WHERE networth > 10000000)

USE pc

-- Задача 8 --
SELECT *
FROM printer
WHERE price >= ALL (SELECT price FROM printer)

USE ships

-- Задача 9 --
SELECT DISTINCT country
FROM classes
WHERE numguns >= ALL (SELECT numguns FROM classes)

-- Задача 10 -- Вариант 1
SELECT DISTINCT class
FROM ships s
	JOIN outcomes o ON s.name = o.ship AND o.result = 'sunk'

-- Задача 10 -- Вариант 2
SELECT DISTINCT class
FROM ships
WHERE name IN (SELECT ship FROM outcomes WHERE result = 'sunk')

USE movies

-- Задача 11 --
SELECT DISTINCT e.name
FROM movie m
    JOIN starsin s ON m.title = s.movietitle AND m.year = s.movieyear
    JOIN movieexec e ON m.producerc# = e.cert#
WHERE s.starname = 'Harrison Ford'

-- Задача 12 --
SELECT name
FROM moviestar
LEFT JOIN starsin ON name = starname
WHERE starname IS NULL

USE ships

-- Задача 13 --
SELECT c.country, s.name
FROM classes c
	JOIN ships s ON s.class = c.class
	LEFT JOIN outcomes o ON s.name = o.ship
WHERE o.ship IS NULL

---------- Solutions of the exam ----------

-- 1 А)
-- 2 В)
-- 3 Б)

-- 4:
------ m или AS m
------ = s.name или = name
------ = или IN
------ studioname
------ movie

-- 5:
USE pc;
SELECT DISTINCT p.maker
FROM product p
	JOIN pc ON pc.model = p.model
WHERE price = (SELECT MIN(price) FROM pc);

-- 6:
USE ships;

-- Вариант 1
SELECT DISTINCT class
FROM ships s
	JOIN outcomes o ON s.name = o.ship AND o.result = 'damaged';

-- Вариант 2
SELECT DISTINCT class
FROM ships
WHERE name IN (SELECT ship FROM outcomes WHERE result = 'damaged');

-- 7:
USE ships;

SELECT class
FROM classes
WHERE class NOT IN (SELECT class
		    FROM ships
			    JOIN outcomes ON name = ship
		    WHERE result = 'damaged');
                    
-- 8:
USE pc;

SELECT maker
FROM product
WHERE type = 'Printer'
GROUP BY maker
HAVING COUNT(*) >= 3;

-- 9:
USE movies;

SELECT DISTINCT movietitle, movieyear
FROM starsin si
	JOIN moviestar ms ON ms.name = si.starname
WHERE birthdate BETWEEN '1970-01-01' AND '1980-07-01';

-- 10:
USE movies;

SELECT ms.name, COUNT(DISTINCT m.studioname)
FROM moviestar ms
	JOIN starsin si ON si.starname = ms.name
	JOIN movie m ON m.title = si.movietitle AND m.year = si.movieyear
GROUP BY ms.name;

-- 11:
USE pc;

CREATE OR REPLACE VIEW ProductOfMakerB
AS
SELECT model, type
FROM product
WHERE maker = 'B';

SELECT * FROM ProductOfMakerB;

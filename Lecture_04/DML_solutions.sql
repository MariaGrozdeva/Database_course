USE movies

-- Задача 1 --
BEGIN TRANSACTION
INSERT INTO moviestar (name, gender, birthdate) VALUES ('Nicole Kidman', 'F', '1967-06-20')
ROLLBACK

-- Задача 2 --
BEGIN TRANSACTION
DELETE FROM movieexec WHERE networth < 10000000
ROLLBACK

USE pc

-- Задача 3 --
BEGIN TRANSACTION
INSERT INTO laptop (code, model, speed, ram, hd, price, screen)
    SELECT code + 100 AS code, model, speed, ram, hd, price + 500 AS price, 15
    FROM pc
ROLLBACK

-- Задача 4 --
BEGIN TRANSACTION
UPDATE product
    SET maker = 'A'
WHERE maker = 'B'
ROLLBACK

USE ships

-- Задача 5 --
BEGIN TRANSACTION
DELETE FROM ships
WHERE name IN (SELECT ship FROM outcomes WHERE result = 'sunk')
ROLLBACK

-- Задача 6 --
BEGIN TRANSACTION
UPDATE classes
    SET bore = bore * 2.54, displacement = displacement / 1.1
ROLLBACK
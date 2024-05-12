	----------------------- Задача 1 -----------------------
-- Добавете Брус Уилис в базата.
-- Направете така, че при добавяне на филм, чието заглавие съдържа “save” или “world”,
-- Брус Уилис автоматично да бъде добавен като актьор, играл в съответния филм.

USE movies

INSERT INTO moviestar VALUES ('Bruce Willis', 'Hollywood', 'M', '1955-03-19');

GO
CREATE TRIGGER BruceWillis ON movie AFTER INSERT
AS
    INSERT INTO starsin (movietitle, movieyear, starname)
	SELECT title, year, 'Bruce Willis'
	FROM inserted
	WHERE title LIKE '%save%' AND title LIKE '%world%'
GO

	----------------------- Задача 2 -----------------------
-- Да се направи така, че да не е възможно средната стойност на networth
-- да е по- малка от 500'000 (ако при промени в таблицата MovieExec тази стойност
-- стане по- малка от 500'000, промените да бъдат отхвърлени).

USE movies

GO
CREATE TRIGGER NetworthEnforce ON movieexec AFTER INSERT, UPDATE, DELETE
AS
    IF (SELECT AVG(networth) FROM movieexec) < 500000
    BEGIN
    	RAISERROR('Data Integrity Violation', 11, 1)
        ROLLBACK
    END
GO

	----------------------- Задача 3 -----------------------
-- MSSQL не поддържа SET NULL ON DELETE. Да се реализира с тригер за външния
-- ключ Movie.producerc#.

USE movies

GO
CREATE TRIGGER SetNullOnDelete ON movieexec INSTEAD OF DELETE
AS
    UPDATE movie
	SET producerc# = NULL
    WHERE producerc# IN (SELECT cert# FROM deleted)

    DELETE FROM movieexec
    WHERE cert# IN (SELECT cert# FROM deleted)	
GO

	----------------------- Задача 4 -----------------------
-- Никой производител на компютри не може да произвежда и принтери.

USE pc

GO
CREATE TRIGGER MakerEnforce ON product AFTER INSERT, UPDATE
AS
IF EXISTS (SELECT  *
           FROM product p1
               JOIN product p2 ON p1.maker = p2.maker
           WHERE p1.type = 'PC' AND p2.type = 'Printer')
    BEGIN
        RAISERROR('Data Integrity Violation', 11, 1)
        ROLLBACK
    END
GO

	----------------------- Задача 5 -----------------------
-- Ако някой лаптоп има повече памет от някой компютър, трябва да бъде и по-скъп от него.

USE pc

GO
CREATE TRIGGER EnforePriceForPC ON pc AFTER INSERT, UPDATE
AS
IF EXISTS (SELECT *
	   FROM inserted
	       JOIN laptop ON inserted.ram < laptop.ram
	   WHERE inserted.price >= laptop.price)
    BEGIN
        RAISERROR('Data Integrity Violation', 11, 1)
        ROLLBACK
    END
GO

USE movies;

----------------------- Задача 1 -----------------------
-- Добавете Брус Уилис в базата.
-- Направете така, че при добавяне на филм, чието заглавие съдържа “save” или “world”,
-- Брус Уилис автоматично да бъде добавен като актьор, играл в съответния филм.
DROP TRIGGER IF EXISTS AddBruceWillis;
DELIMITER //
CREATE TRIGGER AddBruceWillis AFTER INSERT ON movie 
FOR EACH ROW
BEGIN
	IF (NEW.title LIKE '%save%' AND NEW.title LIKE '%world%')
		THEN INSERT INTO starsin VALUES (NEW.title, NEW.year, 'Bruce Willis');
	END IF;
END //
DELIMITER ;

SELECT * FROM starsin;
INSERT IGNORE INTO movie (title, year) VALUES ('save the world', 1999);
SELECT * FROM starsin;

----------------------- Задача 2 -----------------------
-- Да се направи така, че да не е възможно средната стойност на networth
-- да е по- малка от 500'000 (ако при промени в таблицата MovieExec тази стойност
-- стане по- малка от 500'000, промените да бъдат отхвърлени).
DROP TRIGGER IF EXISTS NetworthEnfore;
DELIMITER //
CREATE TRIGGER NetworthEnfore BEFORE INSERT ON movieexec
FOR EACH ROW
BEGIN
	DECLARE average_networth_before_insert DECIMAL(50, 10);
    DECLARE average_networth_after_insert DECIMAL(50, 10);
    DECLARE rows_count_before_insert INT;
    
    SELECT AVG(networth) INTO average_networth_before_insert FROM movieexec;
	SELECT COUNT(networth) INTO rows_count_before_insert FROM movieexec;
    
    SET average_networth_after_insert = 
		(average_networth_before_insert * rows_count_before_insert + NEW.networth) / rows_count_before_insert + 1;
    
    IF (average_networth_after_insert < 500000) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data Integrity Violation';
	END IF;
END //
DELIMITER ;

SELECT AVG(networth) FROM movieexec; -- assume the current average is 500'000
INSERT IGNORE INTO movieexec VALUES (222, 'aaa', 'bbb', 1); -- the new average should be less than 500'000 and the entry should not be inserted

USE pc;

----------------------- Задача 3 -----------------------
-- Никой производител на компютри не може да произвежда и принтери.
DROP TRIGGER IF EXISTS ProductEnforce;
DELIMITER //
CREATE TRIGGER ProductEnforce BEFORE INSERT ON product
FOR EACH ROW
BEGIN
	IF EXISTS (SELECT *
				FROM product p
                WHERE (p.maker = NEW.maker AND p.type = 'PC' AND NEW.type = 'Printer') OR
						(p.maker = NEW.maker AND p.type = 'Printer' AND NEW.type = 'PC')
	) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data Integrity Violation';
    END IF;
END //
DELIMITER ;

SELECT * FROM product; -- assume there is a maker 'Q' who produces PCs
INSERT IGNORE INTO product VALUES ('Q', 235, 'Printer'); -- should NOT insert the entry into the table

----------------------- Задача 4 -----------------------
-- Ако някой лаптоп има повече памет от някой компютър, трябва да бъде и по-скъп от него.
---------- PC ----------
DROP TRIGGER IF EXISTS PcEnforce;
DELIMITER //
CREATE TRIGGER PcEnforce BEFORE INSERT ON pc
FOR EACH ROW
BEGIN
	IF EXISTS (SELECT *
				FROM laptop l
                WHERE l.ram > NEW.ram AND l.price < NEW.price
	) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data Integrity Violation';
    END IF;
END //
DELIMITER ;

SELECT * FROM laptop; -- assume there is a laptop with more than 16ram which costs less than 1200
INSERT IGNORE INTO pc VALUES (111, 3121, 500, 16, 5, '13x', 1200); -- should NOT insert the entry into the table

---------- Laptop ----------
DROP TRIGGER IF EXISTS LaptopEnforce;
DELIMITER //
CREATE TRIGGER LaptopEnforce BEFORE INSERT ON laptop
FOR EACH ROW
BEGIN
	IF EXISTS (SELECT *
				FROM pc
                WHERE pc.ram < NEW.ram AND pc.price > NEW.price
	) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Data Integrity Violation';
    END IF;
END //
DELIMITER ;

SELECT * FROM pc; -- assume there is a pc with less than 64ram which costs more than 800
INSERT IGNORE INTO laptop VALUES (111, 3121, 500, 64, 5, 8, 800); -- should NOT insert the entry into the table
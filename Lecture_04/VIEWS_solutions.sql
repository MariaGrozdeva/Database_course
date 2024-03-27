USE mods

-- Задача 1 --
GO
CREATE VIEW BritishShips
AS
SELECT s.name, c.class, c.type, c.numguns, c.bore, c.displacement, s.launched
FROM classes c 
    JOIN ships s ON c.class = s.class
WHERE c.country = 'Gt.Britain'
GO

-- Задача 2 --
SELECT name, numguns, displacement
FROM BritishShips
WHERE launched = 1917

-- Задача 3 --
GO
CREATE VIEW SunkShips
AS
SELECT battle, ship
FROM outcomes
WHERE result = 'sunk'
GO

-- Задача 4 --
CREATE VIEW BattleList
AS
SELECT battle 
FROM outcomes o 
    JOIN ships s ON o.ship = s.name
    JOIN classes c ON s.class = c.class
WHERE c.numguns < 9 
GROUP BY battle
HAVING COUNT(*) >= 3 AND SUM(CASE result WHEN 'damaged' THEN 1 ELSE 0 END) >= 1
GO
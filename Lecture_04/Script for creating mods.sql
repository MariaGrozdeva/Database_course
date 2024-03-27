USE master
GO

if exists (select * from sysdatabases where name='mods')
	DROP DATABASE mods
GO

CREATE DATABASE mods
GO
USE mods
GO

----- Create Tables -----

CREATE TABLE MOVIE (
 TITLE VARCHAR(255) NOT NULL,
 YEAR INTEGER NOT NULL,
 LENGTH INTEGER,
 INCOLOR CHAR(1),
 STUDIONAME CHAR(50),
 PRODUCERC# INTEGER
);

CREATE TABLE MOVIESTAR (
 NAME CHAR(30) NOT NULL,
 ADDRESS VARCHAR(255),
 GENDER CHAR(1),
 BIRTHDATE DATETIME
);

CREATE TABLE STARSIN (
    MOVIETITLE VARCHAR(255) NOT NULL,
    MOVIEYEAR INTEGER NOT NULL,
    STARNAME CHAR(30) NOT NULL
);

CREATE TABLE MOVIEEXEC (
    CERT# INTEGER NOT NULL,
    NAME CHAR(30),
    ADDRESS VARCHAR(255),
    NETWORTH INTEGER
);

CREATE TABLE STUDIO (
    NAME CHAR(50) NOT NULL,
    ADDRESS VARCHAR(255),
    PRESC# INTEGER
);

------- Insert Studio ------------
INSERT INTO STUDIO
  VALUES ('Disney','500 S. Buena Vista Street',1);

INSERT INTO STUDIO
  VALUES ('USA Entertainm.','', 2);

INSERT INTO STUDIO
  VALUES ('Fox','10201 Pico Boulevard', 3);

INSERT INTO STUDIO
  VALUES ('Paramount','5555 Melrose Ave', 4);

INSERT INTO STUDIO
  VALUES ('MGM','MGM Boulevard', 5);
  
------- Insert MovieExec ------------  
INSERT INTO MOVIEEXEC (NAME, ADDRESS, CERT#, NETWORTH)
  VALUES ('George Lucas', 'Oak Rd.', 555, 200000000);

INSERT INTO MOVIEEXEC (NAME, ADDRESS, CERT#, NETWORTH)
  VALUES ('Ted Turner', 'Turner Av.', 333, 125000000);

INSERT INTO MOVIEEXEC (NAME, ADDRESS, CERT#, NETWORTH)
  VALUES ('Stephen Spielberg', '123 ET road', 222, 100000000);

INSERT INTO MOVIEEXEC (NAME, ADDRESS, CERT#, NETWORTH)
  VALUES ('Merv Griffin', 'Riot Rd.', 199, 112000000);

INSERT INTO MOVIEEXEC (NAME, ADDRESS, CERT#, NETWORTH)
  VALUES ('Calvin Coolidge', 'Fast Lane', 123, 20000000);

------- Insert Movie ------------
INSERT INTO MOVIE
  VALUES ('Pretty Woman', 1990, 119, 'Y', 'Disney', 199);

INSERT INTO MOVIE
  VALUES ('The Man Who Wasn''t There', 2001, 116, 'N', 'USA Entertainm.',
    555);

INSERT INTO MOVIE
  VALUES ('Logan''s run', 1976, NULL, 'Y', 'Fox', 333);

INSERT INTO MOVIE
  VALUES ('Star Wars', 1977, 124, 'Y', 'Fox', 555);

INSERT INTO MOVIE
  VALUES ('Empire Strikes Back', 1980, 111, 'Y', 'Fox', 555);

INSERT INTO MOVIE
  VALUES ('Star Trek', 1979, 132, 'Y', 'Paramount', 222);

INSERT INTO MOVIE
  VALUES ('Star Trek: Nemesis', 2002, 116, 'Y', 'Paramount', 123);

INSERT INTO MOVIE
  VALUES ('Terms of Endearment', 1983, 132, 'Y', 'MGM', 123);

INSERT INTO MOVIE
  VALUES ('The Usual Suspects', 1995, 106, 'Y', 'MGM', 199);

INSERT INTO MOVIE
  VALUES ('Gone With the Wind', 1938, 238, 'Y', 'MGM', 123);

------- Insert MovieStar ------------

INSERT INTO MOVIESTAR
  VALUES ('Jane Fonda', 'Turner Av.', 'F', '1977-07-07');

INSERT INTO MOVIESTAR
  VALUES ('Alec Baldwin', 'Baldwin Av.', 'M', '1977-07-06');

INSERT INTO MOVIESTAR
  VALUES ('Kim Basinger', 'Baldwin Av.', 'F', '1979-07-05');

INSERT INTO MOVIESTAR
  VALUES ('Harrison Ford', 'Prefect Rd.', 'M', '1955-05-05');

INSERT INTO MOVIESTAR
  VALUES ('Debra Winger', 'A way', 'F', '1978-06-05');

INSERT INTO MOVIESTAR
  VALUES ('Jack Nicholson', 'X path', 'M', '1949-05-05');
  
INSERT INTO MOVIESTAR
  VALUES ('Sandra Bullock', 'X path', 'F', '1948-12-05');

------- Insert StarsIn ------------
INSERT INTO STARSIN
  VALUES ('Star Wars', 1977, 'Kim Basinger');

INSERT INTO STARSIN
  VALUES ('Star Wars', 1977, 'Alec Baldwin');

INSERT INTO STARSIN
  VALUES ('Star Wars', 1977, 'Harrison Ford');

INSERT INTO STARSIN
  VALUES ('Empire Strikes Back', 1980, 'Harrison Ford');

INSERT INTO STARSIN
  VALUES ('The Usual Suspects', 1995, 'Jack Nicholson');

INSERT INTO STARSIN
  VALUES ('Terms of Endearment', 1983, 'Jane Fonda');

INSERT INTO STARSIN
  VALUES ('Terms of Endearment', 1983, 'Jack Nicholson');

INSERT INTO STARSIN
  VALUES ('The Usual Suspects', 1995, 'Sandra Bullock')

INSERT INTO MOVIEEXEC VALUES (999, 'Alec Baldwin', 'Some Address 11', 150000000);

INSERT INTO MOVIE VALUES ('Star Trek', 1980, NULL, 'Y', 'Paramount', 222);

UPDATE STUDIO SET PRESC# = 555 WHERE NAME = 'Disney';
UPDATE STUDIO SET PRESC# = 333 WHERE NAME = 'Fox';
UPDATE STUDIO SET PRESC# = 123 WHERE NAME = 'MGM';
UPDATE STUDIO SET PRESC# = 777 WHERE NAME = 'Paramount';
UPDATE STUDIO SET PRESC# = 888 WHERE NAME = 'USA Entertainm.';

GO

CREATE TABLE laptop(
 code int NOT NULL, 
 model varchar(4) NOT NULL, 
 speed decimal(4, 0) NOT NULL,
 ram decimal(4, 0) NOT NULL, 
 hd decimal(3, 0) NOT NULL, 
 price float NOT NULL,
 screen int NOT NULL);
 
 CREATE TABLE pc(
  code int NOT NULL ,
  model varchar(4) NOT NULL ,
  speed decimal(4, 0) NOT NULL ,
  ram decimal(4, 0) NOT NULL ,
  hd decimal(3, 0) NOT NULL ,
  cd varchar(3) NOT NULL ,
  price float NOT NULL 
);

CREATE TABLE product(
  maker char(1) NOT NULL ,
  model varchar(4) NOT NULL ,
  type varchar(7) NOT NULL 
);

CREATE TABLE printer(
  code int NOT NULL ,
  model varchar(4) NOT NULL ,
  color char(1) NOT NULL ,
  type varchar(6) NOT NULL ,
  price float NOT NULL 
);

----Product------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into product values('B','1121','PC');
insert into product values('A','1232','PC');
insert into product values('A','1233','PC');
insert into product values('E','1260','PC');
insert into product values('A','1276','Printer');
insert into product values('D','1288','Printer');
insert into product values('A','1298','Laptop');
insert into product values('C','1321','Laptop');
insert into product values('A','1401','Printer');
insert into product values('A','1408','Printer');
insert into product values('D','1433','Printer');
insert into product values('E','1434','Printer');
insert into product values('B','1750','Laptop');
insert into product values('A','1752','Laptop');
insert into product values('E','2111','PC');
insert into product values('E','2112','PC');
----PC------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into pc values(1,'1232',500,64,5,'12x',600);
insert into pc values(2,'1121',750,128,14,'40x',850);
insert into pc values(3,'1233',500,64,5,'12x',600);
insert into pc values(4,'1121',600,128,14,'40x',850);
insert into pc values(5,'1121',600,128,8,'40x',850);
insert into pc values(6,'1233',750,128,20,'50x',950);
insert into pc values(7,'1232',500,32,10,'12x',400);
insert into pc values(8,'1232',450,64,8,'24x',350);
insert into pc values(9,'1232',450,32,10,'24x',350);
insert into pc values(10,'1260',500,32,10,'12x',350);
insert into pc values(11,'1233',900,128,40,'40x',980);
----Laptop------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into laptop values(1,'1298',350,32,4,700,11);
insert into laptop values(2,'1321',500,64,8,970,12);
insert into laptop values(3,'1750',750,128,12,1200,14);
insert into laptop values(4,'1298',600,64,10,1050,15);
insert into laptop values(5,'1752',750,128,10,1150,14);
insert into laptop values(6,'1298',450,64,10,950,12);
----Printer------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into printer values(1,'1276','n','Laser',400);
insert into printer values(2,'1433','y','Jet',270);
insert into printer values(3,'1434','y','Jet',290);
insert into printer values(4,'1401','n','Matrix',150);
insert into printer values(5,'1408','n','Matrix',270);
insert into printer values(6,'1288','n','Laser',400);


GO

CREATE TABLE BATTLES (
 NAME VARCHAR(20) NOT NULL ,
 DATE DATETIME NOT NULL
);

CREATE TABLE CLASSES(
 CLASS VARCHAR(50) NOT NULL ,
 TYPE VARCHAR(2) NOT NULL ,
 COUNTRY VARCHAR (20) NOT NULL ,
 NUMGUNS INT, 
 BORE REAL, 
 DISPLACEMENT INT
);

CREATE TABLE SHIPS(
 NAME VARCHAR(50) NOT NULL ,
 CLASS VARCHAR(50) NOT NULL ,
 LAUNCHED INT
);

CREATE TABLE OUTCOMES(
 SHIP VARCHAR(50) NOT NULL ,
 BATTLE VARCHAR(20) NOT NULL ,
 RESULT VARCHAR(10) NOT NULL 
);

----- Classes ----- 
INSERT INTO CLASSES
  VALUES ('Bismarck', 'bb', 'Germany', 8, 15, 42000);

INSERT INTO CLASSES
  VALUES ('Iowa', 'bb', 'USA', 9, 16, 46000);

INSERT INTO CLASSES
  VALUES ('Kongo', 'bc', 'Japan', 8, 14, 32000);

INSERT INTO CLASSES
  VALUES ('North Carolina', 'bb', 'USA', 12, 16, 37000);

INSERT INTO CLASSES
  VALUES ('Renown', 'bc', 'Gt.Britain', 6, 15, 32000);

INSERT INTO CLASSES
  VALUES ('Revenge', 'bb', 'Gt.Britain', 8, 15, 29000);

INSERT INTO CLASSES
  VALUES ('Tennessee', 'bb', 'USA', 12, 14, 32000);

INSERT INTO CLASSES
  VALUES ('Yamato', 'bb', 'Japan', 9, 18, 65000);

----- Battles ----- 
INSERT INTO BATTLES
  VALUES ('Guadalcanal', '1942-11-15');

INSERT INTO BATTLES
  VALUES ('North Atlantic', '1941-05-25');

INSERT INTO BATTLES
  VALUES ('North Cape', '1943-12-26');

INSERT INTO BATTLES
  VALUES ('Surigao Strait', '1944-10-25');

----- Ships ----- 
INSERT INTO SHIPS
  VALUES ('California', 'Tennessee', 1921);

INSERT INTO SHIPS
  VALUES ('Haruna', 'Kongo', 1916);

INSERT INTO SHIPS
  VALUES ('Hiei', 'Kongo', 1914);

INSERT INTO SHIPS
  VALUES ('Iowa', 'Iowa', 1943);

INSERT INTO SHIPS
  VALUES ('Kirishima', 'Kongo', 1915);

INSERT INTO SHIPS
  VALUES ('Kongo', 'Kongo', 1913);

INSERT INTO SHIPS
  VALUES ('Missouri', 'Iowa', 1944);

INSERT INTO SHIPS
  VALUES ('Musashi', 'Yamato', 1942);

INSERT INTO SHIPS
  VALUES ('New Jersey', 'Iowa', 1943);

INSERT INTO SHIPS
  VALUES ('North Carolina', 'North Carolina', 1941);

INSERT INTO SHIPS
  VALUES ('Ramillies', 'Revenge', 1917);

INSERT INTO SHIPS
  VALUES ('Renown', 'Renown', 1916);

INSERT INTO SHIPS
  VALUES ('Repulse', 'Renown', 1916);

INSERT INTO SHIPS
  VALUES ('Resolution', 'Renown', 1916);

INSERT INTO SHIPS
  VALUES ('Revenge', 'Revenge', 1916);

INSERT INTO SHIPS
  VALUES ('Royal Oak', 'Revenge', 1916);

INSERT INTO SHIPS
  VALUES ('Royal Sovereign', 'Revenge', 1916);

INSERT INTO SHIPS
  VALUES ('Tennessee', 'Tennessee', 1920);

INSERT INTO SHIPS
  VALUES ('Washington', 'North Carolina', 1941);

INSERT INTO SHIPS
  VALUES ('Wisconsin', 'Iowa', 1944);

INSERT INTO SHIPS
  VALUES ('Yamato', 'Yamato', 1941);
  
INSERT INTO SHIPS
  VALUES ('Yamashiro', 'Yamato', 1947);
  
INSERT INTO SHIPS
  VALUES ('South Dakota', 'North Carolina', 1941);

INSERT INTO SHIPS
  VALUES ('Bismarck', 'North Carolina', 1911);
  
INSERT INTO SHIPS
  VALUES ('Duke of York', 'Renown', 1916);
  
INSERT INTO SHIPS
  VALUES ('Fuso', 'Iowa', 1940);
  
INSERT INTO SHIPS
  VALUES ('Hood', 'Iowa', 1942);
  
INSERT INTO SHIPS
  VALUES ('Rodney', 'Yamato', 1915);
  
INSERT INTO SHIPS
  VALUES ('Yanashiro', 'Yamato', 1918);
  
INSERT INTO SHIPS
  VALUES ('Schamhorst', 'North Carolina', 1917);
  
INSERT INTO SHIPS
  VALUES ('Prince of Wales', 'North Carolina', 1937);
  
INSERT INTO SHIPS
  VALUES ('King George V', 'Iowa', 1942);
  
INSERT INTO SHIPS
  VALUES ('West Virginia', 'Iowa', 1942);

----- Outcomes ----- 
INSERT INTO OUTCOMES
  VALUES ('Bismarck', 'North Atlantic', 'sunk'); 

INSERT INTO OUTCOMES
  VALUES ('California', 'Surigao Strait', 'ok');

INSERT INTO OUTCOMES
  VALUES ('Duke of York', 'North Cape', 'ok');

INSERT INTO OUTCOMES
  VALUES ('Fuso', 'Surigao Strait', 'sunk');

INSERT INTO OUTCOMES
  VALUES ('Hood', 'North Atlantic', 'sunk');

INSERT INTO OUTCOMES
  VALUES ('King George V', 'North Atlantic', 'ok');

INSERT INTO OUTCOMES
  VALUES ('Kirishima', 'Guadalcanal', 'sunk');

INSERT INTO OUTCOMES
  VALUES ('Prince of Wales', 'North Atlantic', 'damaged');

INSERT INTO OUTCOMES
  VALUES ('Rodney', 'North Atlantic', 'ok');

INSERT INTO OUTCOMES
  VALUES ('Schamhorst', 'North Cape', 'sunk');

INSERT INTO OUTCOMES
  VALUES ('South Dakota', 'Guadalcanal', 'damaged');

INSERT INTO OUTCOMES
  VALUES ('Tennessee', 'Surigao Strait', 'ok');

INSERT INTO OUTCOMES
  VALUES ('Washington', 'Guadalcanal', 'ok');

INSERT INTO OUTCOMES
  VALUES ('West Virginia', 'Surigao Strait', 'ok');

INSERT INTO OUTCOMES
  VALUES ('Yamashiro', 'Surigao Strait', 'sunk');

INSERT INTO OUTCOMES
  VALUES ('California', 'Guadalcanal', 'damaged');

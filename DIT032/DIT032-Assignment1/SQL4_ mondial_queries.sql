4.1.
SELECT*
FROM Mountain
WHERE type='Volcanic';

4.2.
SELECT COUNT(*) as VolcanicMountains
FROM Mountain
WHERE type='Volcanic' OR type = 'plateau';

4.3.
SELECT Name
FROM Mountain
WHERE type IS NULL
ORDER BY Name DESC;

4.4.
SELECT DISTINCT name, country 
FROM geo_desert, desert 
WHERE desert = name;


4.5.
SELECT Organization, Country
FROM isMember
WHERE 


SELECT O.Abbrev, C.Code, C.Name, K.Name
FROM Organisation as O, Country as C, Continent as K
WHERE Organisation='G 24' AND Continent='Asia'
UNION
SELECT Country(Code, Name)
FROM Country
WEHRE 

4.6.
ALTER TABLE Lake ADD type char (5);
ALTER TABLE Lake ALTER type SET DEFAULT 'Lake';

ALTER TABLE River ADD type char (5);
ALTER TABLE River ALTER type SET DEFAULT 'River';

ALTER TABLE Sea ADD type char (5);
ALTER TABLE Sea ALTER type SET DEFAULT 'Sea';

SELECT L.Name, L.type, R.Name, R.type, S,Name, S.type
FROM Lake as L, River as R, Sea as S
ORDER BY Name ASC;

4.7.
SELECT Name, AVG(GDP)
FROM Continent
WHERE

4.8.
SELECT Name
FROM Country
WHERE Border=<'100km';

4.9.
SELECT (Country, Percentage, Language)
FROM Language
WHERE Language=English AND Percentage>Percentage(USA);

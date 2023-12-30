USE Arts_Museum;
#1
SELECT * FROM ART_OBJECT;
SELECT * FROM ARTIST;
SELECT * FROM PAINTING;
SELECT * FROM SCULPTURE;
SELECT * FROM STATUE;
SELECT * FROM OTHER;
SELECT * FROM PERMANENT_COLLECTION;
SELECT * FROM BORROWED;
SELECT * FROM EXHIBITION;
SELECT * FROM COLLECTION;
#DISPLAYS all tables
#ART_OBJECT table has a primary key ObjectId.
#ARTIST,PAINTING, SCULPTURE, STATUE,OTHER, PERMANENT_COLLECTION, BORROWED, EXHIBITION 
#table has a foreign key ObjectId that references the primary key in ART_OBJECT.
#The BORROWED table also has foreign key Name that references Name in COLLECTION table.

#2
SELECT Title
From ART_OBJECT AS AO, ARTIST AS A
WHERE AO.ObjectId = A.ObjectId AND A.Name = 'Leonardo da Vinci';
#This query lists all the Title from the ART_OBJECT table where the artist's name is 'Leonardo da Vinci'

#3
SELECT AO.ObjectId, AO.Title, AO.Description, PC.Cost
FROM ART_OBJECT AS AO, PERMANENT_COLLECTION AS PC 
WHERE AO.ObjectId = PC.ObjectId
ORDER BY PC.Cost DESC;
#This query lists the ObjectId, Title, Description, and Cost of permanent objects and orders by cost descending.

#4
SELECT A.Name, AO.Title
FROM ART_OBJECT AS AO, Artist AS A
WHERE AO.ObjectId = A.ObjectId AND AO.ObjectId IN (
    SELECT A.ObjectId
    FROM ARTIST AS A
    WHERE A.Epoch = 'Modern'
);
#the query lists the title and description of art objects, and name of associated artist,
#where epoch is "Modern".

#5.
SELECT AO.Title
FROM ART_OBJECT AS AO
JOIN PERMANENT_COLLECTION AS PC ON AO.ObjectId = PC.ObjectId
WHERE PC.Status = 'On Display';
#the query lists the title of all the objects that are on display.

#6/7
UPDATE PERMANENT_COLLECTION 
SET cost = cost + 1000
WHERE	ObjectId = 1;
#The UPDATE statement adds 1000 to cost of the object where Object ID is 4
DELIMITER //
DROP TRIGGER IF EXISTS check_year_before_insert;
CREATE TRIGGER check_year_before_insert
BEFORE INSERT ON ART_OBJECT
FOR EACH ROW
BEGIN
    DECLARE artist_birth DATE;
    DECLARE artist_death DATE;

    SELECT DateBorn, DateDied
    INTO artist_birth, artist_death
    FROM ARTIST
    WHERE ObjectId = NEW.ObjectId;

    IF NEW.Year < artist_birth OR (artist_death IS NOT NULL AND NEW.Year > artist_death) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Year must be between artist''s birth and death dates';
    END IF;
END;
//
DELIMITER ;
#This trigger compares year the painting is made and birth and death year of artist 
#if it is not between birth and death years it will display error message and data is not inserted.




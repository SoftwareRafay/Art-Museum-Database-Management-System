DROP DATABASE IF EXISTS Arts_Museum;
CREATE DATABASE Arts_Museum; 
USE Arts_Museum;
CREATE TABLE ART_OBJECT 
(   ObjectId 				INT 					NOT NULL,
    Year 					INT,
    Title 					VARCHAR(50),
    Description 			TEXT,
PRIMARY KEY(ObjectId));

CREATE TABLE ARTIST 
(   ObjectId 				INT 					NOT NULL,
    Name					VARCHAR(50) 			NOT NULL,
    DateBorn 				DATE,
    DateDied 				DATE,
    Country_Origin 			VARCHAR(50),
    Epoch 					VARCHAR(50),
    MainStyle 				VARCHAR(50),
    Description 			TEXT,
UNIQUE (Name),
FOREIGN KEY (ObjectId) REFERENCES ART_OBJECT(ObjectId) ON DELETE CASCADE);


CREATE TABLE PAINTING 
(   ObjectId 				INT 					NOT NULL,
    PaintType 				VARCHAR(50),
    Material 				VARCHAR(50),
    Style					VARCHAR(50),
FOREIGN KEY (ObjectId) REFERENCES ART_OBJECT(ObjectId));

CREATE TABLE SCULPTURE 
(   ObjectId 				INT 					NOT NULL,
    Material 				VARCHAR(50),
    Height 					DECIMAL(10,2),
    Weight 					DECIMAL(10,2),
    Style 					VARCHAR(50),
FOREIGN KEY (ObjectId) REFERENCES ART_OBJECT(ObjectId) ON DELETE CASCADE);

CREATE TABLE STATUE 
(   ObjectId 				INT 					NOT NULL,
    Material 				VARCHAR(50),
    Height 					DECIMAL(10,2),
    Weight 					DECIMAL(10,2),
    Style 					VARCHAR(50),
FOREIGN KEY (ObjectId) REFERENCES ART_OBJECT(ObjectId) ON DELETE CASCADE);

CREATE TABLE OTHER 
(   ObjectId 				INT 					NOT NULL,
    Type 					VARCHAR(20),
    Style 					VARCHAR(50),
FOREIGN KEY (ObjectId) REFERENCES ART_OBJECT(ObjectId) ON DELETE CASCADE);

CREATE TABLE PERMANENT_COLLECTION 
(   ObjectId 				INT 					NOT NULL,
    DateAcquired			DATE,
    Status 					VARCHAR(20),
    Cost 					DECIMAL(10,2),
FOREIGN KEY (ObjectId) REFERENCES ART_OBJECT(ObjectId));

CREATE TABLE COLLECTION 
(   Name 					VARCHAR(50) 			NOT NULL,
    Type 					VARCHAR(50),
    Description 			TEXT,
    Address 				VARCHAR(50),
    Phone 					VARCHAR(20),
    ContactPerson 			VARCHAR(50),
    UNIQUE(Name));

CREATE TABLE BORROWED 
(	ObjectId 				INT 					NOT NULL,
	Name 					VARCHAR(50)			NOT NULL,
	DateBorrowed 			DATE,
    DateReturned 			DATE,
FOREIGN KEY (Name) REFERENCES COLLECTION(Name),
FOREIGN KEY (ObjectId) REFERENCES ART_OBJECT(ObjectId) ON DELETE CASCADE);


CREATE TABLE EXHIBITION 
(	ObjectId 				INT 					NOT NULL,
    Name 					VARCHAR(50)			NOT NULL,
    StartDate 				DATE,
    EndDate 				DATE,
FOREIGN KEY (ObjectId) REFERENCES ART_OBJECT(ObjectId) ON DELETE CASCADE);    

INSERT INTO ART_OBJECT
VALUES
    (1, 2000, 'Modern Sculpture', 'A beautiful abstract Sclpture'),
    (2, 1503, 'Mona lisa', 'Considered one of the most famous artworks'),
    (3, 1995, 'Ancient Statue', 'A statue from an ancient civilization'),
    (4, 2023, 'Carpet Art', 'A beautiful traditional carpet'),
	(5, 1889, 'The Starry Night', 'Painting by Vincent van Gogh depicting a swirling night sky');




INSERT INTO ARTIST
VALUES
    (1, 'John Smith', '1960-01-01', NULL, 'United States', 'Modern', 'Classic', 'A contemporary artist'),
    (2, 'Leonardo da Vinci', '1452-04-15', '1519-05-02', 'Italy', 'Contemporary', 'Abstract', 'A renowned painter'),
    (3, 'Steve Jacob', '1975-07-21', NULL, 'Germany', 'Ancient', 'Sculpture', 'An artist known for Sculptures'),
    (4, 'Carpet Man', '1970-01-01', '2022-01-01','Turkey', 'Traditional', 'Carpet Art', 'The artist behind the carpet'),
    (5, 'Vincent van Gogh', '1853-03-30', '1890-07-29','Netherlands', 'Modern Art', 'Post-Impressionism', 'Dutch painter');

INSERT INTO PAINTING
VALUES
    (2, 'Oil', 'Wood', 'Contemporary'),
    (5, 'water', 'canvas', 'Modern Art');

INSERT INTO SCULPTURE
VALUES
    (1, 'Metal', 120.5, 200.0, 'Classic');

INSERT INTO STATUE
VALUES
    (3, 'Bronze', 150.0, 300.0, 'Sculpture');

INSERT INTO OTHER
VALUES (4, 'Carpet', 'Traditional');

INSERT INTO PERMANENT_COLLECTION
VALUES
    (1, '2022-01-15', 'On Display', 5000.00),
    (2, '2010-06-20', 'On Display', 10000.00),
    (5, '2010-07-20', 'On Display', 7000.00);
    
INSERT INTO COLLECTION
VALUES
    ('Ancient Statue', 'personal', 'A statue from an ancient civilization', '123 Main St', '123-1234', 'My SQL'),
    ('Carpet Art', 'Public', 'A beautiful traditional carpet', '789 Old St', '987-6543', 'Muhammad ali');

INSERT INTO BORROWED 
VALUES
    (3, 'Ancient Statue','2005-02-20', '2006-07-20'),
    (4,'Carpet Art', '2023-01-01', '2023-02-01');

INSERT INTO EXHIBITION
VALUES
    (1, 'Modern Painting', '2022-05-01', '2022-06-01'),
    (2, 'Mona lisa', '2010-08-15', '2010-09-15'),
    (3, 'Ancient Statue', '2006-02-20', '2006-04-01');


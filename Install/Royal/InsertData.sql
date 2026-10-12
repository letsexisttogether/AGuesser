DELETE FROM Users;
INSERT INTO Users (Name, Email) VALUES
('Alex', 'letmeexist95@gmail.com'),
('Someone', 'SomeEmail@gmail.com'),
('EndRow', 'EndRowEmail@gmail.com');

DELETE FROM Rarities;
INSERT INTO Rarities (Name, Rank) VALUES 
('Common', 1),
('Rare', 2),
('Epic', 3),
('Legendary', 4),
('Champion', 5);

DELETE FROM RangeTypes;
INSERT INTO RangeTypes (Name, Rank) VALUES 
('-', 0),
('Melee', 1),
('Short', 2),
('Medium', 3),
('Long', 4);

DELETE FROM Speeds;
INSERT INTO Speeds (Name, Rank) VALUES 
('-', 0),
('Slow', 1),
('Medium', 2),
('Fast', 3),
('VeryFast', 4);

DELETE FROM Cards;
INSERT INTO Cards (Name) VALUES
('Archer Queen'),
('Golden Knight'),
('Skeleton King'),
('Mighty Miner'),
('Monk'),
('Little Prince'),
('Goblinstein'),
('Boss Bandit'),
('The Log'),
('Electro Wizard'),
('Hog Rider'),
('P.E.K.K.A'),
('Knight');


DELETE FROM CardTraits;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT 
    (SELECT ID FROM Cards WHERE Name = 'Archer Queen'), 
    5, 
    (SELECT ID FROM Rarities WHERE Name = 'Champion'), 
    'Ground', 
    (SELECT ID FROM RangeTypes WHERE Name = 'Medium'), 
    (SELECT ID FROM Speeds WHERE Name = 'Medium'), 
    2021;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT 
    (SELECT ID FROM Cards WHERE Name = 'Golden Knight'), 
    4, 
    (SELECT ID FROM Rarities WHERE Name = 'Champion'), 
    'Ground', 
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'), 
    (SELECT ID FROM Speeds WHERE Name = 'Fast'), 
    2021;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT 
    (SELECT ID FROM Cards WHERE Name = 'Skeleton King'), 
    4, 
    (SELECT ID FROM Rarities WHERE Name = 'Champion'), 
    'Ground', 
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'), 
    (SELECT ID FROM Speeds WHERE Name = 'Medium'), 
    2021;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT 
    (SELECT ID FROM Cards WHERE Name = 'Mighty Miner'), 
    4, 
    (SELECT ID FROM Rarities WHERE Name = 'Champion'), 
    'Ground', 
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'), 
    (SELECT ID FROM Speeds WHERE Name = 'Fast'), 
    2022;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT 
    (SELECT ID FROM Cards WHERE Name = 'Monk'), 
    5, 
    (SELECT ID FROM Rarities WHERE Name = 'Champion'), 
    'Ground', 
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'), 
    (SELECT ID FROM Speeds WHERE Name = 'Medium'), 
    2022;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT 
    (SELECT ID FROM Cards WHERE Name = 'Little Prince'), 
    3, 
    (SELECT ID FROM Rarities WHERE Name = 'Champion'), 
    'Air & Ground', 
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'), 
    (SELECT ID FROM Speeds WHERE Name = 'Fast'), 
    2023;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT 
    (SELECT ID FROM Cards WHERE Name = 'Goblinstein'), 
    5, 
    (SELECT ID FROM Rarities WHERE Name = 'Champion'), 
    'Air & Ground', 
    (SELECT ID FROM RangeTypes WHERE Name = 'Medium'), 
    (SELECT ID FROM Speeds WHERE Name = 'Medium'), 
    2024;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT 
    (SELECT ID FROM Cards WHERE Name = 'Boss Bandit'), 
    6, 
    (SELECT ID FROM Rarities WHERE Name = 'Champion'), 
    'Ground', 
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'), 
    (SELECT ID FROM Speeds WHERE Name = 'Fast'), 
    2026;

-- Others (The Log, Electro Wizard, Hog Rider, P.E.K.K.A, Knight)
INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT 
    (SELECT ID FROM Cards WHERE Name = 'The Log'), 
    2, 
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'), 
    'Ground', 
    (SELECT ID FROM RangeTypes WHERE Name = '-'), 
    (SELECT ID FROM Speeds WHERE Name = '-'), 
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT 
    (SELECT ID FROM Cards WHERE Name = 'Electro Wizard'), 
    4, 
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'), 
    'Air & Ground', 
    (SELECT ID FROM RangeTypes WHERE Name = 'Medium'), 
    (SELECT ID FROM Speeds WHERE Name = 'Fast'), 
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT 
    (SELECT ID FROM Cards WHERE Name = 'Hog Rider'), 
    4, 
    (SELECT ID FROM Rarities WHERE Name = 'Rare'), 
    'Buildings', 
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'), 
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'), 
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT 
    (SELECT ID FROM Cards WHERE Name = 'P.E.K.K.A'), 
    7, 
    (SELECT ID FROM Rarities WHERE Name = 'Epic'), 
    'Ground', 
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'), 
    (SELECT ID FROM Speeds WHERE Name = 'Slow'), 
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT 
    (SELECT ID FROM Cards WHERE Name = 'Knight'), 
    3, 
    (SELECT ID FROM Rarities WHERE Name = 'Common'), 
    'Ground', 
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'), 
    (SELECT ID FROM Speeds WHERE Name = 'Medium'), 
    2016;

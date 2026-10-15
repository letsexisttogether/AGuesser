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
('Archers'),
('Arrows'),
('Baby Dragon'),
('Balloon'),
('Bandit'),
('Barbarian Barrel'),
('Barbarian Hut'),
('Barbarians'),
('Bats'),
('Battle Healer'),
('Battle Ram'),
('Berserker'),
('Bomber'),
('Bomb Tower'),
('Boss Bandit'),
('Bowler'),
('Cannon'),
('Cannon Cart'),
('Clone'),
('Dark Prince'),
('Dart Goblin'),
('Earthquake'),
('Electro Dragon'),
('Electro Giant'),
('Electro Spirit'),
('Electro Wizard'),
('Elite Barbarians'),
('Elixir Collector'),
('Elixir Golem'),
('Executioner'),
('Fire Spirit'),
('Fireball'),
('Firecracker'),
('Fisherman'),
('Flying Machine'),
('Freeze'),
('Furnace'),
('Giant'),
('Giant Skeleton'),
('Giant Snowball'),
('Goblin Barrel'),
('Goblin Cage'),
('Goblin Curse'),
('Goblin Demolisher'),
('Goblin Drill'),
('Goblin Gang'),
('Goblin Giant'),
('Goblin Hut'),
('Goblin Machine'),
('Goblins'),
('Goblinstein'),
('Golden Knight'),
('Golem'),
('Graveyard'),
('Guards'),
('Heal Spirit'),
('Hog Rider'),
('Hunter'),
('Ice Golem'),
('Ice Spirit'),
('Ice Wizard'),
('Inferno Dragon'),
('Inferno Tower'),
('Knight'),
('Lava Hound'),
('Lightning'),
('Little Prince'),
('Lumberjack'),
('Magic Archer'),
('Mega Knight'),
('Mega Minion'),
('Mighty Miner'),
('Miner'),
('Mini P.E.K.K.A.'),
('Minion Horde'),
('Minions'),
('Mirror'),
('Monk'),
('Mortar'),
('Mother Witch'),
('Musketeer'),
('Night Witch'),
('P.E.K.K.A.'),
('Phoenix'),
('Poison'),
('Prince'),
('Princess'),
('Rage'),
('Ram Rider'),
('Rascals'),
('Rocket'),
('Ronin'),
('Royal Delivery'),
('Royal Ghost'),
('Royal Giant'),
('Royal Hogs'),
('Royal Recruits'),
('Rune Giant'),
('Skeleton Army'),
('Skeleton Barrel'),
('Skeleton Dragons'),
('Skeleton King'),
('Skeletons'),
('Sparky'),
('Spear Goblins'),
('Spirit Empress'),
('Suspicious Bush'),
('Tesla'),
('The Log'),
('Three Musketeers'),
('Tombstone'),
('Tornado'),
('Valkyrie'),
('Vines'),
('Void'),
('Wall Breakers'),
('Witch'),
('Wizard'),
('X-Bow'),
('Zap'),
('Zappies');


DELETE FROM CardTraits;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Archer Queen'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Champion'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2021;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Archers'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Arrows'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Baby Dragon'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Medium'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Balloon'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Bandit'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2017;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Barbarian Barrel'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2018;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Barbarian Hut'),
    6,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Barbarians'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Bats'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'),
    2017;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Battle Healer'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2020;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Battle Ram'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2017;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Berserker'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2025;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Bomber'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Medium'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Bomb Tower'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Boss Bandit'),
    6,
    (SELECT ID FROM Rarities WHERE Name = 'Champion'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2025;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Bowler'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Medium'),
    (SELECT ID FROM Speeds WHERE Name = 'Slow'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Cannon'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Cannon Cart'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2017;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Clone'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Friendly Troops',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Dark Prince'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Dart Goblin'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'),
    2017;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Earthquake'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2019;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Electro Dragon'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Medium'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2018;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Electro Giant'),
    7,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Slow'),
    2020;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Electro Spirit'),
    1,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Short'),
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'),
    2020;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Electro Wizard'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Elite Barbarians'),
    6,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Elixir Collector'),
    6,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    '-',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Elixir Golem'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Slow'),
    2019;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Executioner'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Medium'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2017;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Fire Spirit'),
    1,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Short'),
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Fireball'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Firecracker'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2020;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Fisherman'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2019;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Flying Machine'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2017;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Freeze'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Furnace'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2025;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Giant'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Slow'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Giant Skeleton'),
    6,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Giant Snowball'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2018;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Goblin Barrel'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Goblin Cage'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2019;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Goblin Curse'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2024;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Goblin Demolisher'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2024;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Goblin Drill'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2021;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Goblin Gang'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'),
    2017;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Goblin Giant'),
    6,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2018;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Goblin Hut'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Goblin Machine'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2024;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Goblins'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Goblinstein'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Champion'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2024;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Golden Knight'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Champion'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2021;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Golem'),
    8,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Slow'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Graveyard'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Guards'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Heal Spirit'),
    1,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Short'),
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'),
    2020;

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
    (SELECT ID FROM Cards WHERE Name = 'Hunter'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Medium'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2017;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Ice Golem'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Slow'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Ice Spirit'),
    1,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Short'),
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Ice Wizard'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Inferno Dragon'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Medium'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Inferno Tower'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
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

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Lava Hound'),
    7,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Medium'),
    (SELECT ID FROM Speeds WHERE Name = 'Slow'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Lightning'),
    6,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Little Prince'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Champion'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2023;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Lumberjack'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Magic Archer'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2018;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Mega Knight'),
    7,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2017;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Mega Minion'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Mighty Miner'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Champion'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2022;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Miner'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Mini P.E.K.K.A.'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Minion Horde'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Minions'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Mirror'),
    1,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    '-',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

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
    (SELECT ID FROM Cards WHERE Name = 'Mortar'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Mother Witch'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2020;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Musketeer'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Night Witch'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2017;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'P.E.K.K.A.'),
    7,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Slow'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Phoenix'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2022;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Poison'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Prince'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Princess'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Rage'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Friendly Troops',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Ram Rider'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2018;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Rascals'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2018;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Rocket'),
    6,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Ronin'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2026;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Royal Delivery'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2020;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Royal Ghost'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2018;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Royal Giant'),
    6,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Slow'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Royal Hogs'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'),
    2018;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Royal Recruits'),
    7,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2017;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Rune Giant'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2025;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Skeleton Army'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Skeleton Barrel'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2017;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Skeleton Dragons'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Medium'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2020;

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
    (SELECT ID FROM Cards WHERE Name = 'Skeletons'),
    1,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Sparky'),
    6,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Slow'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Spear Goblins'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'),
    2016;

-- Spirit Empress has two forms.
-- This row represents Air Form: 6 Elixir / Air & Ground / range 5 / Medium.
INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Spirit Empress'),
    6,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2025;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Suspicious Bush'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2024;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Tesla'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

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
    (SELECT ID FROM Cards WHERE Name = 'Three Musketeers'),
    9,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Tombstone'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Tornado'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Valkyrie'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Vines'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2025;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Void'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2024;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Wall Breakers'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'),
    2019;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Witch'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Wizard'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'X-Bow'),
    6,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Zap'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Zappies'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2017;


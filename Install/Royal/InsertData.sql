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
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Archer Queen'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Champion'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2021;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Archers'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Arrows'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Spell',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Baby Dragon'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Medium'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Balloon'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Troop',
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Bandit'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2017;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Barbarian Barrel'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Spell',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2018;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Barbarian Hut'),
    6,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Building',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Barbarians'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Bats'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'),
    2017;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Battle Healer'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2020;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Battle Ram'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Troop',
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2017;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Berserker'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2025;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Bomber'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Medium'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Bomb Tower'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Building',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Boss Bandit'),
    6,
    (SELECT ID FROM Rarities WHERE Name = 'Champion'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2025;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Bowler'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Medium'),
    (SELECT ID FROM Speeds WHERE Name = 'Slow'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Cannon'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Building',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Cannon Cart'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2017;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Clone'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Spell',
    'Friendly Troops',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Dark Prince'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Dart Goblin'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'),
    2017;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Earthquake'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Spell',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2019;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Electro Dragon'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Medium'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2018;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Electro Giant'),
    7,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Troop',
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Slow'),
    2020;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Electro Spirit'),
    1,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Short'),
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'),
    2020;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Electro Wizard'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Elite Barbarians'),
    6,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Elixir Collector'),
    6,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Building',
    '-',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Elixir Golem'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Troop',
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Slow'),
    2019;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Executioner'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Medium'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2017;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Fire Spirit'),
    1,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Short'),
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Fireball'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Spell',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Firecracker'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2020;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Fisherman'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2019;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Flying Machine'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2017;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Freeze'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Spell',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Furnace'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2025;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Giant'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Troop',
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Slow'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Giant Skeleton'),
    6,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Giant Snowball'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Spell',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2018;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Goblin Barrel'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Spell',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Goblin Cage'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Building',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2019;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Goblin Curse'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Spell',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2024;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Goblin Demolisher'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2024;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Goblin Drill'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Building',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2021;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Goblin Gang'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'),
    2017;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Goblin Giant'),
    6,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Troop',
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2018;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Goblin Hut'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Building',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Goblin Machine'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2024;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Goblins'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Goblinstein'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Champion'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2024;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Golden Knight'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Champion'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2021;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Golem'),
    8,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Troop',
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Slow'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Graveyard'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Spell',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Guards'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Heal Spirit'),
    1,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Short'),
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'),
    2020;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Hog Rider'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Troop',
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Hunter'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Medium'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2017;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Ice Golem'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Troop',
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Slow'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Ice Spirit'),
    1,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Short'),
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Ice Wizard'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Inferno Dragon'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Medium'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Inferno Tower'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Building',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Knight'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Lava Hound'),
    7,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Troop',
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Medium'),
    (SELECT ID FROM Speeds WHERE Name = 'Slow'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Lightning'),
    6,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Spell',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Little Prince'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Champion'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2023;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Lumberjack'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Magic Archer'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2018;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Mega Knight'),
    7,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2017;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Mega Minion'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Mighty Miner'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Champion'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2022;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Miner'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Mini P.E.K.K.A.'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Minion Horde'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Minions'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Mirror'),
    1,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Spell',
    '-',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Monk'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Champion'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2022;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Mortar'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Building',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Mother Witch'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2020;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Musketeer'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Night Witch'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2017;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'P.E.K.K.A.'),
    7,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Slow'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Phoenix'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2022;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Poison'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Spell',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Prince'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Princess'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Rage'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Spell',
    'Friendly Troops',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Ram Rider'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Troop',
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2018;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Rascals'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2018;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Rocket'),
    6,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Spell',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits
    (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Ronin'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2026;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Royal Delivery'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Spell',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2020;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Royal Ghost'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2018;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Royal Giant'),
    6,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Troop',
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Slow'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Royal Hogs'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Troop',
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'),
    2018;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Royal Recruits'),
    7,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2017;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Rune Giant'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Troop',
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2025;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Skeleton Army'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Skeleton Barrel'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Troop',
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2017;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Skeleton Dragons'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Medium'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2020;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Skeleton King'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Champion'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2021;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Skeletons'),
    1,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Fast'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Sparky'),
    6,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Slow'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Spear Goblins'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'),
    2016;

-- Spirit Empress has two forms.
-- This row represents Air Form: 6 Elixir / Air & Ground / range 5 / Medium.
INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Spirit Empress'),
    6,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2025;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Suspicious Bush'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Troop',
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2024;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Tesla'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Building',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'The Log'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Legendary'),
    'Spell',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Three Musketeers'),
    9,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Tombstone'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Building',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Tornado'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Spell',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Valkyrie'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Troop',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Vines'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Spell',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2025;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Void'),
    3,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Spell',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2024;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Wall Breakers'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Troop',
    'Buildings',
    (SELECT ID FROM RangeTypes WHERE Name = 'Melee'),
    (SELECT ID FROM Speeds WHERE Name = 'VeryFast'),
    2019;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Witch'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Wizard'),
    5,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'X-Bow'),
    6,
    (SELECT ID FROM Rarities WHERE Name = 'Epic'),
    'Building',
    'Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Zap'),
    2,
    (SELECT ID FROM Rarities WHERE Name = 'Common'),
    'Spell',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = '-'),
    (SELECT ID FROM Speeds WHERE Name = '-'),
    2016;

INSERT INTO CardTraits (CardID, ElixirCost, RarityID, CardType, Targets, RangeTypeID, SpeedID, ReleaseYear)
SELECT
    (SELECT ID FROM Cards WHERE Name = 'Zappies'),
    4,
    (SELECT ID FROM Rarities WHERE Name = 'Rare'),
    'Troop',
    'Air & Ground',
    (SELECT ID FROM RangeTypes WHERE Name = 'Long'),
    (SELECT ID FROM Speeds WHERE Name = 'Medium'),
    2017;

DELETE FROM CardDescriptions;

INSERT INTO CardDescriptions (CardID, Description) VALUES
((SELECT ID FROM Cards WHERE Name = 'Archer Queen'), 'A ranged champion with rapid crossbow fire and a temporary invisibility ability.'),
((SELECT ID FROM Cards WHERE Name = 'Archers'), 'Two ranged fighters who attack both ground and air targets.'),
((SELECT ID FROM Cards WHERE Name = 'Arrows'), 'A wide-area spell that rains arrows on ground and air enemies.'),
((SELECT ID FROM Cards WHERE Name = 'Baby Dragon'), 'A flying troop that breathes splash-damage fire at ground and air targets.'),
((SELECT ID FROM Cards WHERE Name = 'Balloon'), 'A flying building-targeting win condition that drops a powerful bomb.'),
((SELECT ID FROM Cards WHERE Name = 'Bandit'), 'A fast melee attacker who dashes to enemies and becomes untargetable during the dash.'),
((SELECT ID FROM Cards WHERE Name = 'Barbarian Barrel'), 'A rolling barrel that damages ground enemies and releases a Barbarian.'),
((SELECT ID FROM Cards WHERE Name = 'Barbarian Hut'), 'A building that periodically spawns Barbarians.'),
((SELECT ID FROM Cards WHERE Name = 'Barbarians'), 'A group of sturdy melee fighters with strong combined damage.'),
((SELECT ID FROM Cards WHERE Name = 'Bats'), 'A cheap swarm of very fast flying attackers.'),
((SELECT ID FROM Cards WHERE Name = 'Battle Healer'), 'A melee support troop that heals nearby allies while fighting.'),
((SELECT ID FROM Cards WHERE Name = 'Battle Ram'), 'A charging building-targeting ram that releases two Barbarians when destroyed.'),
((SELECT ID FROM Cards WHERE Name = 'Berserker'), 'A fast melee fighter focused on aggressive close-range pressure.'),
((SELECT ID FROM Cards WHERE Name = 'Bomber'), 'A fragile ranged troop that throws bombs for ground splash damage.'),
((SELECT ID FROM Cards WHERE Name = 'Bomb Tower'), 'A defensive building that lobs bombs at ground troops and explodes on destruction.'),
((SELECT ID FROM Cards WHERE Name = 'Boss Bandit'), 'A champion-style melee fighter built around mobility, pressure, and evasive attacks.'),
((SELECT ID FROM Cards WHERE Name = 'Bowler'), 'A heavy ranged troop whose boulders damage and knock back ground enemies.'),
((SELECT ID FROM Cards WHERE Name = 'Cannon'), 'A cheap defensive building that attacks ground units.'),
((SELECT ID FROM Cards WHERE Name = 'Cannon Cart'), 'A mobile cannon that becomes a stationary cannon after its shield breaks.'),
((SELECT ID FROM Cards WHERE Name = 'Clone'), 'A spell that creates fragile copies of friendly troops in its area.'),
((SELECT ID FROM Cards WHERE Name = 'Dark Prince'), 'A shielded splash-damage melee fighter who can charge.'),
((SELECT ID FROM Cards WHERE Name = 'Dart Goblin'), 'A very fast ranged Goblin with long reach and rapid attacks.'),
((SELECT ID FROM Cards WHERE Name = 'Earthquake'), 'A ground-only spell that repeatedly damages enemies and is especially effective against buildings.'),
((SELECT ID FROM Cards WHERE Name = 'Electro Dragon'), 'A flying troop whose lightning attack chains between nearby targets.'),
((SELECT ID FROM Cards WHERE Name = 'Electro Giant'), 'A slow building-targeting tank that shocks nearby attackers.'),
((SELECT ID FROM Cards WHERE Name = 'Electro Spirit'), 'A one-Elixir spirit that jumps and chains a stunning electric attack.'),
((SELECT ID FROM Cards WHERE Name = 'Electro Wizard'), 'A ranged troop that stuns on deployment and attacks two targets at once.'),
((SELECT ID FROM Cards WHERE Name = 'Elite Barbarians'), 'Two fast, hard-hitting melee fighters.'),
((SELECT ID FROM Cards WHERE Name = 'Elixir Collector'), 'A building that generates additional Elixir over time.'),
((SELECT ID FROM Cards WHERE Name = 'Elixir Golem'), 'A cheap tank that splits into smaller forms and eventually gives Elixir to the opponent.'),
((SELECT ID FROM Cards WHERE Name = 'Executioner'), 'A ranged troop whose returning axe damages enemies twice.'),
((SELECT ID FROM Cards WHERE Name = 'Fire Spirit'), 'A cheap spirit that jumps onto enemies and explodes for area damage.'),
((SELECT ID FROM Cards WHERE Name = 'Fireball'), 'A spell that deals strong area damage and knockback.'),
((SELECT ID FROM Cards WHERE Name = 'Firecracker'), 'A long-range troop whose explosive shots damage groups and push her backward.'),
((SELECT ID FROM Cards WHERE Name = 'Fisherman'), 'A melee troop who uses a hook to pull enemies or pull himself toward buildings.'),
((SELECT ID FROM Cards WHERE Name = 'Flying Machine'), 'A flying ranged troop with long reach.'),
((SELECT ID FROM Cards WHERE Name = 'Freeze'), 'A spell that temporarily freezes enemy troops and buildings.'),
((SELECT ID FROM Cards WHERE Name = 'Furnace'), 'A fire-based ranged troop used for steady pressure.'),
((SELECT ID FROM Cards WHERE Name = 'Giant'), 'A large tank that ignores troops and targets buildings.'),
((SELECT ID FROM Cards WHERE Name = 'Giant Skeleton'), 'A heavy melee troop that drops a powerful bomb when defeated.'),
((SELECT ID FROM Cards WHERE Name = 'Giant Snowball'), 'A cheap spell that damages, slows, and knocks back enemies.'),
((SELECT ID FROM Cards WHERE Name = 'Goblin Barrel'), 'A spell that launches three Goblins anywhere in the arena.'),
((SELECT ID FROM Cards WHERE Name = 'Goblin Cage'), 'A defensive building that releases a Goblin Brawler when destroyed.'),
((SELECT ID FROM Cards WHERE Name = 'Goblin Curse'), 'A spell that weakens affected enemies and can turn defeated troops into Goblins.'),
((SELECT ID FROM Cards WHERE Name = 'Goblin Demolisher'), 'A ranged ground troop that becomes more dangerous as it nears defeat.'),
((SELECT ID FROM Cards WHERE Name = 'Goblin Drill'), 'A deployable building that repeatedly spawns Goblins.'),
((SELECT ID FROM Cards WHERE Name = 'Goblin Gang'), 'A mixed swarm of melee Goblins and Spear Goblins.'),
((SELECT ID FROM Cards WHERE Name = 'Goblin Giant'), 'A building-targeting tank carrying Spear Goblins for ranged support.'),
((SELECT ID FROM Cards WHERE Name = 'Goblin Hut'), 'A building that periodically spawns Spear Goblins.'),
((SELECT ID FROM Cards WHERE Name = 'Goblin Machine'), 'A mechanical Goblin troop combining close combat with rocket support.'),
((SELECT ID FROM Cards WHERE Name = 'Goblins'), 'A cheap group of very fast melee Goblins.'),
((SELECT ID FROM Cards WHERE Name = 'Goblinstein'), 'A champion duo combining a durable monster with an electric ranged scientist.'),
((SELECT ID FROM Cards WHERE Name = 'Golden Knight'), 'A champion melee fighter whose ability dashes through multiple nearby enemies.'),
((SELECT ID FROM Cards WHERE Name = 'Golem'), 'A massive building-targeting tank that splits into Golemites when destroyed.'),
((SELECT ID FROM Cards WHERE Name = 'Graveyard'), 'A spell that continuously summons Skeletons around a selected area.'),
((SELECT ID FROM Cards WHERE Name = 'Guards'), 'Three shielded Skeletons that can survive an extra hit.'),
((SELECT ID FROM Cards WHERE Name = 'Heal Spirit'), 'A cheap jumping spirit that damages enemies and heals nearby allies.'),
((SELECT ID FROM Cards WHERE Name = 'Hog Rider'), 'A very fast building-targeting rider who can jump over the river.'),
((SELECT ID FROM Cards WHERE Name = 'Hunter'), 'A ranged troop whose shotgun-like attack is strongest at close range.'),
((SELECT ID FROM Cards WHERE Name = 'Ice Golem'), 'A cheap building-targeting mini tank that slows nearby enemies when defeated.'),
((SELECT ID FROM Cards WHERE Name = 'Ice Spirit'), 'A one-Elixir spirit that jumps onto enemies and briefly freezes them.'),
((SELECT ID FROM Cards WHERE Name = 'Ice Wizard'), 'A ranged legendary troop whose attacks slow enemies.'),
((SELECT ID FROM Cards WHERE Name = 'Inferno Dragon'), 'A flying troop whose beam increases in damage while locked onto one target.'),
((SELECT ID FROM Cards WHERE Name = 'Inferno Tower'), 'A defensive building whose beam ramps up to extreme single-target damage.'),
((SELECT ID FROM Cards WHERE Name = 'Knight'), 'A reliable inexpensive melee fighter with solid health and damage.'),
((SELECT ID FROM Cards WHERE Name = 'Lava Hound'), 'A flying building-targeting tank that bursts into Lava Pups when defeated.'),
((SELECT ID FROM Cards WHERE Name = 'Lightning'), 'A heavy spell that strikes the three highest-hitpoint targets in its area.'),
((SELECT ID FROM Cards WHERE Name = 'Little Prince'), 'A ranged champion who attacks faster over time and can summon his Guardian.'),
((SELECT ID FROM Cards WHERE Name = 'Lumberjack'), 'A very fast melee fighter who drops a Rage effect when defeated.'),
((SELECT ID FROM Cards WHERE Name = 'Magic Archer'), 'A long-range troop whose piercing arrows pass through multiple targets.'),
((SELECT ID FROM Cards WHERE Name = 'Mega Knight'), 'A heavy splash-damage tank that lands with area damage and leaps onto distant enemies.'),
((SELECT ID FROM Cards WHERE Name = 'Mega Minion'), 'A durable flying melee troop with strong single-target damage.'),
((SELECT ID FROM Cards WHERE Name = 'Mighty Miner'), 'A champion whose drill damage ramps up and whose ability lets him switch lanes.'),
((SELECT ID FROM Cards WHERE Name = 'Miner'), 'A legendary melee troop that can be deployed anywhere in the arena.'),
((SELECT ID FROM Cards WHERE Name = 'Mini P.E.K.K.A.'), 'A fast melee attacker with very high single-target damage.'),
((SELECT ID FROM Cards WHERE Name = 'Minion Horde'), 'A large group of flying Minions with enormous combined damage.'),
((SELECT ID FROM Cards WHERE Name = 'Minions'), 'Three inexpensive flying attackers.'),
((SELECT ID FROM Cards WHERE Name = 'Mirror'), 'A spell that repeats the last card played at a higher Elixir cost.'),
((SELECT ID FROM Cards WHERE Name = 'Monk'), 'A champion melee fighter whose ability reduces incoming damage and reflects projectiles.'),
((SELECT ID FROM Cards WHERE Name = 'Mortar'), 'A long-range building capable of attacking enemy towers from your side.'),
((SELECT ID FROM Cards WHERE Name = 'Mother Witch'), 'A ranged troop that curses enemies and turns defeated cursed troops into Cursed Hogs.'),
((SELECT ID FROM Cards WHERE Name = 'Musketeer'), 'A dependable ranged troop that attacks both ground and air targets.'),
((SELECT ID FROM Cards WHERE Name = 'Night Witch'), 'A melee legendary troop that periodically summons Bats.'),
((SELECT ID FROM Cards WHERE Name = 'P.E.K.K.A.'), 'A heavily armored melee unit with devastating single-target damage.'),
((SELECT ID FROM Cards WHERE Name = 'Phoenix'), 'A flying legendary troop that leaves an egg and can return if the egg survives.'),
((SELECT ID FROM Cards WHERE Name = 'Poison'), 'A spell that damages troops and buildings over time inside its area.'),
((SELECT ID FROM Cards WHERE Name = 'Prince'), 'A hard-hitting melee fighter who charges after moving for a short distance.'),
((SELECT ID FROM Cards WHERE Name = 'Princess'), 'A very long-range legendary troop that fires flaming splash-damage arrows.'),
((SELECT ID FROM Cards WHERE Name = 'Rage'), 'A spell that speeds up friendly troops and buildings in its area.'),
((SELECT ID FROM Cards WHERE Name = 'Ram Rider'), 'A building-targeting rider whose snare slows enemy troops.'),
((SELECT ID FROM Cards WHERE Name = 'Rascals'), 'A trio consisting of one durable melee fighter and two ranged attackers.'),
((SELECT ID FROM Cards WHERE Name = 'Rocket'), 'A high-damage spell with a small impact radius.'),
((SELECT ID FROM Cards WHERE Name = 'Ronin'), 'A legendary melee fighter built around fast strikes and aggressive close combat.'),
((SELECT ID FROM Cards WHERE Name = 'Royal Delivery'), 'A delayed spell that damages enemies and deploys a Royal Recruit.'),
((SELECT ID FROM Cards WHERE Name = 'Royal Ghost'), 'A melee legendary troop that becomes invisible while not attacking.'),
((SELECT ID FROM Cards WHERE Name = 'Royal Giant'), 'A ranged building-targeting tank that attacks structures from a distance.'),
((SELECT ID FROM Cards WHERE Name = 'Royal Hogs'), 'Four fast building-targeting hogs that can be split between lanes.'),
((SELECT ID FROM Cards WHERE Name = 'Royal Recruits'), 'Six shielded melee troops deployed across both lanes.'),
((SELECT ID FROM Cards WHERE Name = 'Rune Giant'), 'A building-targeting giant whose runes support nearby allies.'),
((SELECT ID FROM Cards WHERE Name = 'Skeleton Army'), 'A large Skeleton swarm that can quickly surround single targets.'),
((SELECT ID FROM Cards WHERE Name = 'Skeleton Barrel'), 'A flying building-targeting barrel that drops Skeletons when it breaks.'),
((SELECT ID FROM Cards WHERE Name = 'Skeleton Dragons'), 'Two flying ranged troops that deal splash damage.'),
((SELECT ID FROM Cards WHERE Name = 'Skeleton King'), 'A champion melee fighter who collects souls and summons Skeletons.'),
((SELECT ID FROM Cards WHERE Name = 'Skeletons'), 'A very cheap group of fragile melee units used for distraction and cycling.'),
((SELECT ID FROM Cards WHERE Name = 'Sparky'), 'A slow legendary machine that charges a devastating area-damage blast.'),
((SELECT ID FROM Cards WHERE Name = 'Spear Goblins'), 'Three very fast ranged Goblins that attack ground and air.'),
((SELECT ID FROM Cards WHERE Name = 'Spirit Empress'), 'A legendary unit with forms that adapt between ground and air combat.'),
((SELECT ID FROM Cards WHERE Name = 'Suspicious Bush'), 'A moving disguise that heads for buildings and reveals hidden attackers when triggered.'),
((SELECT ID FROM Cards WHERE Name = 'Tesla'), 'A defensive building that hides underground when no enemy is nearby.'),
((SELECT ID FROM Cards WHERE Name = 'The Log'), 'A rolling spell that damages and knocks back ground enemies along a long path.'),
((SELECT ID FROM Cards WHERE Name = 'Three Musketeers'), 'Three Musketeers deployed together for enormous ranged firepower.'),
((SELECT ID FROM Cards WHERE Name = 'Tombstone'), 'A defensive building that spawns Skeletons and releases more when destroyed.'),
((SELECT ID FROM Cards WHERE Name = 'Tornado'), 'A spell that pulls enemy troops toward the center of its area.'),
((SELECT ID FROM Cards WHERE Name = 'Valkyrie'), 'A durable melee fighter whose spinning attack damages nearby ground enemies.'),
((SELECT ID FROM Cards WHERE Name = 'Vines'), 'A control spell that entangles enemies and disrupts their movement.'),
((SELECT ID FROM Cards WHERE Name = 'Void'), 'A spell whose repeated strikes become stronger when fewer targets are inside its area.'),
((SELECT ID FROM Cards WHERE Name = 'Wall Breakers'), 'Two very fast bomb-carrying Skeletons that rush buildings.'),
((SELECT ID FROM Cards WHERE Name = 'Witch'), 'A ranged splash-damage troop that periodically summons Skeletons.'),
((SELECT ID FROM Cards WHERE Name = 'Wizard'), 'A ranged troop that throws powerful splash-damage fireballs.'),
((SELECT ID FROM Cards WHERE Name = 'X-Bow'), 'A very long-range building that can lock onto enemy towers from your side.'),
((SELECT ID FROM Cards WHERE Name = 'Zap'), 'A cheap instant spell that damages and briefly stuns enemies.'),
((SELECT ID FROM Cards WHERE Name = 'Zappies'), 'Three ranged machines that repeatedly stun enemies with electric shots.');


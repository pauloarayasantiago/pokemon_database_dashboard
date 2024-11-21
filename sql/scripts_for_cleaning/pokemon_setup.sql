-- Drop tables if they exist
IF OBJECT_ID('pokedex_pokemon_types', 'U') IS NOT NULL DROP TABLE pokedex_pokemon_types;
IF OBJECT_ID('pokedex_pokemon_stats', 'U') IS NOT NULL DROP TABLE pokedex_pokemon_stats;
IF OBJECT_ID('pokedex_pokemon_moves', 'U') IS NOT NULL DROP TABLE pokedex_pokemon_moves;
IF OBJECT_ID('pokedex_pokemon_held_items', 'U') IS NOT NULL DROP TABLE pokedex_pokemon_held_items;
IF OBJECT_ID('pokedex_pokemon_forms', 'U') IS NOT NULL DROP TABLE pokedex_pokemon_forms;
IF OBJECT_ID('pokedex_pokemon_abilities', 'U') IS NOT NULL DROP TABLE pokedex_pokemon_abilities;
IF OBJECT_ID('pokedex_pokemon_info', 'U') IS NOT NULL DROP TABLE pokedex_pokemon_info;

-- Create tables
CREATE TABLE pokedex_pokemon_info (
    id INT PRIMARY KEY,
    name VARCHAR(30),
    base_experience FLOAT,
    height INT,
    weight INT,
    is_default VARCHAR(5),  
    [order] INT
);

CREATE TABLE pokedex_pokemon_abilities (
    pokemon_id INT,
    ability_name VARCHAR(30),
    is_hidden VARCHAR(5),
    slot INT,
    FOREIGN KEY (pokemon_id) REFERENCES pokedex_pokemon_info(id)
);

CREATE TABLE pokedex_pokemon_forms (
    pokemon_id INT,
    form_name VARCHAR(30),
    FOREIGN KEY (pokemon_id) REFERENCES pokedex_pokemon_info(id)
);

CREATE TABLE pokedex_pokemon_held_items (
    pokemon_id INT,
    item_name VARCHAR(50),
    version_name VARCHAR(15),
    rarity INT,
    FOREIGN KEY (pokemon_id) REFERENCES pokedex_pokemon_info(id)
);

CREATE TABLE pokedex_pokemon_moves (
    pokemon_id INT,
    move_name VARCHAR(30),
    level_learned_at INT,
    version_group VARCHAR(50),
    move_learn_method VARCHAR(30),
    FOREIGN KEY (pokemon_id) REFERENCES pokedex_pokemon_info(id)
);

CREATE TABLE pokedex_pokemon_stats (
    pokemon_id INT,
    stat_name VARCHAR(15),
    base_stat INT,
    effort INT,
    FOREIGN KEY (pokemon_id) REFERENCES pokedex_pokemon_info(id)
);

CREATE TABLE pokedex_pokemon_types (
    pokemon_id INT,
    type_name VARCHAR(15),
    slot INT,
    FOREIGN KEY (pokemon_id) REFERENCES pokedex_pokemon_info(id)
);

-- Insert into pokedex_pokemon_info
BULK INSERT pokedex_pokemon_info
FROM 'C:\Users\paulo\OneDrive\Documents\pokemon DB\general_pokemon_info_csvs\pokemon_basic_data.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

-- Insert into pokedex_pokemon_abilities
BULK INSERT pokedex_pokemon_abilities
FROM 'C:\Users\paulo\OneDrive\Documents\pokemon DB\general_pokemon_info_csvs\abilities_data.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

-- Insert into pokedex_pokemon_forms
BULK INSERT pokedex_pokemon_forms
FROM 'C:\Users\paulo\OneDrive\Documents\pokemon DB\general_pokemon_info_csvs\forms_data.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

-- Insert into pokedex_pokemon_held_items
BULK INSERT pokedex_pokemon_held_items
FROM 'C:\Users\paulo\OneDrive\Documents\pokemon DB\general_pokemon_info_csvs\held_items_data.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

-- Insert into pokedex_pokemon_moves
BULK INSERT pokedex_pokemon_moves
FROM 'C:\Users\paulo\OneDrive\Documents\pokemon DB\general_pokemon_info_csvs\moves_data.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

-- Insert into pokedex_pokemon_stats
BULK INSERT pokedex_pokemon_stats
FROM 'C:\Users\paulo\OneDrive\Documents\pokemon DB\general_pokemon_info_csvs\stats_data.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

-- Insert into pokedex_pokemon_types
BULK INSERT pokedex_pokemon_types
FROM 'C:\Users\paulo\OneDrive\Documents\pokemon DB\general_pokemon_info_csvs\types_data.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

-- Drop table if it exists
IF OBJECT_ID('pokedex_species_growth_rate', 'U') IS NOT NULL 
    DROP TABLE pokedex_species_growth_rate;

-- Create the table with correct foreign key reference
CREATE TABLE pokedex_species_growth_rate (
    species_id INT,
    growth_rate_name VARCHAR(30),
    FOREIGN KEY (species_id) REFERENCES pokedex_pokemon_info(id)
);

-- Perform BULK INSERT
BULK INSERT pokedex_species_growth_rate
FROM 'C:\Users\paulo\OneDrive\POKEMON DB\sql\flattened_data\species_endpoint\growth_rate.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

SELECT * FROM pokedex_species_growth_rate;

-- Drop table if it exists
IF OBJECT_ID('pokedex_species_numbers', 'U') IS NOT NULL 
    DROP TABLE pokedex_species_numbers;

-- Create the table with correct foreign key reference
CREATE TABLE pokedex_species_numbers (
    species_id INT,
	entry_number INT,
    pokedex_name VARCHAR(30),
    FOREIGN KEY (species_id) REFERENCES pokedex_pokemon_info(id)
);

-- Perform BULK INSERT
BULK INSERT pokedex_species_numbers
FROM 'C:\Users\paulo\OneDrive\POKEMON DB\sql\flattened_data\species_endpoint\pokedex_numbers.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

SELECT * FROM pokedex_species_numbers;

-- Drop table if it exists
IF OBJECT_ID('pokedex_species_info', 'U') IS NOT NULL 
    DROP TABLE pokedex_species_info;

-- Create the table based on the structure provided
CREATE TABLE pokedex_species_info (
    id INT,
    name VARCHAR(30),
    [order] INT,
    gender_rate INT,
    capture_rate INT,
    base_happiness FLOAT,
    is_baby VARCHAR(5),  -- Change to VARCHAR
    is_legendary VARCHAR(5),  -- Change to VARCHAR
    is_mythical VARCHAR(5),  -- Change to VARCHAR
    hatch_counter FLOAT,
    has_gender_differences VARCHAR(5),  -- Change to VARCHAR
    forms_switchable VARCHAR(5),  -- Change to VARCHAR
    color VARCHAR(15),
    shape VARCHAR(15),
    evolves_from_species VARCHAR(30),
    evolution_chain_url VARCHAR(100),
    habitat VARCHAR(30),
    generation VARCHAR(30),
	FOREIGN KEY (id) REFERENCES pokedex_pokemon_info(id)
);

-- Perform BULK INSERT
BULK INSERT pokedex_species_info
FROM 'C:\Users\paulo\OneDrive\POKEMON DB\sql\flattened_data\species_endpoint\species.csv'  -- Adjust the path as necessary
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

-- Verify the inserted data
SELECT * FROM pokedex_species_info;

-- Drop table if it exists
IF OBJECT_ID('pokedex_species_varieties', 'U') IS NOT NULL 
    DROP TABLE pokedex_species_varieties;

-- Create the table based on the structure provided
CREATE TABLE pokedex_species_varieties (
    species_id INT,
    variety_name VARCHAR(50),
    is_default VARCHAR(5)  -- Use VARCHAR to handle 'True'/'False' values
);

-- Perform BULK INSERT
BULK INSERT pokedex_species_varieties
FROM 'C:\Users\paulo\OneDrive\POKEMON DB\sql\flattened_data\species_endpoint\varieties.csv'  -- Adjust the path as necessary
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);

-- Verify the inserted data
SELECT * FROM pokedex_species_varieties;
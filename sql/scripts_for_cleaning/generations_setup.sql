-- Drop table if it exists
IF OBJECT_ID('pokedex_generation_species', 'U') IS NOT NULL 
    DROP TABLE pokedex_generation_species;

-- Create the pokedex_generation_species table with correct foreign key reference
CREATE TABLE pokedex_generation_species (
    generation INT,
    pokemon_species_name VARCHAR(30),
    FOREIGN KEY (pokemon_species_name) REFERENCES pokedex_pokemon_info(name)  -- Now references a unique column
);

-- Insert into pokedex_pokemon_types
BULK INSERT pokedex_generation_species
FROM 'C:\Users\paulo\OneDrive\POKEMON DB\sql\flattened_data\generations_endpoint\pokemon_species.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    TABLOCK
);


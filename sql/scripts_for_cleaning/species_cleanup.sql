-- Count the number of entry_number entries for each species_id
WITH EntryCount AS (
    SELECT 
        species_id,
        COUNT(entry_number) AS entry_count
    FROM pokedex_species_numbers
    GROUP BY species_id
)

-- Find the species_id with the most entry_number entries
SELECT 
    species_id,
    entry_count
FROM EntryCount
WHERE entry_count = (
    -- Find the maximum entry count
    SELECT MAX(entry_count)
    FROM EntryCount
)
ORDER BY species_id;

WITH NumberedEntries AS (
    SELECT 
        species_id,
        entry_number,
        pokedex_name,
        ROW_NUMBER() OVER (PARTITION BY species_id ORDER BY entry_number) AS entry_rank
    FROM pokedex_species_numbers
)
SELECT 
    species_id,
    MAX(CASE WHEN entry_rank = 1 THEN entry_number ELSE NULL END) AS entry_number_1,
    MAX(CASE WHEN entry_rank = 1 THEN pokedex_name ELSE NULL END) AS pokedex_name_1,
    MAX(CASE WHEN entry_rank = 2 THEN entry_number ELSE NULL END) AS entry_number_2,
    MAX(CASE WHEN entry_rank = 2 THEN pokedex_name ELSE NULL END) AS pokedex_name_2,
    MAX(CASE WHEN entry_rank = 3 THEN entry_number ELSE NULL END) AS entry_number_3,
    MAX(CASE WHEN entry_rank = 3 THEN pokedex_name ELSE NULL END) AS pokedex_name_3,
    MAX(CASE WHEN entry_rank = 4 THEN entry_number ELSE NULL END) AS entry_number_4,
    MAX(CASE WHEN entry_rank = 4 THEN pokedex_name ELSE NULL END) AS pokedex_name_4,
    MAX(CASE WHEN entry_rank = 5 THEN entry_number ELSE NULL END) AS entry_number_5,
    MAX(CASE WHEN entry_rank = 5 THEN pokedex_name ELSE NULL END) AS pokedex_name_5,
    MAX(CASE WHEN entry_rank = 6 THEN entry_number ELSE NULL END) AS entry_number_6,
    MAX(CASE WHEN entry_rank = 6 THEN pokedex_name ELSE NULL END) AS pokedex_name_6,
    MAX(CASE WHEN entry_rank = 7 THEN entry_number ELSE NULL END) AS entry_number_7,
    MAX(CASE WHEN entry_rank = 7 THEN pokedex_name ELSE NULL END) AS pokedex_name_7,
    MAX(CASE WHEN entry_rank = 8 THEN entry_number ELSE NULL END) AS entry_number_8,
    MAX(CASE WHEN entry_rank = 8 THEN pokedex_name ELSE NULL END) AS pokedex_name_8,
    MAX(CASE WHEN entry_rank = 9 THEN entry_number ELSE NULL END) AS entry_number_9,
    MAX(CASE WHEN entry_rank = 9 THEN pokedex_name ELSE NULL END) AS pokedex_name_9,
    MAX(CASE WHEN entry_rank = 10 THEN entry_number ELSE NULL END) AS entry_number_10,
    MAX(CASE WHEN entry_rank = 10 THEN pokedex_name ELSE NULL END) AS pokedex_name_10,
    MAX(CASE WHEN entry_rank = 11 THEN entry_number ELSE NULL END) AS entry_number_11,
    MAX(CASE WHEN entry_rank = 11 THEN pokedex_name ELSE NULL END) AS pokedex_name_11,
    MAX(CASE WHEN entry_rank = 12 THEN entry_number ELSE NULL END) AS entry_number_12,
    MAX(CASE WHEN entry_rank = 12 THEN pokedex_name ELSE NULL END) AS pokedex_name_12,
    MAX(CASE WHEN entry_rank = 13 THEN entry_number ELSE NULL END) AS entry_number_13,
    MAX(CASE WHEN entry_rank = 13 THEN pokedex_name ELSE NULL END) AS pokedex_name_13,
    MAX(CASE WHEN entry_rank = 14 THEN entry_number ELSE NULL END) AS entry_number_14,
    MAX(CASE WHEN entry_rank = 14 THEN pokedex_name ELSE NULL END) AS pokedex_name_14,
    MAX(CASE WHEN entry_rank = 15 THEN entry_number ELSE NULL END) AS entry_number_15,
    MAX(CASE WHEN entry_rank = 15 THEN pokedex_name ELSE NULL END) AS pokedex_name_15,
    MAX(CASE WHEN entry_rank = 16 THEN entry_number ELSE NULL END) AS entry_number_16,
    MAX(CASE WHEN entry_rank = 16 THEN pokedex_name ELSE NULL END) AS pokedex_name_16,
    MAX(CASE WHEN entry_rank = 17 THEN entry_number ELSE NULL END) AS entry_number_17,
    MAX(CASE WHEN entry_rank = 17 THEN pokedex_name ELSE NULL END) AS pokedex_name_17,
    MAX(CASE WHEN entry_rank = 18 THEN entry_number ELSE NULL END) AS entry_number_18,
    MAX(CASE WHEN entry_rank = 18 THEN pokedex_name ELSE NULL END) AS pokedex_name_18,
    MAX(CASE WHEN entry_rank = 19 THEN entry_number ELSE NULL END) AS entry_number_19,
    MAX(CASE WHEN entry_rank = 19 THEN pokedex_name ELSE NULL END) AS pokedex_name_19,
    MAX(CASE WHEN entry_rank = 20 THEN entry_number ELSE NULL END) AS entry_number_20,
    MAX(CASE WHEN entry_rank = 20 THEN pokedex_name ELSE NULL END) AS pokedex_name_20,
    MAX(CASE WHEN entry_rank = 21 THEN entry_number ELSE NULL END) AS entry_number_21,
    MAX(CASE WHEN entry_rank = 21 THEN pokedex_name ELSE NULL END) AS pokedex_name_21,
    MAX(CASE WHEN entry_rank = 22 THEN entry_number ELSE NULL END) AS entry_number_22,
    MAX(CASE WHEN entry_rank = 22 THEN pokedex_name ELSE NULL END) AS pokedex_name_22,
    MAX(CASE WHEN entry_rank = 23 THEN entry_number ELSE NULL END) AS entry_number_23,
    MAX(CASE WHEN entry_rank = 23 THEN pokedex_name ELSE NULL END) AS pokedex_name_23,
    MAX(CASE WHEN entry_rank = 24 THEN entry_number ELSE NULL END) AS entry_number_24,
    MAX(CASE WHEN entry_rank = 24 THEN pokedex_name ELSE NULL END) AS pokedex_name_24,
    MAX(CASE WHEN entry_rank = 25 THEN entry_number ELSE NULL END) AS entry_number_25,
    MAX(CASE WHEN entry_rank = 25 THEN pokedex_name ELSE NULL END) AS pokedex_name_25,
    MAX(CASE WHEN entry_rank = 26 THEN entry_number ELSE NULL END) AS entry_number_26,
    MAX(CASE WHEN entry_rank = 26 THEN pokedex_name ELSE NULL END) AS pokedex_name_26,
    MAX(CASE WHEN entry_rank = 27 THEN entry_number ELSE NULL END) AS entry_number_27,
    MAX(CASE WHEN entry_rank = 27 THEN pokedex_name ELSE NULL END) AS pokedex_name_27
FROM NumberedEntries
GROUP BY species_id
ORDER BY species_id;

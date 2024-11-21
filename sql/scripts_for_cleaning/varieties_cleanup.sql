-- Find species with the most varieties
WITH VarietiesCount AS (
    SELECT 
        species_id,
        COUNT(*) AS variety_count
    FROM pokedex_species_varieties
    GROUP BY species_id
)
SELECT 
    v.species_id,
    v.variety_name,
    vc.variety_count
FROM pokedex_species_varieties v
JOIN VarietiesCount vc
    ON v.species_id = vc.species_id
WHERE vc.variety_count = (
    -- Find the maximum variety count
    SELECT MAX(variety_count)
    FROM VarietiesCount
)
ORDER BY v.species_id, v.variety_name;

WITH NumberedVarieties AS (
    SELECT 
        species_id,
        variety_name,
        ROW_NUMBER() OVER (PARTITION BY species_id ORDER BY variety_name) AS variety_number,
		COUNT(*) OVER (PARTITION BY species_id) AS variety_count
    FROM pokedex_species_varieties
)
SELECT 
    species_id,
    MAX(CASE WHEN variety_number = 1 THEN variety_name ELSE NULL END) AS variety_1,
	CASE
		WHEN MAX (variety_count) > 1 THEN 'TRUE'
		ELSE 'FALSE'
	END AS has_multiple_varieties,
    MAX(CASE WHEN variety_number = 2 THEN variety_name ELSE NULL END) AS variety_2,
    MAX(CASE WHEN variety_number = 3 THEN variety_name ELSE NULL END) AS variety_3,
    MAX(CASE WHEN variety_number = 4 THEN variety_name ELSE NULL END) AS variety_4,
    MAX(CASE WHEN variety_number = 5 THEN variety_name ELSE NULL END) AS variety_5,
    MAX(CASE WHEN variety_number = 6 THEN variety_name ELSE NULL END) AS variety_6,
    MAX(CASE WHEN variety_number = 7 THEN variety_name ELSE NULL END) AS variety_7,
    MAX(CASE WHEN variety_number = 8 THEN variety_name ELSE NULL END) AS variety_8,
    MAX(CASE WHEN variety_number = 9 THEN variety_name ELSE NULL END) AS variety_9,
    MAX(CASE WHEN variety_number = 10 THEN variety_name ELSE NULL END) AS variety_10,
    MAX(CASE WHEN variety_number = 11 THEN variety_name ELSE NULL END) AS variety_11,
    MAX(CASE WHEN variety_number = 12 THEN variety_name ELSE NULL END) AS variety_12,
    MAX(CASE WHEN variety_number = 13 THEN variety_name ELSE NULL END) AS variety_13,
    MAX(CASE WHEN variety_number = 14 THEN variety_name ELSE NULL END) AS variety_14,
    MAX(CASE WHEN variety_number = 15 THEN variety_name ELSE NULL END) AS variety_15,
    MAX(CASE WHEN variety_number = 16 THEN variety_name ELSE NULL END) AS variety_16,
    MAX(CASE WHEN variety_number = 17 THEN variety_name ELSE NULL END) AS variety_17
FROM NumberedVarieties
GROUP BY species_id
ORDER BY species_id;

WITH TempPokemonTypes AS (
    SELECT 
        pokemon_id,
        type_1 AS type
    FROM 
        types_cleaned
    WHERE 
        type_1 IS NOT NULL

    UNION ALL

    SELECT 
        pokemon_id,
        type_2 AS type
    FROM 
        types_cleaned
    WHERE 
        type_2 IS NOT NULL
)

-- Final query to select results, ensuring no null types
SELECT *
FROM TempPokemonTypes
WHERE type != 'NULL';

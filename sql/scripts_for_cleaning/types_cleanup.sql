SELECT 
    pokemon_id,
    MAX(CASE WHEN slot = 1 THEN type_name ELSE NULL END) AS type_1,
    MAX(CASE WHEN slot = 2 THEN type_name ELSE NULL END) AS type_2
FROM pokedex_pokemon_types
GROUP BY pokemon_id
ORDER BY pokemon_id;

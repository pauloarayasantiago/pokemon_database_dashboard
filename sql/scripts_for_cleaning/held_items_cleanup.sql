SELECT 
    h.pokemon_id,
    h.version_name,
    COUNT(DISTINCT h.item_name) AS item_count
FROM pokedex_pokemon_held_items h
GROUP BY h.pokemon_id, h.version_name
HAVING COUNT(DISTINCT h.item_name) > 1
ORDER BY h.pokemon_id, h.version_name;

WITH DuplicateItems AS (
    SELECT 
        pokemon_id,
        version_name
    FROM pokedex_pokemon_held_items
    GROUP BY pokemon_id, version_name
    HAVING COUNT(DISTINCT item_name) > 1
)

SELECT 
    h.pokemon_id,
    h.version_name,
    h.item_name,
    h.rarity
FROM pokedex_pokemon_held_items h
JOIN DuplicateItems d
    ON h.pokemon_id = d.pokemon_id
    AND h.version_name = d.version_name
ORDER BY h.pokemon_id, h.version_name, h.item_name;

WITH AggregatedItems AS (
    SELECT 
        h.pokemon_id,
        h.version_name,
        STRING_AGG(h.item_name, ', ') WITHIN GROUP (ORDER BY h.item_name) AS item_names  -- Concatenate items
    FROM pokedex_pokemon_held_items h
    GROUP BY h.pokemon_id, h.version_name
)

SELECT 
    a.pokemon_id,
    MAX(CASE WHEN a.version_name = 'alpha-sapphire' THEN a.item_names ELSE NULL END) AS alpha_sapphire,
    MAX(CASE WHEN a.version_name = 'black' THEN a.item_names ELSE NULL END) AS black,
    MAX(CASE WHEN a.version_name = 'black-2' THEN a.item_names ELSE NULL END) AS black_2,
    MAX(CASE WHEN a.version_name = 'diamond' THEN a.item_names ELSE NULL END) AS diamond,
    MAX(CASE WHEN a.version_name = 'emerald' THEN a.item_names ELSE NULL END) AS emerald,
    MAX(CASE WHEN a.version_name = 'firered' THEN a.item_names ELSE NULL END) AS firered,
    MAX(CASE WHEN a.version_name = 'heartgold' THEN a.item_names ELSE NULL END) AS heartgold,
    MAX(CASE WHEN a.version_name = 'leafgreen' THEN a.item_names ELSE NULL END) AS leafgreen,
    MAX(CASE WHEN a.version_name = 'moon' THEN a.item_names ELSE NULL END) AS moon,
    MAX(CASE WHEN a.version_name = 'omega-ruby' THEN a.item_names ELSE NULL END) AS omega_ruby,
    MAX(CASE WHEN a.version_name = 'pearl' THEN a.item_names ELSE NULL END) AS pearl,
    MAX(CASE WHEN a.version_name = 'platinum' THEN a.item_names ELSE NULL END) AS platinum,
    MAX(CASE WHEN a.version_name = 'ruby' THEN a.item_names ELSE NULL END) AS ruby,
    MAX(CASE WHEN a.version_name = 'sapphire' THEN a.item_names ELSE NULL END) AS sapphire,
    MAX(CASE WHEN a.version_name = 'soulsilver' THEN a.item_names ELSE NULL END) AS soulsilver,
    MAX(CASE WHEN a.version_name = 'sun' THEN a.item_names ELSE NULL END) AS sun,
    MAX(CASE WHEN a.version_name = 'ultra-moon' THEN a.item_names ELSE NULL END) AS ultra_moon,
    MAX(CASE WHEN a.version_name = 'ultra-sun' THEN a.item_names ELSE NULL END) AS ultra_sun,
    MAX(CASE WHEN a.version_name = 'white' THEN a.item_names ELSE NULL END) AS white,
    MAX(CASE WHEN a.version_name = 'white-2' THEN a.item_names ELSE NULL END) AS white_2,
    MAX(CASE WHEN a.version_name = 'x' THEN a.item_names ELSE NULL END) AS x_version,
    MAX(CASE WHEN a.version_name = 'y' THEN a.item_names ELSE NULL END) AS y_version
FROM AggregatedItems a
GROUP BY a.pokemon_id
ORDER BY a.pokemon_id;

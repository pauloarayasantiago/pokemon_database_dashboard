SELECT
    pokemon_id,
    MAX(CASE WHEN stat_name = 'hp' THEN base_stat ELSE NULL END) AS hp,
    MAX(CASE WHEN stat_name = 'attack' THEN base_stat ELSE NULL END) AS attack,
    MAX(CASE WHEN stat_name = 'defense' THEN base_stat ELSE NULL END) AS defense,
    MAX(CASE WHEN stat_name = 'special-attack' THEN base_stat ELSE NULL END) AS special_attack,
    MAX(CASE WHEN stat_name = 'special-defense' THEN base_stat ELSE NULL END) AS special_defense,
    MAX(CASE WHEN stat_name = 'speed' THEN base_stat ELSE NULL END) AS speed,
    (
        MAX(CASE WHEN stat_name = 'hp' THEN base_stat ELSE NULL END) +
        MAX(CASE WHEN stat_name = 'attack' THEN base_stat ELSE NULL END) +
        MAX(CASE WHEN stat_name = 'defense' THEN base_stat ELSE NULL END) +
        MAX(CASE WHEN stat_name = 'special-attack' THEN base_stat ELSE NULL END) +
        MAX(CASE WHEN stat_name = 'special-defense' THEN base_stat ELSE NULL END) +
        MAX(CASE WHEN stat_name = 'speed' THEN base_stat ELSE NULL END)
    ) AS total_stats
FROM pokedex_pokemon_stats
GROUP BY pokemon_id
ORDER BY pokemon_id;

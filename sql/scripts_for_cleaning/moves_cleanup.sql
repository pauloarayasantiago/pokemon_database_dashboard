WITH AggregatedMoves AS (
    SELECT 
        pokemon_id,
        version_group,
        STRING_AGG(
            CONCAT(move_name, ' (', move_learn_method, ' @ level ', level_learned_at, ')'),
            ', '
        ) AS concatenated_moves
    FROM pokedex_pokemon_moves
    GROUP BY pokemon_id, version_group
)
SELECT 
    pokemon_id,
    MAX(CASE WHEN version_group = 'red-blue' THEN concatenated_moves ELSE NULL END) AS red_blue_moves,
    MAX(CASE WHEN version_group = 'yellow' THEN concatenated_moves ELSE NULL END) AS yellow_moves,
    MAX(CASE WHEN version_group = 'gold-silver' THEN concatenated_moves ELSE NULL END) AS gold_silver_moves,
    MAX(CASE WHEN version_group = 'crystal' THEN concatenated_moves ELSE NULL END) AS crystal_moves,
    MAX(CASE WHEN version_group = 'ruby-sapphire' THEN concatenated_moves ELSE NULL END) AS ruby_sapphire_moves,
    MAX(CASE WHEN version_group = 'emerald' THEN concatenated_moves ELSE NULL END) AS emerald_moves,
    MAX(CASE WHEN version_group = 'firered-leafgreen' THEN concatenated_moves ELSE NULL END) AS firered_leafgreen_moves,
    MAX(CASE WHEN version_group = 'diamond-pearl' THEN concatenated_moves ELSE NULL END) AS diamond_pearl_moves,
    MAX(CASE WHEN version_group = 'platinum' THEN concatenated_moves ELSE NULL END) AS platinum_moves,
    MAX(CASE WHEN version_group = 'heartgold-soulsilver' THEN concatenated_moves ELSE NULL END) AS heartgold_soulsilver_moves,
    MAX(CASE WHEN version_group = 'black-white' THEN concatenated_moves ELSE NULL END) AS black_white_moves,
    MAX(CASE WHEN version_group = 'black-2-white-2' THEN concatenated_moves ELSE NULL END) AS black_2_white_2_moves,
    MAX(CASE WHEN version_group = 'x-y' THEN concatenated_moves ELSE NULL END) AS x_y_moves,
    MAX(CASE WHEN version_group = 'omega-ruby-alpha-sapphire' THEN concatenated_moves ELSE NULL END) AS omega_ruby_alpha_sapphire_moves,
    MAX(CASE WHEN version_group = 'sun-moon' THEN concatenated_moves ELSE NULL END) AS sun_moon_moves,
    MAX(CASE WHEN version_group = 'ultra-sun-ultra-moon' THEN concatenated_moves ELSE NULL END) AS ultra_sun_ultra_moon_moves,
    MAX(CASE WHEN version_group = 'lets-go-pikachu-lets-go-eevee' THEN concatenated_moves ELSE NULL END) AS lets_go_pikachu_lets_go_eevee_moves,
    MAX(CASE WHEN version_group = 'sword-shield' THEN concatenated_moves ELSE NULL END) AS sword_shield_moves,
    MAX(CASE WHEN version_group = 'brilliant-diamond-shining-pearl' THEN concatenated_moves ELSE NULL END) AS brilliant_diamond_shining_pearl_moves,
    MAX(CASE WHEN version_group = 'legends-arceus' THEN concatenated_moves ELSE NULL END) AS legends_arceus_moves
FROM AggregatedMoves
GROUP BY pokemon_id
ORDER BY pokemon_id;

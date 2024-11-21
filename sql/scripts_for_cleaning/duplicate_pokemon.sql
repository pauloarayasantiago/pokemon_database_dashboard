-- Delete related entries in all tables for pokemon_id > 10000 and not matching suffixes
DELETE FROM pokedex_pokemon_abilities
WHERE pokemon_id IN (
    SELECT id
    FROM pokedex_pokemon_info
    WHERE id > 10000
      AND (name NOT LIKE '%-alola' AND name NOT LIKE '%-galar' AND name NOT LIKE '%-hisui')
);

DELETE FROM pokedex_pokemon_forms
WHERE pokemon_id IN (
    SELECT id
    FROM pokedex_pokemon_info
    WHERE id > 10000
      AND (name NOT LIKE '%-alola' AND name NOT LIKE '%-galar' AND name NOT LIKE '%-hisui')
);

DELETE FROM pokedex_pokemon_held_items
WHERE pokemon_id IN (
    SELECT id
    FROM pokedex_pokemon_info
    WHERE id > 10000
      AND (name NOT LIKE '%-alola' AND name NOT LIKE '%-galar' AND name NOT LIKE '%-hisui')
);

DELETE FROM pokedex_pokemon_moves
WHERE pokemon_id IN (
    SELECT id
    FROM pokedex_pokemon_info
    WHERE id > 10000
      AND (name NOT LIKE '%-alola' AND name NOT LIKE '%-galar' AND name NOT LIKE '%-hisui')
);

DELETE FROM pokedex_pokemon_stats
WHERE pokemon_id IN (
    SELECT id
    FROM pokedex_pokemon_info
    WHERE id > 10000
      AND (name NOT LIKE '%-alola' AND name NOT LIKE '%-galar' AND name NOT LIKE '%-hisui')
);

DELETE FROM pokedex_pokemon_types
WHERE pokemon_id IN (
    SELECT id
    FROM pokedex_pokemon_info
    WHERE id > 10000
      AND (name NOT LIKE '%-alola' AND name NOT LIKE '%-galar' AND name NOT LIKE '%-hisui')
);

-- Finally, delete from pokedex_pokemon_info
DELETE FROM pokedex_pokemon_info
WHERE id > 10000
  AND (name NOT LIKE '%-alola' AND name NOT LIKE '%-galar' AND name NOT LIKE '%-hisui');

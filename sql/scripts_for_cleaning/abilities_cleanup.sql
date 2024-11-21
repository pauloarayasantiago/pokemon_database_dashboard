SELECT
	pokemon_id,
    MAX(CASE WHEN slot = 1 THEN ability_name ELSE NULL END) AS ability_1,
    MAX(CASE WHEN slot = 2 THEN ability_name ELSE NULL END) AS ability_2,
    MAX(CASE WHEN slot = 3 THEN ability_name ELSE NULL END) AS hidden_ability
FROM pokedex_pokemon_abilities 
GROUP BY pokemon_id;


select COUNT(*) 
from pokedex_pokemon_abilities;


select * 
from pokedex_pokemon_abilities;


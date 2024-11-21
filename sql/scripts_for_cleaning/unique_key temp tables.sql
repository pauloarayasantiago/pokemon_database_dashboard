SELECT 
    t.unique_id,
    t.pokemon_id,
    p.name,
	p.is_legendary,
	p.is_mythical,
	p.evolves_from_species,
	p.evolution_chain_url,
	p.generation
FROM 
    types_transformed t
INNER JOIN 
    species p ON t.pokemon_id = p.pokemon_id
ORDER BY t.unique_id;
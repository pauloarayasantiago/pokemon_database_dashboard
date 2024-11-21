UPDATE species
SET evolution_chain_id = regexp_replace(evolution_chain_id, '^.+/([0-9]+)/$', '\1');

SELECT * FROM public.species
ORDER BY pokemon_id

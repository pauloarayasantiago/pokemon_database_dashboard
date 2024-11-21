ALTER TABLE species
RENAME COLUMN evolution_chain_url TO evolution_chain_id;

SELECT * FROM public.species

UPDATE species
SET generation = CASE
    WHEN generation = 'generation-i' THEN 1
    WHEN generation = 'generation-ii' THEN 2
    WHEN generation = 'generation-iii' THEN 3
    WHEN generation = 'generation-iv' THEN 4
    WHEN generation = 'generation-v' THEN 5
    WHEN generation = 'generation-vi' THEN 6
    WHEN generation = 'generation-vii' THEN 7
    WHEN generation = 'generation-viii' THEN 8
    WHEN generation = 'generation-ix' THEN 9
    ELSE NULL -- This is in case you have any unexpected values
END;

ALTER TABLE species
ALTER COLUMN generation TYPE INTEGER
USING generation::integer;

SELECT * FROM public.species

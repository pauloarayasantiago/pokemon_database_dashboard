-- Add binary columns for each Pokémon type
ALTER TABLE types_cleaned ADD COLUMN normal INTEGER DEFAULT 0;
ALTER TABLE types_cleaned ADD COLUMN fire INTEGER DEFAULT 0;
ALTER TABLE types_cleaned ADD COLUMN water INTEGER DEFAULT 0;
ALTER TABLE types_cleaned ADD COLUMN grass INTEGER DEFAULT 0;
ALTER TABLE types_cleaned ADD COLUMN electric INTEGER DEFAULT 0;
ALTER TABLE types_cleaned ADD COLUMN ice INTEGER DEFAULT 0;
ALTER TABLE types_cleaned ADD COLUMN fighting INTEGER DEFAULT 0;
ALTER TABLE types_cleaned ADD COLUMN poison INTEGER DEFAULT 0;
ALTER TABLE types_cleaned ADD COLUMN ground INTEGER DEFAULT 0;
ALTER TABLE types_cleaned ADD COLUMN flying INTEGER DEFAULT 0;
ALTER TABLE types_cleaned ADD COLUMN psychic INTEGER DEFAULT 0;
ALTER TABLE types_cleaned ADD COLUMN bug INTEGER DEFAULT 0;
ALTER TABLE types_cleaned ADD COLUMN rock INTEGER DEFAULT 0;
ALTER TABLE types_cleaned ADD COLUMN ghost INTEGER DEFAULT 0;
ALTER TABLE types_cleaned ADD COLUMN dragon INTEGER DEFAULT 0;
ALTER TABLE types_cleaned ADD COLUMN dark INTEGER DEFAULT 0;
ALTER TABLE types_cleaned ADD COLUMN steel INTEGER DEFAULT 0;
ALTER TABLE types_cleaned ADD COLUMN fairy INTEGER DEFAULT 0;

-- Update binary columns based on type_1 and type_2
UPDATE types_cleaned
SET normal = 1
WHERE type_1 = 'normal' OR type_2 = 'normal';

UPDATE types_cleaned
SET fire = 1
WHERE type_1 = 'fire' OR type_2 = 'fire';

UPDATE types_cleaned
SET water = 1
WHERE type_1 = 'water' OR type_2 = 'water';

UPDATE types_cleaned
SET grass = 1
WHERE type_1 = 'grass' OR type_2 = 'grass';

UPDATE types_cleaned
SET electric = 1
WHERE type_1 = 'electric' OR type_2 = 'electric';

UPDATE types_cleaned
SET ice = 1
WHERE type_1 = 'ice' OR type_2 = 'ice';

UPDATE types_cleaned
SET fighting = 1
WHERE type_1 = 'fighting' OR type_2 = 'fighting';

UPDATE types_cleaned
SET poison = 1
WHERE type_1 = 'poison' OR type_2 = 'poison';

UPDATE types_cleaned
SET ground = 1
WHERE type_1 = 'ground' OR type_2 = 'ground';

UPDATE types_cleaned
SET flying = 1
WHERE type_1 = 'flying' OR type_2 = 'flying';

UPDATE types_cleaned
SET psychic = 1
WHERE type_1 = 'psychic' OR type_2 = 'psychic';

UPDATE types_cleaned
SET bug = 1
WHERE type_1 = 'bug' OR type_2 = 'bug';

UPDATE types_cleaned
SET rock = 1
WHERE type_1 = 'rock' OR type_2 = 'rock';

UPDATE types_cleaned
SET ghost = 1
WHERE type_1 = 'ghost' OR type_2 = 'ghost';

UPDATE types_cleaned
SET dragon = 1
WHERE type_1 = 'dragon' OR type_2 = 'dragon';

UPDATE types_cleaned
SET dark = 1
WHERE type_1 = 'dark' OR type_2 = 'dark';

UPDATE types_cleaned
SET steel = 1
WHERE type_1 = 'steel' OR type_2 = 'steel';

UPDATE types_cleaned
SET fairy = 1
WHERE type_1 = 'fairy' OR type_2 = 'fairy';

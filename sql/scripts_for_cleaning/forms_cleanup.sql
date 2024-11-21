WITH NumberedForms AS (
    SELECT 
        pokemon_id,
        form_name,
        ROW_NUMBER() OVER (PARTITION BY pokemon_id ORDER BY form_name) AS form_number,
        COUNT(*) OVER (PARTITION BY pokemon_id) AS form_count -- Count the number of forms per pokemon_id
    FROM pokedex_pokemon_forms
)
SELECT 
    pokemon_id,
    MAX(CASE WHEN form_number = 1 THEN form_name ELSE NULL END) AS base_form,
    -- Add the new has_multiple_forms column
    CASE 
        WHEN MAX(form_count) > 1 THEN 'TRUE' 
        ELSE 'FALSE' 
    END AS has_multiple_forms,
    MAX(CASE WHEN form_number = 2 THEN form_name ELSE NULL END) AS form_2,
    MAX(CASE WHEN form_number = 3 THEN form_name ELSE NULL END) AS form_3,
    MAX(CASE WHEN form_number = 4 THEN form_name ELSE NULL END) AS form_4,
    MAX(CASE WHEN form_number = 5 THEN form_name ELSE NULL END) AS form_5,
    MAX(CASE WHEN form_number = 6 THEN form_name ELSE NULL END) AS form_6,
    MAX(CASE WHEN form_number = 7 THEN form_name ELSE NULL END) AS form_7,
    MAX(CASE WHEN form_number = 8 THEN form_name ELSE NULL END) AS form_8,
    MAX(CASE WHEN form_number = 9 THEN form_name ELSE NULL END) AS form_9,
    MAX(CASE WHEN form_number = 10 THEN form_name ELSE NULL END) AS form_10,
    MAX(CASE WHEN form_number = 11 THEN form_name ELSE NULL END) AS form_11,
    MAX(CASE WHEN form_number = 12 THEN form_name ELSE NULL END) AS form_12,
    MAX(CASE WHEN form_number = 13 THEN form_name ELSE NULL END) AS form_13,
    MAX(CASE WHEN form_number = 14 THEN form_name ELSE NULL END) AS form_14,
    MAX(CASE WHEN form_number = 15 THEN form_name ELSE NULL END) AS form_15,
    MAX(CASE WHEN form_number = 16 THEN form_name ELSE NULL END) AS form_16,
    MAX(CASE WHEN form_number = 17 THEN form_name ELSE NULL END) AS form_17,
    MAX(CASE WHEN form_number = 18 THEN form_name ELSE NULL END) AS form_18,
    MAX(CASE WHEN form_number = 19 THEN form_name ELSE NULL END) AS form_19,
    MAX(CASE WHEN form_number = 20 THEN form_name ELSE NULL END) AS form_20,
    MAX(CASE WHEN form_number = 21 THEN form_name ELSE NULL END) AS form_21,
    MAX(CASE WHEN form_number = 22 THEN form_name ELSE NULL END) AS form_22,
    MAX(CASE WHEN form_number = 23 THEN form_name ELSE NULL END) AS form_23,
    MAX(CASE WHEN form_number = 24 THEN form_name ELSE NULL END) AS form_24,
    MAX(CASE WHEN form_number = 25 THEN form_name ELSE NULL END) AS form_25,
    MAX(CASE WHEN form_number = 26 THEN form_name ELSE NULL END) AS form_26,
    MAX(CASE WHEN form_number = 27 THEN form_name ELSE NULL END) AS form_27,
    MAX(CASE WHEN form_number = 28 THEN form_name ELSE NULL END) AS form_28
FROM NumberedForms
GROUP BY pokemon_id
ORDER BY pokemon_id;

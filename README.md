# Pokémon Database Analysis and Visualization Project

This project takes you on a data journey—from the raw JSON data provided by the [PokeAPI](https://pokeapi.co/) to a fully interactive Power BI dashboard. Each step along the way is supported by carefully structured code, relational database design, data transformations, and advanced DAX calculations. The included screenshots (all located in the `./screenshots` folder) provide a visual guide through each phase of the process, helping you understand not only what was done, but also how the data pipeline was conceived, built, and refined.

## Overview

The central goal: transform a sprawling, nested API dataset into a well-organized, analytics-ready database and then visualize actionable insights about Pokémon. By the end of this process, you can:

- Examine Pokémon stats across generations.
- Compare Legendary versus regular Pokémon distributions.
- Explore type-driven performance trends and identify the strongest Pokémon based on your chosen stat.

This project demonstrates how to leverage Python, SQL, PostgreSQL, and Power BI to build a seamless analytics pipeline.

## Data Extraction and Transformation

We begin our journey at the [PokeAPI landing page](./screenshots/pokeapi_landing.png), where all Pokémon data originates. Raw JSON responses, as shown in [these samples](./screenshots/pokeapi_sample_1.png) and [these samples](./screenshots/pokeapi_sample_2.png), reveal the nested structure of Pokémon attributes. Understanding this structure—seen in the [PokeAPI JSON hierarchy](./screenshots/pokeapi_json_structure.png)—guides how we flatten and normalize the data.

A custom Python script ([python_api_request.png](./screenshots/python_api_request.png)) fetches the data. Within it, [custom parsing functions](./screenshots/python_custom_function.png) and [data transformation helpers](./screenshots/python_custom_function_2.png) convert hierarchical JSON into tidy pandas DataFrames. Each function step ensures that when the data finally enters our SQL environment, it’s already organized and consistent.

## Database Design and Management

Once extracted and shaped, the data moves into SQL Server Management Studio (SSMS). The [initial schema creation script](./screenshots/sql_CreateTable.png) lays out relational tables for species, types, stats, and more, as seen in the [SSMS database structure view](./screenshots/sql_ssms_structure.png).

Normalization and cleanup occur here. For example, the [stats and types cleanup process](./screenshots/sql_stats_types_table.png) and [subsequent refinements](./screenshots/sql_types_cleanup.png) ensure that data anomalies are addressed and each Pokémon’s attributes adhere to a unified standard. A [fully transformed types table](./screenshots/sql_types_transformed.png) shows how primary and secondary types are integrated into a coherent structure.

Window functions and advanced SQL logic refine the dataset further. The [species cleanup step](./screenshots/sql_species_cleanup.png) removes duplicates and isolates unique entries. By joining these refined tables, a [unique key dataset](./screenshots/sql_unique_key.png) emerges, providing a reliable backbone for advanced analytics.

After building a solid SQL foundation, the data is migrated to PostgreSQL for scalability. [pgAdmin views](./screenshots/sql_pg_admin.png) and [inspection of the species data](./screenshots/sql_pgadmin_species.png) confirm successful transfer and verification in a new environment, setting the stage for robust queries and integration with analytics tools.

## Power BI Visualization and Insights

With a stable, well-structured dataset ready, the next step is visual storytelling in Power BI. A [dual typings table](./screenshots/pbi_dual_typings_table.png) in Power BI demonstrates how linking Pokémon IDs to multiple types enables rich visuals and color coding. DAX comes into play, assigning unique generation-based color themes ([pbi_GenerationsColorCode_DAX.png](./screenshots/pbi_GenerationsColorCode_DAX.png)) and distinct colors per Pokémon type ([pbi_PrimaryTypeColor_DAX.png](./screenshots/pbi_PrimaryTypeColor_DAX.png)).

Introductory dashboard pages ([pbi_Intro.png](./screenshots/pbi_Intro.png), [pbi_Intro_2.png](./screenshots/pbi_Intro_2.png)) help users navigate and understand the data landscape—exploring type distributions, generations, and dataset instructions. More focused analytics follow: [pbi_Legendary.png](./screenshots/pbi_Legendary.png) and [pbi_Legendary_2.png](./screenshots/pbi_Legendary_2.png) use line graphs and pie charts to compare Legendary and regular Pokémon over multiple generations.

Advanced DAX measures enable dynamic insights. [pbi_PokemonWithHighestStat_DAX.png](./screenshots/pbi_PokemonWithHighestStat_DAX.png) reveals the strongest Pokémon based on a user-selected stat, while [pbi_relationships.png](./screenshots/pbi_relationships.png) shows the solid data model that links species, stats, and types. The [pbi_species_table.png](./screenshots/pbi_species_table.png) confirms that all species data is at your fingertips.

## Deeper Analysis and Interaction

As exploration deepens, pages like [pbi_StatsByType.png](./screenshots/pbi_StatsByType.png) and [pbi_StatsByType_2.png](./screenshots/pbi_StatsByType_2.png) break down stats distribution by type, offering both average and max metrics per stat. Custom measures, such as those in [pbi_StrongestPokemonPrimaryType_DAX.png](./screenshots/pbi_StrongestPokemonPrimaryType_DAX.png) and [pbi_StrongestPokemonPrimaryTypeColor_DAX.png](./screenshots/pbi_StrongestPokemonPrimaryTypeColor_DAX.png), guide users to identify standout Pokémon.

Speed-focused pages, illustrated by [pbi_SurvivalOfTheFittest_DAX.png](./screenshots/pbi_SurvivalOfTheFittest_DAX.png), highlight the fastest Pokémon and type-based speed trends. Dynamic DAX measures—like [pbi_XAvgDynamicStat_DAX.png](./screenshots/pbi_XAvgDynamicStat_DAX.png), [pbi_XMaxDynamicStat_DAX.png](./screenshots/pbi_XMaxDynamicStat_DAX.png), [pbi_YAvgDynamicStat_DAX.png](./screenshots/pbi_YAvgDynamicStat_DAX.png), and [pbi_YMaxDynamicStat_DAX.png](./screenshots/pbi_YMaxDynamicStat_DAX.png)—empower users to compare stats along multiple dimensions. A [stat selector interface](./screenshots/pbi_XStatSelector_DAX.png) encourages interactive exploration, making complex analyses accessible.

## Technologies Used

- **Python (requests, pandas)**: Data extraction and transformation.
- **SQL Server & PostgreSQL**: Schema design, normalization, and scalable data storage.
- **Power BI & DAX**: Interactive dashboards, dynamic measures, and rich visual narratives.

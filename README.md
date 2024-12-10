# Pokémon Database Analysis and Visualization Project

This project takes you on a data journey—from the raw JSON data provided by the [PokeAPI](https://pokeapi.co/) to a fully interactive Power BI dashboard. Each step along the way is supported by carefully structured code, relational database design, data transformations, and advanced DAX calculations. The included screenshots provide a visual guide through each phase of the process, helping you understand not only what was done, but also how the data pipeline was conceived, built, and refined.

## Overview

The central goal: transform a sprawling, nested API dataset into a well-organized, analytics-ready database and then visualize actionable insights about Pokémon. By the end of this process, you can:

- Examine Pokémon stats across generations.
- Compare Legendary versus regular Pokémon distributions.
- Explore type-driven performance trends and identify the strongest Pokémon based on your chosen stat.

This project demonstrates how to leverage Python, SQL, PostgreSQL, and Power BI to build a seamless analytics pipeline.

## Data Extraction and Transformation

We begin our journey at the [PokeAPI landing page](./images/pokeapi_landing.png), where all Pokémon data originates. Raw JSON responses from endpoints like [these samples](./images/pokeapi_sample_1.png) and [these samples](./images/pokeapi_sample_2.png) reveal the nested structure of Pokémon attributes. Understanding this structure—shown in [the PokeAPI JSON hierarchy](./images/pokeapi_json_structure.png)—guides how we flatten and normalize the data.

A custom Python script ([python_api_request.png](./images/python_api_request.png)) fetches the data. Within it, [custom parsing functions](./images/python_custom_function.png) and [data transformation helpers](./images/python_custom_function_2.png) convert hierarchical JSON into tidy pandas DataFrames. Each function step ensures that when the data finally enters our SQL environment, it’s already organized and consistent.

## Database Design and Management

Once extracted and shaped, the data moves into SQL Server Management Studio (SSMS). The [initial schema creation script](./images/sql_CreateTable.png) lays out relational tables for species, types, stats, and more, as seen in the [SSMS database structure view](./images/sql_ssms_structure.png).

Normalization and cleanup occur here. For example, the [stats and types cleanup process](./images/sql_stats_types_table.png) and [refined types table](./images/sql_types_cleanup.png) illustrate how data anomalies were addressed, ensuring that each Pokémon’s attributes adhere to a unified standard. A [transformed types table](./images/sql_types_transformed.png) shows the final, cleaned version, integrating primary and secondary types into a coherent structure.

Further refinements come from using SQL window functions. For instance, [the species cleanup step](./images/sql_species_cleanup.png) removes duplicates and isolates unique entries. By joining these refined tables, we create a [unique key dataset](./images/sql_unique_key.png) that underpins the final stage of analysis.

After building a reliable SQL foundation, the data is migrated to PostgreSQL for scalability. Screenshots like [sql_pg_admin.png](./images/sql_pg_admin.png) and [sql_pgadmin_species.png](./images/sql_pgadmin_species.png) confirm that our clean datasets have been successfully transferred and verified in a new environment, ready for advanced queries and integration with modern analytics tools.

## Power BI Visualization and Insights

With structured data and stable relationships established, the next step is visual storytelling in Power BI. A [dual typings table view](./images/pbi_dual_typings_table.png) in Power BI demonstrates how linking Pokémon IDs to multiple types enables rich visuals, from color coding to interactive filters. Leveraging DAX, we add unique color themes by generation ([pbi_GenerationsColorCode_DAX.png](./images/pbi_GenerationsColorCode_DAX.png)) and assign distinct colors per Pokémon type ([pbi_PrimaryTypeColor_DAX.png](./images/pbi_PrimaryTypeColor_DAX.png)).

Early dashboard pages ([pbi_Intro.png](./images/pbi_Intro.png), [pbi_Intro_2.png](./images/pbi_Intro_2.png)) set the scene: users learn how to navigate the report, explore type distributions, and understand generational trends. The transition into deeper analytics occurs through visuals like [pbi_Legendary.png](./images/pbi_Legendary.png) and [pbi_Legendary_2.png](./images/pbi_Legendary_2.png), where line graphs and pie charts compare Legendary to regular Pokémon distributions across multiple eras.

Advanced DAX measures enable dynamic insights. For example, [pbi_PokemonWithHighestStat_DAX.png](./images/pbi_PokemonWithHighestStat_DAX.png) identifies the strongest Pokémon based on a stat the user selects, while [pbi_relationships.png](./images/pbi_relationships.png) ensures that the underlying model is robust, linking species, stats, and types seamlessly. The [pbi_species_table.png](./images/pbi_species_table.png) view reassures us that all species data is readily accessible for analytics.

## Deeper Analysis and Interaction

As users dive deeper, pages like [pbi_StatsByType.png](./images/pbi_StatsByType.png) and [pbi_StatsByType_2.png](./images/pbi_StatsByType_2.png) reveal complex distributions: average and max metrics for chosen stats, segmented by Pokémon type. Custom measures and selectors—such as [pbi_StrongestPokemonPrimaryType_DAX.png](./images/pbi_StrongestPokemonPrimaryType_DAX.png) and its color-emphasizing companion [pbi_StrongestPokemonPrimaryTypeColor_DAX.png](./images/pbi_StrongestPokemonPrimaryTypeColor_DAX.png)—guide the user’s focus to the most remarkable Pokémon in the dataset.

Speed-based analyses ([pbi_SurvivalOfTheFittest_DAX.png](./images/pbi_SurvivalOfTheFittest_DAX.png)) surface which Pokémon truly dominate certain niches. Dynamic DAX measures like [pbi_XAvgDynamicStat_DAX.png](./images/pbi_XAvgDynamicStat_DAX.png), [pbi_XMaxDynamicStat_DAX.png](./images/pbi_XMaxDynamicStat_DAX.png), [pbi_YAvgDynamicStat_DAX.png](./images/pbi_YAvgDynamicStat_DAX.png), and [pbi_YMaxDynamicStat_DAX.png](./images/pbi_YMaxDynamicStat_DAX.png) empower the user to slice and dice stats across multiple dimensions. A [stat selector interface](./images/pbi_XStatSelector_DAX.png) invites users to choose which attribute to analyze, enabling a flexible exploration of the data.

## Technologies Used

- **Python (requests, pandas)**: Data extraction and transformation.
- **SQL Server & PostgreSQL**: Schema design, normalization, and scalable data storage.
- **Power BI & DAX**: Interactive dashboards, dynamic measures, and rich visual narratives.

## Getting Started

1. **Acquire Data**: Use the Python scripts to fetch and prepare Pokémon data from PokeAPI.
2. **Build the Database**: Execute the provided SQL scripts in SSMS or PostgreSQL to set up the schema and load cleansed datasets.
3. **Explore the Dashboards**: Open the Power BI report, navigate through the pages, apply filters, select stats, and discover insights.

From raw JSON to interactive dashboards, this project demonstrates how to craft a full-fledged data story. By following the narrative and examining the included screenshots, you gain both a high-level understanding of the process and a clear view of how each component contributes to the final, analytical experience.

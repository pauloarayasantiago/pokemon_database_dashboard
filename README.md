# Pokémon Database Analysis and Visualization Project

This repository documents a comprehensive end-to-end workflow for extracting, transforming, and analyzing Pokémon datasets sourced from the [PokeAPI](https://pokeapi.co/). It integrates Python-based data ingestion, relational database normalization in SQL Server and PostgreSQL, and advanced visualization techniques in Power BI. The following narrative and inlined images illustrate each stage of the pipeline with technical rigor.

## Overview

The objective is to operationalize raw, nested JSON data into a high-quality, analytics-ready schema. Subsequently, Power BI dashboards leverage dynamic DAX measures and modeling techniques to deliver interactive insights—ranging from generational distributions and type-based performance metrics to identifying standout Pokémon by custom-defined criteria.

## Data Extraction and Transformation

Extraction initiates from the PokeAPI, where a RESTful endpoint provides hierarchical Pokémon data:

![PokeAPI Landing Page](./screenshots/pokeapi_landing.png)

Representative JSON structures demonstrate the complexity of the data model:

![Raw JSON Sample #1](./screenshots/pokeapi_sample_1.png)
![Raw JSON Sample #2](./screenshots/pokeapi_sample_2.png)

These hierarchical formats necessitate a structured flattening procedure:

![PokeAPI JSON Hierarchy](./screenshots/pokeapi_json_structure.png)

A Python script orchestrates data retrieval and parsing:

![Python API Request Code](./screenshots/python_api_request.png)

Custom Python functions transform the nested JSON payloads into normalized pandas DataFrames, ensuring columnar integrity and facilitating subsequent database ingestion:

![Custom Python Function #1](./screenshots/python_custom_function.png)
![Custom Python Function #2](./screenshots/python_custom_function_2.png)

## Relational Database Design and Management

Upon successful extraction and restructuring, the data is ingested into SQL Server Management Studio (SSMS). The schema creation process establishes relational integrity and normalization:

![SQL Create Table Script](./screenshots/sql_CreateTable.png)

The resulting schema is visible in SSMS, reflecting a fully normalized relational database with distinct tables for species, stats, and types:

![SSMS Database Structure](./screenshots/sql_ssms_structure.png)

Data cleansing and transformation occur at the relational layer. Statistics and types undergo refinement to ensure consistent data domains and removal of anomalies:

![Stats and Types Table Cleanup](./screenshots/sql_stats_types_table.png)  
![Types Cleanup](./screenshots/sql_types_cleanup.png)

Post-transformation, the types table is fully integrated, consolidating primary and secondary type assignments:

![Transformed Types Table](./screenshots/sql_types_transformed.png)

Advanced SQL techniques, including window functions, remove duplicates and standardize species entries:

![Species Cleanup with Window Functions](./screenshots/sql_species_cleanup.png)

By joining these refined tables, a unique key dataset emerges, forming the basis for advanced analytics:

![Unique Key Dataset Construction](./screenshots/sql_unique_key.png)

The clean, conformed datasets are then migrated to PostgreSQL to ensure scalability and seamless integration with modern analytics engines:

![PostgreSQL Admin View](./screenshots/sql_pg_admin.png)
![PostgreSQL Species Verification](./screenshots/sql_pgadmin_species.png)

## Power BI Visualization and Analytical Layer

With a stable, high-quality dataset established, Power BI is employed to model relationships and craft interactive visualizations. A dual typings table aligns Pokémon IDs to multiple type attributes, enabling category-based segmentation and color encoding:

![Dual Typings in Power BI](./screenshots/pbi_dual_typings_table.png)

DAX measures introduce dynamic color assignments based on generation and type categories, enhancing visual differentiation:

![Generation-Based Color Coding DAX](./screenshots/pbi_GenerationsColorCode_DAX.png)
![Primary Type Color DAX](./screenshots/pbi_PrimaryTypeColor_DAX.png)

Initial dashboards offer a navigational framework, highlighting generational distributions, type frequencies, and user guidance:

![Introductory Dashboard Overview](./screenshots/pbi_Intro.png)
![Introductory Dashboard - Additional View](./screenshots/pbi_Intro_2.png)

Subsequent visualizations isolate critical insights, such as Legendary vs. regular distributions across generations, employing line charts, pie charts, and slicers to facilitate user-driven exploration:

![Legendary vs. Regular Distribution](./screenshots/pbi_Legendary.png)
![Legendary Distribution - Detailed View](./screenshots/pbi_Legendary_2.png)

Advanced DAX measures enable responsive analytics. The following calculation dynamically identifies the top-performing Pokémon for any selected stat:

![DAX: Pokémon With Highest Stat](./screenshots/pbi_PokemonWithHighestStat_DAX.png)

A robust data model ensures referential integrity and seamless interactivity:

![Power BI Relationships](./screenshots/pbi_relationships.png)

The raw species table is directly accessible within Power BI, serving as a lookup for generational and categorical views:

![Species Data in Power BI](./screenshots/pbi_species_table.png)

## Advanced Analytics and Custom Measures

Deeper analyses segment and compare stats by Pokémon type. For example, average and maximum metrics can be dynamically computed and filtered:

![Stats by Type Visualization #1](./screenshots/pbi_StatsByType.png)
![Stats by Type Visualization #2](./screenshots/pbi_StatsByType_2.png)

Tailored DAX measures pinpoint outliers, such as the strongest Pokémon by primary type:

![DAX: Strongest Pokémon Primary Type](./screenshots/pbi_StrongestPokemonPrimaryType_DAX.png)
![DAX: Highlighting Strongest Pokémon Primary Type](./screenshots/pbi_StrongestPokemonPrimaryTypeColor_DAX.png)

Focus on specific attributes, like speed, with treemaps and bar charts that uncover evolutionary advantages and generational shifts:

![Speed-Oriented Analysis](./screenshots/pbi_SurvivalOfTheFittest_DAX.png)

Dynamic measures allow metric switching (e.g., average vs. max) along multiple axes, empowering complex comparative analyses:

![DAX: X-Axis Avg Stat](./screenshots/pbi_XAvgDynamicStat_DAX.png)
![DAX: X-Axis Max Stat](./screenshots/pbi_XMaxDynamicStat_DAX.png)
![DAX: Y-Axis Avg Stat](./screenshots/pbi_YAvgDynamicStat_DAX.png)
![DAX: Y-Axis Max Stat](./screenshots/pbi_YMaxDynamicStat_DAX.png)

A stat selection table enables on-the-fly comparisons, turning a static report into an interactive analytical tool:

![Stat Selector DAX Integration](./screenshots/pbi_XStatSelector_DAX.png)

## Technologies Utilized

- **Python (requests, pandas)**: Hierarchical data ingestion and flattening for database entry.
- **SQL Server Management Studio & PostgreSQL**: DDL, DML, and data normalization for enterprise-grade data warehousing.
- **Power BI with DAX**: Interactive dashboards, advanced calculation logic, and dynamic visuals.

## Getting Started

1. **Extract & Transform Data**: Run the Python scripts to query PokeAPI endpoints and produce normalized DataFrames.
2. **Build the Schema & Load Data**: Execute the SQL DDL and DML scripts within SSMS or PostgreSQL, ensuring schema creation and data insertion.
3. **Analyze & Visualize**: Open the Power BI report, interact with slicers, adjust stat measures, and derive insights from the dynamic visualizations.

This project demonstrates a robust data engineering and analytics workflow, leveraging modern tools and techniques to produce an integrated, end-to-end solution for exploring complex Pokémon datasets.

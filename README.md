# Pokémon Database Analysis and Visualization Project

## Project Overview
This project revolves around creating a fully integrated Pokémon data analytics pipeline. It starts with extracting raw data from an external API (PokeAPI), proceeds through robust data cleaning and normalization processes in SQL, leverages Python for automation and transformation, and culminates in dynamic, interactive dashboards built in Power BI.

The main objective is to demonstrate the entire lifecycle of a data project—from ingestion of complex external data to refined, visually rich insights—while applying advanced data modeling techniques and ensuring the scalability and integrity of the final solution.

---

## Data Extraction and Integration with Python

### Data Source
PokeAPI provides comprehensive data on Pokémon, including attributes such as stats, abilities, forms, and types.

![PokeAPI Landing Page](./screenshots/pokeapi_landing.png)

### API Requests
Utilizing Python’s `requests` library, over 1,000 detailed Pokémon records were retrieved from PokeAPI. These responses arrived as nested JSON structures, demanding a careful flattening approach.

Sample JSON structures highlight the complexity:
![Raw JSON Sample #2](./screenshots/pokeapi_sample_2.png)

A visualization of the hierarchical JSON in VSCode:
![PokeAPI JSON Hierarchy](./screenshots/pokeapi_json_structure.png)

### Data Flattening and Structuring
Custom Python functions coupled with `pandas` DataFrames were used to normalize the JSON data, ensuring a tabular format aligned to a Pokémon ID as a unique identifier.

Flattening and transformation functions:
![Custom Python Function #2](./screenshots/python_custom_function_2.png)

### Output to CSV
Post-transformation, the data was exported to CSV files. Each CSV focused on a distinct entity (e.g., stats, species, types). This logical segmentation streamlined downstream relational modeling and ensured each table was clean and consistent.

---

## SQL Database Design and Management

### Tools
SQL Server Management Studio (SSMS) was initially employed to establish the relational schema, followed by a migration to PostgreSQL for enhanced scalability. The move to PostgreSQL was also motivated by the implementation of Azure Cloud Services, in order to have access to the database from multiples computers.

### Relational Schema Design
Normalized tables (e.g., `species`, `stats`, `types`) were created to maintain data integrity and prevent redundancy. Primary keys (Pokémon IDs) and foreign keys defined clear relationships. Later on a unique key was created in order to keep track of pokemon with dual-typings, that might've been listed twice in some tables.

Schema creation script:
![SQL Create Table](./screenshots/sql_CreateTable.png)

### Data Import and Constraints
The CSV exports were ingested into SQL Server. Constraints, primary keys, and foreign keys enforced relational integrity and optimized query execution.

### Data Cleaning and Transformation
Advanced SQL techniques ensured high data quality:

- **CTEs**: Simplified data transformations and type pivoting.
- **Window Functions**: Removed duplicates and explored relevant entries to make decisions on further transformations of the tables.
- **JOINs**: Consolidated attributes from multiple tables into unified, analysis-ready views.

Species-level cleanup with window functions:
![Species Cleanup](./screenshots/sql_species_cleanup.png)

Creation of a unique key dataset for coherent Pokémon records:
![Unique Key Dataset](./screenshots/sql_unique_key.png)

---

## Scalability and PostgreSQL Integration
For enhanced performance and flexibility, the cleaned, transformed data was migrated to PostgreSQL.

Verification in pgAdmin:
![PostgreSQL Admin](./screenshots/sql_pg_admin.png)
Species data inspection:
![PostgreSQL Species Check](./screenshots/sql_pgadmin_species.png)

This migration ensured that the solution could scale and integrate easily with other analytics platforms, and most importantly was accesible easily from different locations.

---

## Excel Workflow (Verification and Formatting)
Before generating Power BI dashboards, a final review was conducted in Excel. The curated datasets were loaded, inspected, and minor labeling adjustments were made. This step guaranteed that every attribute was coherent and analysis-ready.

---

## Power BI Visualization

### Data Modeling
Power BI imported the normalized, cleaned datasets. Relationships were established across tables, and DAX (Data Analysis Expressions) measures were implemented for dynamic calculations and color-coding.

Robust relationships ensured consistent interactions:
![Power BI Relationships](./screenshots/pbi_relationships.png)

### Custom color themes

Generational color themes via DAX:
![Generation-Based Color Coding DAX](./screenshots/pbi_GenerationsColorCode_DAX.png)
Primary type color assignments:
![Primary Type Color DAX](./screenshots/pbi_PrimaryTypeColor_DAX.png)

### Initial Dashboards
Introductory pages offered a high-level overview of distributions by generation and type:
![Intro Dashboard Page 2](./screenshots/pbi_Intro_2.png)

Legendary vs. regular Pokémon trends:
![Detailed Legendary Distribution](./screenshots/pbi_Legendary_2.png)


---

## Advanced Power BI Visualizations and DAX Measures

### Stats Distribution by Type
Visuals displayed average and max values for selected stats, segmented by type. Users could toggle among stats:
![Stats by Type #2](./screenshots/pbi_StatsByType_2.png)

### Dynamic Stat Selection Measures

A stat selector table enabled flexible, user-defined comparisons:
![Stat Selector Implementation](./screenshots/pbi_XStatSelector_DAX.png)

Additional DAX measures offered average and max calculations along both X and Y axes, enriching comparative capabilities:
![X-Axis Avg Stat DAX](./screenshots/pbi_XAvgDynamicStat_DAX.png)
![Y-Axis Max Stat DAX](./screenshots/pbi_YMaxDynamicStat_DAX.png)

DAX measures enabled user-driven insights:
![DAX: Pokémon With Highest Stat](./screenshots/pbi_PokemonWithHighestStat_DAX.png)

### Speed-Focused Analyses (Survival of the Fittest)
Treemaps for type selection and bar charts concentrated on speed metrics:
![Speed Analysis](./screenshots/pbi_SurvivalOfTheFittest_DAX.png)

---

## Conclusions

### User-Centric Design
The pipeline—from API extraction to Power BI dashboards—was built to empower end-users. Pokémon enthusiasts, data analysts, or decision-makers can navigate intuitively, tailor their queries, and discover patterns without technical impediments.

### Dynamic Insights
The combination of SQL-based transformations, PostgreSQL scalability, and Power BI’s interactive dashboards facilitated a robust analytics environment. Users can isolate Legendary vs. regular trends, inspect type-based performance, or focus on individual stats in real-time.

### Technical Depth
This project exemplifies a complete skill set:
- **API Integration** with Python for automated data retrieval.
- **Data Engineering** with SQL (CTEs, Window Functions, and JOINS) and normalization for an enterprise-grade data model.
- **Analytics and Visualization** with Power BI and DAX for dynamic, interactive reporting.
- **Scalability** via PostgreSQL integration.

---

By following this workflow, stakeholders gain a full-stack perspective of data operations. The result is a scalable, extensible data solution—translating messy raw data into meaningful insights and facilitating informed decision-making in a visually intuitive manner.

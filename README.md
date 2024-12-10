# POKÉMON DATABASE ANALYSIS AND VISUALIZATION PROJECT  
**Alajuela, Costa Rica – December 2024**

## Project Summary

- **Data Extraction & Integration**:  
  Automated data extraction from [PokeAPI](https://pokeapi.co/) using Python (`requests`, `pandas`) to gather comprehensive Pokémon data—including abilities, stats, forms, and types—and transformed raw JSON into structured datasets.

- **Database Design & Management**:  
  Designed and implemented a relational database schema in SQL Server Management Studio (SSMS) to efficiently organize over 1,000 Pokémon records into multiple tables (e.g., `stats`, `types`, `species`).

- **Data Cleaning & Transformation**:  
  Conducted extensive data normalization, outlier detection, and missing value handling using SQL and Python to prepare datasets for analysis. Ensured high data integrity and consistency for downstream processes.

- **Scalability & Portability**:  
  Migrated the refined datasets to PostgreSQL for enhanced scalability, enabling advanced queries and seamless integration with additional analytics tools.

- **Advanced SQL Techniques**:  
  Employed CTEs, window functions, and JOINs to generate unique insights—such as Pokémon type distributions and generational trends—optimizing the data for visualization.

- **Interactive Power BI Dashboards**:  
  Built dynamic Power BI dashboards to visualize key Pokémon statistics and trends, including comparisons by generation, differentiations between Legendary and regular Pokémon, and stat-specific insights (e.g., Attack, Defense).

- **Custom DAX Measures**:  
  Developed DAX measures to dynamically calculate statistics (e.g., max speed, total stats) and implemented slicers and filters to allow user-driven interactivity, tailoring the dashboard experience.

- **Visual Explorations**:  
  Leveraged a variety of charts (bar, line, treemaps, pie) to highlight patterns and empower users to explore Pokémon performance across type, generation, and rarity, providing a rich, user-centric analytical experience.


---

## Detailed Workflow

### 1. Data Extraction with Python

**Tools & Techniques:**  
- **API Integration:** Used the Python `requests` library to connect to the PokeAPI and retrieve information for all Pokémon, including their abilities, stats, forms, and types.  
- **JSON Parsing:** Flattened nested JSON structures into pandas DataFrames, enabling easy manipulation and CSV export.

**Key Steps:**  
1. **Access PokeAPI**:  
   - Retrieved data programmatically for over 1,000 Pokémon.  
   - Ensured robust error handling to manage potential API failures.

2. **Transforming JSON to CSV**:  
   - Created custom Python functions to parse and normalize JSON responses.  
   - Exported the cleaned and structured Pokémon datasets as CSV for ingestion into SQL databases.

*Screenshots* (adjust filenames as needed):  
- `pokeapi_landing.png`  
- `pokeapi_sample_1.png`  
- `pokeapi_sample_2.png`  
- `pokeapi_json_structure.png`  
- `python_api_request.png`  
- `python_custom_function.png`  
- `python_custom_function_2.png`

---

### 2. SQL Database Design and Management

**Tools & Techniques:**  
- **SSMS for Schema Design:** Defined a relational schema that splits Pokémon information into logical entities (`species`, `stats`, `types`) linked by a Pokémon ID primary key.  
- **Normalization:** Ensured no redundancy and set constraints for data integrity.

**Key Steps:**  
1. **Schema Creation**:  
   - Designed tables to reflect hierarchical relationships:  
     - `species`: Base Pokémon details (e.g., name, generation).  
     - `stats`: Numerical attributes like Attack, Defense, Speed.  
     - `types`: Primary and secondary typing for each Pokémon.

2. **Data Import**:  
   - Imported CSV files into SQL Server, leveraging bulk insert methods for efficiency.

*Screenshots:*  
- `sql_CreateTable.png`  
- `sql_ssms_structure.png`

---

### 3. Data Cleaning and Transformation

**Tools & Techniques:**  
- **SQL Queries (CTEs, Window Functions, JOINs):** Performed advanced transformations to unify data sources and handle multiple types per Pokémon.  
- **Normalization and Integrity Checks:** Addressed duplicates, handled NULLs, and ensured each Pokémon record is unique and consistent.

**Key Steps:**  
1. **Stats & Types Cleanup**:  
   - Normalized tables like `stats_cleaned` and `types_cleaned` to ensure each row accurately reflects a Pokémon’s attributes.  
   - Introduced binary indicators (1/0) for type presence.

2. **Types Transformation**:  
   - Used CTEs to pivot and flatten types data, creating a `types_transformed` table that consolidated primary and secondary types into a single structure.

3. **Species Cleanup**:  
   - Applied window functions (`ROW_NUMBER()`) to remove duplicates and rank entries, retaining only the most relevant data.

4. **Unique Key Table**:  
   - Joined `types_transformed` with `species` to create a `unique_key` table that aligns each Pokémon with its definitive set of attributes.

*Screenshots:*  
- `sql_stats_types_table.png`  
- `sql_types_cleanup.png`  
- `sql_types_transformed.png`  
- `sql_species_cleanup.png`  
- `sql_unique_key.png`

---

### 4. Scalability and PostgreSQL Integration

After ensuring data integrity in SQL Server, the cleaned datasets were migrated to PostgreSQL to take advantage of its scalability and advanced querying capabilities, ensuring compatibility with various analytics tools.

*Screenshots:*  
- `sql_pg_admin.png`  
- `sql_pgadmin_species.png`

---

### 5. Excel Workflow

**Role of Excel:**  
- Imported final CSV outputs into Excel for a final verification step.  
- Performed minor formatting and labeling adjustments, ensuring clarity before moving to Power BI.

---

### 6. Power BI Visualization

**Data Modeling & DAX:**  
- Imported the cleaned and transformed data into Power BI.  
- Established relationships between tables using the Pokémon ID as the primary key.
- Implemented custom DAX measures to enable dynamic stat calculations and color-coding by generation and type.

**Key Pages & Features:**  
- **Introductory Page:** Showcased Pokémon count by generation, distribution of types, and included textual guidance.  
- **Legendary Analysis:** Differentiated Regular, Legendary, and Mythical Pokémon with line graphs, pie charts, and slicers.  
- **Stat Selection Measures:** Created measures to dynamically identify the Pokémon with the highest selected stat, enabling users to switch between Attack, Defense, Speed, etc.

*Screenshots:*  
- `pbi_dual_typings_table.png`  
- `pbi_GenerationsColorCode_DAX.png`  
- `pbi_Intro.png`, `pbi_Intro_2.png`  
- `pbi_Legendary.png`, `pbi_Legendary_2.png`  
- `pbi_PokemonWithHighestStat_DAX.png`  
- `pbi_PrimaryTypeColor_DAX.png`  
- `pbi_relationships.png`  
- `pbi_species_table.png`

---

### 7. Advanced Visualizations and Measures in Power BI

To deepen the analysis, additional DAX measures and visual pages were created:

- **Stats Distribution by Type:**  
  Showed average and max stats, with interactive slicers for category and stat selection. Used bubble and bar charts.

- **Primary Type of Strongest Pokémon:**  
  A measure to dynamically identify the top-performing Pokémon’s primary type, updated in real-time based on user selections.

- **Strongest Pokémon Primary Type Color:**  
  Enhanced visualization by applying unique, vibrant colors to highlight the top Pokémon’s type.

- **Survival of the Fittest Page:**  
  Focused on speed stats, employing treemaps and bar charts to show max and average speed distributions.

- **Dynamic Stat Measures:**  
  Created flexible DAX measures (X/Y axes) to handle average and max stats dynamically, supporting more granular comparisons.

- **Stat Selector Table:**  
  Implemented a table-driven approach to allow users to pick which stat to analyze, driving all visuals accordingly.

*Screenshots:*  
- `pbi_StatsByType.png`, `pbi_StatsByType_2.png`  
- `pbi_StrongestPokemonPrimaryType_DAX.png`  
- `pbi_StrongestPokemonPrimaryTypeColor_DAX.png`  
- `pbi_SurvivalOfTheFittest_DAX.png`  
- `pbi_XAvgDynamicStat_DAX.png`, `pbi_XMaxDynamicStat_DAX.png`, `pbi_YAvgDynamicStat_DAX.png`, `pbi_YMaxDynamicStat_DAX.png`  
- `pbi_XStatSelector_DAX.png`

---

### 8. Comprehensive Analysis and Insights

**User-Centric Focus:**  
All elements were designed for easy exploration, allowing Pokémon enthusiasts and analysts to interact with the data. Users can filter by generation, rarity, and specific stats to uncover patterns.

**Dynamic Insights:**  
Custom DAX measures and stat selectors enable tailored analyses, such as identifying the fastest Pokémon or understanding how Legendary Pokémon dominate certain stats.

**Technical Depth:**  
This project combines API consumption, relational database design, data normalization, advanced SQL querying, Python data manipulation, and Power BI analytics—offering a full-stack data solution.

---


# Pokémon Database Pipeline Project

This repository documents the end-to-end process of creating a Pokémon database pipeline using **Python**, **SQL**, **Excel**, and **Power BI**. The project leverages data from [PokeAPI](https://pokeapi.co/), optimizes it for analysis, and visualizes insights interactively.

## Table of Contents
1. [Introduction](#introduction)
2. [Python Workflow](#python-workflow)
3. [SQL Workflow](#sql-workflow)
4. [Excel Workflow](#excel-workflow)
5. [Power BI Workflow](#power-bi-workflow)

---

## Introduction

This project focuses on extracting, cleaning, and visualizing Pokémon data. It integrates multiple tools and technologies to demonstrate the complete lifecycle of a data engineering project, including API consumption, database optimization, and business intelligence visualizations.

### Objectives:
- Extract Pokémon data from the PokeAPI.
- Clean and optimize the data for relational database storage.
- Analyze and visualize data using Power BI.

---

## Python Workflow

### Steps:
1. **Access PokeAPI**:
   - Extract Pokémon data using Python's `requests` library.
![PokeAPI Screenshot](./screenshots/pokeapi%20landing.png)


2. **Flatten JSON Data**:
   - Custom functions were developed to transform JSON structures into tabular formats suitable for pandas DataFrames.
![PokeAPI Screenshot](./screenshots/pokeapi%20sample%202.png)

3. **Export Data**:
   - Save cleaned and structured data as CSV files for database import.

### Outputs:
- [Insert filenames for the exported CSVs.]

---

## SQL Workflow

### Steps:
1. **Data Import and Optimization**:
   - Imported the CSV files into a SQL database and optimized the data structure for querying.

2. **Data Cleaning**:
   - Cleaned up data inconsistencies, ensuring accurate relationships between tables.

3. **Table Creation**:
   - Created tables for Pokémon `species`, `stats`, and `types`.
   - Ensured Pokémon `id` serves as a unique primary key across all tables.

4. **Handling Repeated Types**:
   - Managed duplicate primary keys for Pokémon with multiple types while maintaining referential integrity.

### Outputs:
- Initial tables: `species`, `stats`, `types`.
- Final tables: [Insert names of final tables.]

---

## Excel Workflow

### Steps:
1. **Final Selection**:
   - Exported three primary tables (`species`, `stats`, `types`) for final review in Excel.

2. **Cleanup**:
   - Performed additional formatting and transformations to prepare for visualization in Power BI.

### Outputs:
- [Insert cleaned Excel files or describe transformations applied.]

---

## Power BI Workflow

### Steps:
1. **Import Data**:
   - Imported the cleaned tables into Power BI and established relationships between them.

2. **Model Optimization**:
   - Created DAX measures to enhance interactivity and enable customized color schemes and slicers.

3. **Dashboard Creation**:
   - Designed an interactive dashboard to visualize Pokémon stats, types, and relationships.

### Features:
- Deep interactivity via slicers and drill-downs.
- Custom color schemes representing Pokémon types.
- Visualization of aggregated stats and comparisons.

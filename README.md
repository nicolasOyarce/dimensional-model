# Dimensional Model for Sakila Database
## Project Description
This project involves the implementation of a dimensional model based on MySQL's Sakila sample database. The primary focus is on analyzing and optimizing the business area related to rentals.

## Methodology

- Initial Analysis: A comprehensive analysis of the Sakila database was conducted to identify key business areas.
- Dimensional Model Design: A detailed dimensional model was developed, specifically focused on the rental segment.
- SQL Server Implementation: The dimensional model was implemented using SQL Server as the database management system.
- OLAP Cube Development: SQL Server Analysis Services (SSAS) was utilized through Visual Studio to create an OLAP (Online Analytical Processing) cube based on the dimensional model.
- Data Visualization: The final stage involved using Power BI to create interactive visualizations and dashboards.

## Key Features

- Business Requirements: 21 business questions were formulated, serving as requirements for the analysis.
- Comparative Queries: For each question, queries were developed for both the dimensional model and the original database, allowing for a comparative analysis of performance and functionality.
- Custom ETL Process: Specific tables and stored procedures were designed and implemented for the extraction, transformation, and loading (ETL) of data into the dimensional model. This ETL process is performed directly in SQL Server using stored procedures, enabling seamless integration between the source database and the dimensional model.

## Technologies Used

- MySQL (Original Sakila sample database)
- Microsoft SQL Server (Dimensional model implementation and ETL process)
- SQL Server Analysis Services (SSAS) (OLAP cube development and processing)
- Visual Studio (Development environment for SSAS)
- Power BI (Data visualization and analysis)
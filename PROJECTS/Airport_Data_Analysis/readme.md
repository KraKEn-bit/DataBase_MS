## **This repository contains the database project for **INDIGO FLIGHT MANAGEMENT SYSTEM** . It includes the full database schema, data, stored procedures, and an ER diagram. Also all the codes if you want to see the inside ! **



## Files Included

- `airport_data.sql` → Full database export including tables, data, stored procedures, and views.
- `ERD.png` → Entity-Relationship diagram showing tables and their relationships.

## Description

The project covers the following:

- **Tables:** Airport, Flight, FlightMetrics, etc.
- **Relationships:** One-to-many and many-to-many relationships between tables.
- **Stored Procedures & Views:** Includes pre-written procedures for common queries.
- **Data Analysis:** You can run SQL queries to analyze flight data, passenger statistics, etc.

## ER Diagram

![ER Diagram](PROJECTS/Airport_Data_Analysis/ER_Diagram_Indigo_Data_Analysis.png)

## How to Use

1. Open MySQL Workbench.  
2. Create a new schema (or database).  
3. Import the SQL file:
   - Go to `Server → Data Import`  
   - Choose `Import from Self-Contained File` → select `airport_data.sql`  
   - Choose target schema  
   - Click **Start Import**  
4. After importing, all tables, data, views, and stored procedures will be available.  



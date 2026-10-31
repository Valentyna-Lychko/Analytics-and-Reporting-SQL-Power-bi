# 🛠️ Technical Data Preparation and Modeling

The revenue analysis, product assortment, and customer purchasing behavior reports, as well as the RFM analysis, are built upon a **unified relational data model**. The data processing, transformation, calculations, and structuring pipeline is divided into three sequential steps: **SQL**, **Power Query**, and **Power BI**.

---

### 1. SQL Stage (Primary Processing & PostgreSQL)
Initial calculations, data consolidation, and aggregation were performed at the database level using complex SQL queries, including CTEs (*Common Table Expressions*) and window functions.
*   **Customer Activity Metrics:** Computed exact first and last purchase dates for each unique customer, total successful order counts, total revenue generated (Monetary), individual purchasing time intervals, and the average order value (AOV) per client.
*   **RFM Metrics Calculation:** Formulated baseline scoring for Recency, Frequency, and Monetary value. Based on these calculated scores, customers were automatically segmented into fixed business groups (`RFM_Group`).

*Note: The complete SQL script is available as a separate file in the repository root — **[full_analytics_processing.sql](../full_analytics_processing.sql)**.*


---

### 2. Power Query Stage (ETL Process)
During the ETL transformation phase in Power Query, final data cleansing was executed, and additional analytical columns were calculated:
*   Established data groupings and classifications required for the correct rendering and filtering of the final report charts and visual matrices.
*   Optimized data types and structured relationships to ensure seamless data integration from PostgreSQL into the Power BI model.

---

### 3. Power BI Stage (Data Model Architecture)
The final analytical architecture and reporting layer were configured directly within Power BI using the DAX calculation language:
*   **Structuring the model:** Created a dedicated technical table named `_DAX_measures`. This table centralizes, isolates, and logically groups all project measures in a single place to ensure effortless model maintenance.
*   **Dynamic analysis:** Implemented a field parameter table (`MetricSelector`). This enables interactive switching between different business metrics on the same chart without cluttering the user interface.
*   **Calculated columns:** Developed internal calculated columns via DAX directly inside the data model to provide additional analytical granularities during dashboard filtering.

# 📊 Analytical Reports Structure and Interface

The project is structured into **three separate interactive reports**. Each report includes analytical insights and recommendations, accessible via a dedicated on-screen button that triggers a pop-up window for an optimal user experience.

---

### 1. Report 1. Revenue, Assortment, and Purchasing Behavior Analysis
The primary analytical report consists of four Power BI pages dedicated to exploring target audience demographics, revenue patterns, product categories, and purchasing behavior.

*   **Clients Target Audience and Revenue Overview:** General overview of the target audience profile and core revenue performance metrics.
*   **Skin Type: Sales Structure and Order Metrics by Skin Type & Condition:** Breakdown of sales and order metrics filtered by customer skin types and specific skin conditions.
*   **Basic Skincare: Skin type and condition of returning customers:** In-depth analysis of the customer segment returning for the Basic Skincare product line.
*   **Product Range & SKU Sales Activity:** Analysis of sales performance in both monetary and physical terms (revenue, units sold, and fluid volume in ml) across packaging sizes.

**🎛️ Report Functionality & Interactivity:**
*   *Filter application:* Page-level slicers allow dynamic segmentation and instant data drill-down on the active dashboard sheet.
*   *Metric switching:* A toggle functionality allows users to pick one of three distinct business metrics, dynamically refreshing the active chart visuals.
*   *Analytical insights:* A custom button triggers a clean pop-up window containing business explanations, preserving dashboard workspace.

👉 **[View page-by-page Report 1 details and screenshots](report_1_details_en.md)**

---

### 2. Report 2. Customer RFM Analysis
This report delivers an extensive behavioral audit of the customer base, evaluates customer quality, and highlights the most margin-rich buyer segments.

*   **RFM Info:** Documentation of the RFM analysis methodology, score logic, and segmentation boundaries.
*   **RFM Analysis Group Key Metrics:** Performance review of key metrics across RFM groups and the percentage of active buyers within each segment.
*   **VIP and Monetary Customer Purchase Details:** Transaction-level breakdown of purchase sequences, product categories, and item volumes for top-tier VIP and Monetary cohorts.

**🎛️ Report Functionality & Interactivity:**
*   *Cohort switching:* Custom interactive buttons enable instant toggling between VIP and Monetary groups, as well as switching between high-level summaries and granular views.
*   *Metric selection:* Deep-dive capabilities let users choose between Revenue, Amount (units sold), or fluid Volume (ml).
*   *SQL Integration:* Base segmentation and grading are processed via an optimized database-level SQL query.

👉 **[View page-by-page Report 2 details and screenshots](report_2_details_en.md)**

---

### 3. Report 3. New Customer Acquisition and Churn Dynamics
This module tracks the customer lifecycle, analyzes database growth velocity, and closely monitors deactivated accounts.

*   **New Clients and Client Drop-Off Dynamics:** Quarterly and monthly analysis of new client acquisition, net volume fluctuations, returning buyers, and customer attrition patterns.

**🎛️ Report Functionality & Interactivity:**
*   *Insights and predictive forecasting:* Features a forecast scenario mapping database stability, accessible via an interactive pop-up window button on the dashboard layout.

👉 **[View page-by-page Report 3 details and screenshots](report_3_details_en.md)**

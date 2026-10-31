-- SQL Script for executing database-level RFM Customer Segmentation

WITH sells_cte AS (
  -- Step 1: Extract core baseline sales tracking metrics
  SELECT *
  FROM STA.sells_calc
),

rfm AS (
  -- Step 2: Compute balanced points for Recency, Frequency, and Monetary parameters
  SELECT
    *,
    
    -- 🔁 FrequencyScore: grading based on total historical transactions executed per client
    -- 1 order → 1 point | 2–10 orders → 2 points | more than 10 orders → 3 points
    CASE
      WHEN client_order = 1 THEN 1
      WHEN client_order BETWEEN 2 AND 10 THEN 2
      WHEN client_order > 10 THEN 3
    END AS FrequencyScore,

    -- 🕒 RecencyScore: grading based on month gaps since the client's last active order
    -- Evaluated against a fixed project reporting baseline date (01.03.2022)
    -- <= 6 mos. → 3 points | between 6 and 24 mos. → 2 points | > 24 mos. → 1 point
    CASE
      WHEN DATE_DIFF(DATE '2022-03-01', PARSE_DATE('%d.%m.%Y', last_date), MONTH) <= 6 THEN 3
      WHEN DATE_DIFF(DATE '2022-03-01', PARSE_DATE('%d.%m.%Y', last_date), MONTH) <= 24 THEN 2
      WHEN DATE_DIFF(DATE '2022-03-01', PARSE_DATE('%d.%m.%Y', last_date), MONTH) > 24 THEN 1
    END AS RecencyScore,

    -- 💰 MonetaryScore: grading based on Lifetime Value (total individual user spend)
    -- < 2,000 UAH → 1 point | between 2,000 and 20,000 UAH inclusive → 2 points | > 20,000 UAH → 3 points
    CASE
      WHEN client_revenue > 20000 THEN 3
      WHEN client_revenue BETWEEN 2000 AND 20000 THEN 2
      WHEN client_revenue < 2000 THEN 1
    END AS MonetaryScore
  FROM sells_cte
),

rfm_cod AS (
  -- Step 3: Standardize scoring dimensions into a clean three-digit string code (e.g., 3 + 2 + 1 = "321")
  SELECT 
    *,
    CONCAT(CAST(RecencyScore AS STRING), CAST(FrequencyScore AS STRING), CAST(MonetaryScore AS STRING)) AS RFM_Code
  FROM rfm
)

-- Step 4: Map consolidated behavioral combinations to explicit marketing segments
SELECT 
  *,
  CASE
    -- 👑 VIP: Elite customer profiles hitting peak value thresholds across all dimensions
    WHEN RFM_Code = "333" THEN "VIP"

    -- 💰 Monetary: High-spending client matrices (> 20,000 UAH total equity) outside the active VIP cohort
    WHEN RFM_Code IN ("113", "123", "133", "213", "223", "233") THEN "Monetary"

    -- 🟢 Stable: Reliable multi-purchase consumer base active within a 6-to-24-month horizon
    WHEN RFM_Code IN ("222", "232") THEN "Stable"

    -- 🔁 Frequent: High transactional volume histories presenting standard monetary values
    WHEN RFM_Code IN ("131", "132", "231") THEN "Frequent"

    -- 🕒 Recent: Freshly activated users showing strong immediate engagement potential (e.g., code 323)
    WHEN RFM_Code IN ("311", "312", "313", "321", "322", "323", "331", "332") THEN "Recent"

    -- 🟡 Passive: Legacy data profiles demonstrating minimal active engagement signals
    WHEN RFM_Code IN ("111", "112", "121", "122", "211", "212", "221") THEN "Passive"
  END AS RFM_Group
FROM rfm_cod;

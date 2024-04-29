{% macro macro_monthly_total_passengers() %}
{{ config(materialized='table') }}

SELECT
payment_type,
EXTRACT(MONTH FROM `lpep_pickup_datetime`) AS month,
SUM (total_amount) + SUM (Tip_amount) as revenue,
FROM `weekly-assignment-2.weekly3.taxi_tripdata`
GROUP BY month, payment_type
ORDER BY payment_type ASC, month ASC

{% endmacro %}
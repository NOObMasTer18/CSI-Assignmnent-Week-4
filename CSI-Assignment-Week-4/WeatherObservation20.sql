WITH ORDERED AS (
    SELECT LAT_N, ROW_NUMBER() OVER(ORDER BY LAT_N) AS rn, COUNT(*) OVER() AS total_rows
    FROM STATION
)
, mid_values AS (
    SELECT LAT_N
    FROM ORDERED 
    WHERE rn IN(FLOOR((total_rows+1)/2), CEIL((total_rows+1)/2))
)

SELECT ROUND(AVG(LAT_N),4) AS median
FROM mid_values;
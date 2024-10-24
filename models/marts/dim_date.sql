WITH generate_days AS (
  SELECT
    date
  FROM
    UNNEST(
      GENERATE_DATE_ARRAY(
        DATE "2010-01-01",
        DATE "2029-12-31",
        INTERVAL 1 DAY
      )
    ) AS date
),
final AS (
  SELECT
    UNIX_DATE(date) AS dim_date_id,
    TIMESTAMP(date) AS date,
    EXTRACT(DAYOFWEEK FROM date) AS day_of_the_week_number,
    FORMAT_DATE("%A", date) AS day_of_the_week_text,
    EXTRACT(DAY FROM date) AS day_of_the_month_number,
    FORMAT_DATE("%e", date) AS day_of_the_month_text,
    EXTRACT(MONTH FROM date) AS month_number,
    FORMAT_DATE("%B", date) AS month_text,
    EXTRACT(DAYOFYEAR FROM date) AS day_of_the_year,
    EXTRACT(WEEK FROM date) AS week_of_the_year,
    EXTRACT(QUARTER FROM date) AS quarter_number,
    EXTRACT(YEAR FROM date) AS year_number,
    CASE 
      WHEN FORMAT_DATE("%A", date) IN ("Saturday", "Sunday") THEN "weekend"
      ELSE "weekday"
    END AS is_weekday_or_weekend
  FROM
    generate_days
)

SELECT * FROM final
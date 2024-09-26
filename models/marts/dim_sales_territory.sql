WITH sales_territory AS (
  SELECT
    *
  FROM
    {{ ref("stg__sales_territory") }}
)

SELECT * FROM sales_territory

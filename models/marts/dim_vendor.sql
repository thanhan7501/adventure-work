WITH vendor AS (
  SELECT
    *
  FROM
    {{ ref("stg__vendor") }}
)

SELECT * FROM vendor
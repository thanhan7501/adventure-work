WITH customer AS (
  SELECT 
    c.customer_id AS customer_id,
    c.person_id AS person_id,
    c.reseller_store_id AS reseller_store_id,
    s.reseller_store_name AS reseller_store_name,
    p.person_title AS person_title,
    p.person_title AS person_first_name,
    p.person_title AS person_middle_name,
    p.person_title AS person_last_name,
    p.person_title AS person_suffix
  FROM {{ ref("stg__customer") }} AS c
  LEFT JOIN {{ ref("stg__person") }} AS p ON c.person_id = p.person_id
  LEFT JOIN {{ ref("stg__store") }} AS s ON c.reseller_store_id = s.reseller_store_id
)

SELECT * FROM customer
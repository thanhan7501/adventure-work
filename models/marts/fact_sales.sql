WITH sales AS (
  SELECT
    *
  FROM
    {{ ref("stg__sales_order_detail") }}
),
final AS (
  SELECT
    sod.sales_order_id AS sales_order_id,
    sod.dim_product_id AS dim_product_id,
    sod.order_qty AS order_qty,
    sod.product_unit_price AS product_unit_price,
    sod.product_unit_price_discount AS product_unit_price_discount,
    sod.sales_order_detail_id AS sales_order_detail_id,
    soh.order_date_datetime AS order_date_datetime,
    soh.ship_date_datetime AS ship_date_datetime,
    soh.total_amount AS total_amount,
    soh.sales_order_number AS sales_order_number,
    COALESCE(soh.dim_customer_id, 0) as dim_customer_id,
    COALESCE(soh.dim_sales_person_id, 0) as dim_sales_person_id,
    COALESCE(soh.dim_sales_territory_id, 0) as dim_sales_territory_id,
    UNIX_DATE(soh.order_date_datetime) AS order_date_id,
    UNIX_DATE(soh.ship_date_datetime) AS ship_date_id
  FROM sales AS sod
  LEFT JOIN {{ ref("stg__sales_order_header") }} AS soh ON sod.sales_order_id = soh.sales_order_id
)

SELECT * FROM final
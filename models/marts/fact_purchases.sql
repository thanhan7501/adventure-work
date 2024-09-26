WITH purchases AS (
  SELECT
    *
  FROM
    {{ ref("stg__purchase_order_detail") }}
),
final AS (
  SELECT
    pod.purchase_order_id AS purchase_order_id,
    pod.purchase_order_detail_id AS purchase_order_detail_id,
    pod.order_qty AS order_qty,
    pod.order_amount AS order_amount,
    pod.dim_product_id AS dim_product_id,
    pod.unit_price AS unit_price,
    pod.received_qty AS received_qty,
    pod.rejected_qty AS rejected_qty,
    pod.stocked_qty AS stocked_qty,
    pod.received_amount AS received_amount,
    pod.rejected_amount AS rejected_amount,
    pod.stocked_amount AS stocked_amount,
    poh.dim_vendor_id AS dim_vendor_id,
    poh.order_date_datetime AS order_date_datetime,
    poh.ship_date_datetime AS ship_date_datetime,
    UNIX_DATE(poh.order_date_datetime) AS order_date_id,
    UNIX_DATE(poh.ship_date_datetime) AS ship_date_id
  FROM purchases AS pod
  LEFT JOIN {{ ref("stg__purchase_order_header") }} AS poh ON pod.purchase_order_id = poh.purchase_order_id
)

SELECT * FROM final
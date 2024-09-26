WITH product AS (
  SELECT
    p.product_id AS product_id,
    p.product_name AS product_name,
    p.product_number AS product_number,
    p.make_flag AS make_flag,
    p.finished_goods_flag AS finished_goods_flag,
    p.color AS color,
    p.size AS size,
    p.size_unit_measure_code AS size_unit_measure_code,
    p.weight AS weight,
    p.weight_unit_measure_code AS weight_unit_measure_code,
    p.product_line_code AS product_line_code,
    p.class_code AS class_code,
    p.style AS style,
    COALESCE(p.product_subcategory_id, 0) AS product_subcategory_id,
    ps.product_subcategory_name AS product_subcategory_name,
    COALESCE(ps.product_category_id, 0) AS product_category_id,
    pc.product_category_name AS product_category_name,
    COALESCE(p.product_model_id, 0) AS product_model_id,
    pm.product_model_name AS product_model_name,
    p.start_date AS start_date,
    p.end_date AS end_date
  FROM
    {{ ref("stg__product") }} AS p
    LEFT JOIN {{ ref("stg__product_subcategory") }} AS ps ON p.product_subcategory_id = ps.product_subcategory_id
    LEFT JOIN {{ ref("stg__product_model") }} AS pm ON p.product_model_id = pm.product_model_id
    LEFT JOIN {{ ref("stg__product_category") }} AS pc ON ps.product_category_id = pc.product_category_id
)

SELECT * FROM product
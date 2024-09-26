WITH product AS (
	SELECT
		*
	FROM
		`sunny-ship-430009-t4.adventure_work.Product`
),
rename AS (
	SELECT
		ProductID AS product_id,
		ProductNumber AS product_number,
		Name AS product_name,
		MakeFlag AS make_flag,
		FinishedGoodsFlag AS finished_goods_flag,
		Color AS color,
		Size AS size,
		SizeUnitMeasureCode AS size_unit_measure_code,
		Weight AS weight,
		WeightUnitMeasureCode AS weight_unit_measure_code,
		ProductLine AS product_line_code,
		Class AS class_code,
		Style AS style,
		ProductSubcategoryID AS product_subcategory_id,
		ProductModelID AS product_model_id,
		SellStartDate AS start_date,
		SellEndDate AS end_date,
	FROM
		product
),
remove_null AS(
	SELECT
		product_id,
		product_number,
		product_name,
		make_flag,
		finished_goods_flag,
		color,
		size,
		size_unit_measure_code,
		COALESCE(weight, 0) AS weight,
		weight_unit_measure_code,
		product_line_code,
		class_code,
		style,
		COALESCE(product_subcategory_id, 0) AS product_subcategory_id,
		COALESCE(product_model_id, 0) AS product_model_id,
		start_date,
		end_date
	FROM
		rename
),
final AS (
	SELECT
		product_id,
		product_number,
		product_name,
		CAST(make_flag AS BOOLEAN) AS make_flag,
		CAST(finished_goods_flag AS BOOLEAN) AS finished_goods_flag,
		color,
		size,
		size_unit_measure_code,
		CAST(weight AS DECIMAL) AS weight,
		weight_unit_measure_code,
		product_line_code,
		class_code,
		style,
		product_subcategory_id,
		product_model_id,
		start_date,
		end_date
	FROM
		remove_null
)

SELECT * FROM final
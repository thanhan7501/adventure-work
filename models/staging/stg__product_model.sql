WITH product_model AS (
	SELECT
		*
	FROM
		`sunny-ship-430009-t4.adventure_work.ProductModel`
),
final AS(
	SELECT
		ProductModelID AS product_model_id,
		Name AS product_model_name
	FROM
		product_model

	UNION ALL
	SELECT
		0 AS product_model_id,
		"Undefined" AS product_model_name
)

SELECT * FROM final
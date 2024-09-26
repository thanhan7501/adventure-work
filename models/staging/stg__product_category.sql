WITH product_category AS (
	SELECT
		*
	FROM
		`sunny-ship-430009-t4.adventure_work.ProductCategory`
),
final AS (
	SELECT
		ProductCategoryID AS product_category_id,
		Name AS product_category_name
	FROM
		product_category

	UNION ALL
	SELECT
		0 AS product_category_id,
		"Undefined" AS product_category_name
)

SELECT * FROM final
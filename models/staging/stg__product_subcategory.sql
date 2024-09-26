WITH product_subcategory AS (
	SELECT
		*
	FROM
		`sunny-ship-430009-t4.adventure_work.ProductSubcategory`
),
final AS (
	SELECT
		ProductSubcategoryID AS product_subcategory_id,
		ProductCategoryID AS product_category_id,
		Name AS product_subcategory_name
	FROM
		product_subcategory

	UNION ALL
	SELECT
		0 AS product_subcategory_id,
		0 AS product_category_id,
		"Undefined" AS product_subcategory_name
)

SELECT * FROM final
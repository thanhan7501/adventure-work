WITH store AS (
	SELECT
		*
	FROM
		`sunny-ship-430009-t4.adventure_work.Store`
),
final AS (
	SELECT
		BusinessEntityID AS reseller_store_id,
		Name AS reseller_store_name
	FROM store

	UNION ALL
	SELECT
		0 AS reseller_store_id,
		"Undefined" AS reseller_store_name
)

SELECT * FROM final
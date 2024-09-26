WITH sales_person AS (
	SELECT
		*
	FROM
		`sunny-ship-430009-t4.adventure_work.SalesPerson`
),
final AS (
	SELECT
		BusinessEntityID AS sales_person_entity_id,
	FROM
		sales_person
)

SELECT * FROM final
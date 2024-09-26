WITH customer AS (
	SELECT 
		*
	FROM `sunny-ship-430009-t4.adventure_work.Customer`
),
rename AS (
	SELECT
		CustomerID AS customer_id,
		PersonID AS person_id,
		StoreID AS reseller_store_id,
	FROM customer
),
remove_null AS (
	SELECT
		customer_id,
		REPLACE(person_id,"NULL","0") AS person_id,
		REPLACE(reseller_store_id,"NULL","0") AS reseller_store_id,
	FROM rename
),
final AS (
	SELECT
		customer_id,
		CAST(person_id AS INTEGER) AS person_id,
    CAST(reseller_store_id AS INTEGER) AS reseller_store_id,
	FROM remove_null
)

SELECT * FROM final
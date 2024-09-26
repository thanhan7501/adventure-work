WITH sales_order_header AS (
	SELECT
		*
	FROM
		`sunny-ship-430009-t4.adventure_work.SalesOrderHeader`
),
rename AS (
	SELECT
		SalesOrderID AS sales_order_id,
		OrderDate AS order_date_datetime,
		ShipDate AS ship_date_datetime,
		TotalDue AS total_amount,
		SalesOrderNumber AS sales_order_number,
		CustomerID AS dim_customer_id,
		SalesPersonID AS dim_sales_person_id,
		TerritoryID AS dim_sales_territory_id
	FROM
		sales_order_header
),
remove_null AS (
	SELECT
		sales_order_id,
		CAST(order_date_datetime AS DATE) AS order_date_datetime,
		CAST(ship_date_datetime AS DATE) AS ship_date_datetime,
		total_amount,
		sales_order_number,
		COALESCE(dim_customer_id, 0) AS dim_customer_id,
    REPLACE(dim_sales_person_id, "NULL", "0") AS dim_sales_person_id,
    COALESCE(dim_sales_territory_id, 0) AS dim_sales_territory_id
	FROM
		rename
),
final AS (
	SELECT
		sales_order_id,
		order_date_datetime,
		ship_date_datetime,
		total_amount,
		sales_order_number,
		dim_customer_id,
    CAST(dim_sales_person_id AS INTEGER) AS dim_sales_person_id,
    dim_sales_territory_id
	FROM
		remove_null

	UNION ALL
  SELECT
    0 AS sales_order_id,
    "9999-01-01" AS order_date_datetime,
    "9999-01-01" AS ship_date_datetime,
		0 AS total_amount,
		"Undefined" AS sales_order_number,
    0 AS dim_customer_id,
    0 AS dim_sales_person_id,
    0 AS dim_sales_territory_id
)

SELECT * FROM final
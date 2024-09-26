WITH purchase_order_header AS (
	SELECT
		*
	FROM
		`sunny-ship-430009-t4.adventure_work.PurchaseOrderHeader`
),
final AS (
	SELECT 
		PurchaseOrderID as purchase_order_id,
		VendorID as dim_vendor_id,
		CAST(OrderDate AS DATE) AS order_date_datetime,
		CAST(ShipDate AS DATE) AS ship_date_datetime,
	FROM purchase_order_header

	UNION ALL
  SELECT
    0 AS purchase_order_id,
    0 AS dim_vendor_id,
    "9999-01-01" AS order_date_datetime,
    "9999-01-01" AS ship_date_datetime,
)

SELECT * FROM final
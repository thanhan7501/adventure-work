WITH sales_order_detail AS (
	SELECT
		*
	FROM
		`sunny-ship-430009-t4.adventure_work.SalesOrderDetail`
),
final AS (
	SELECT
		SalesOrderID AS sales_order_id,
		SalesOrderDetailID AS sales_order_detail_id,
		ProductID AS dim_product_id,
		OrderQty AS order_qty,
		UnitPrice AS product_unit_price,
		UnitPriceDiscount AS product_unit_price_discount,
	FROM
		sales_order_detail
)

SELECT * FROM final
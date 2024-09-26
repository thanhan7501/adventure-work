WITH purchase_order_detail AS (
	SELECT
		*
	FROM
		`sunny-ship-430009-t4.adventure_work.PurchaseOrderDetail`
),
final AS (
	SELECT
		PurchaseOrderID AS purchase_order_id,
		PurChaseOrderDetailID AS purchase_order_detail_id,
		OrderQty AS order_qty,
		CAST(OrderQty AS INTEGER) AS order_amount,
		ProductID AS dim_product_id,
		UnitPrice AS unit_price,
		ReceivedQty AS received_qty,
		RejectedQty AS rejected_qty,
		StockedQty AS stocked_qty,
		CAST(ReceivedQty AS INTEGER) AS received_amount,
		CAST(RejectedQty AS INTEGER) AS rejected_amount,
		CAST(StockedQty AS INTEGER) AS stocked_amount
	FROM purchase_order_detail
)

SELECT * FROM final
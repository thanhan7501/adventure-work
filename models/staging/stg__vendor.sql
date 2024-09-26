WITH vendor AS (
	SELECT
		*
	FROM
		`sunny-ship-430009-t4.adventure_work.Vendor`
),
rename AS (
	SELECT
		BusinessEntityID AS vendor_id,
		AccountNumber AS account_number,
		Name AS name,
		CreditRating AS credit_rating_id,
		PreferredVendorStatus AS preferred_vendor
	FROM
		vendor
),
final AS (
	SELECT
		vendor_id,
		account_number,
		name,
		credit_rating_id,
		CAST(preferred_vendor AS BOOLEAN) AS preferred_vendor
	FROM
		rename
)
SELECT
	*
FROM
	final
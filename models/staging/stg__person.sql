WITH person AS (
	SELECT 
		*
	FROM `sunny-ship-430009-t4.adventure_work.Person`
),
rename AS (
	SELECT
		BusinessEntityID AS person_id,
		Title AS person_title,
		FirstName AS person_first_name,
		MiddleName AS person_middle_name,
		LastName AS person_last_name,
		Suffix AS person_suffix
	FROM person
),
final AS (
	SELECT
		person_id,
		person_title,
		person_first_name,
		person_middle_name,
		person_last_name,
		person_suffix
	FROM rename

	UNION ALL
	SELECT
		0 AS person_id,
		"Undefined" person_title,
		"Undefined" person_first_name,
		"Undefined" person_middle_name,
		"Undefined" person_last_name,
		"Undefined" person_suffix
)

SELECT * FROM final
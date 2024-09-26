WITH employee AS (
	SELECT 
		*
	FROM 
		`sunny-ship-430009-t4.adventure_work.Employee`
),
rename AS (
	SELECT
		BusinessEntityID AS employee_id,
		JobTitle AS employee_job_title,
		Gender AS employee_gender_code,
		HireDate AS employee_hire_date,
		MaritalStatus AS employee_marital_status,
		NationalIDNumber AS employee_national_id_number
	FROM
		employee
),
final AS (
	SELECT
		employee_id,
		employee_job_title,
		employee_gender_code,
		employee_hire_date,
		employee_marital_status,
		CAST(employee_national_id_number AS STRING) AS employee_national_id_number
	FROM
		rename

	UNION ALL
	SELECT
		0 AS employee_id,
		"Undefined" AS employee_job_title,
		"Undefined" AS employee_gender_code,
		"9999-01-01" AS employee_hire_date,
		"Undefined" AS employee_marital_status,
		"Undefined" AS employee_national_id_number
)

SELECT * FROM final
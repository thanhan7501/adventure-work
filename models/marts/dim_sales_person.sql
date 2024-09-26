WITH sales_person AS (
  SELECT
    sp.sales_person_entity_id AS sales_person_entity_id,
    p.person_title AS person_title,
		p.person_first_name AS person_first_name,
		p.person_middle_name AS person_middle_name,
		p.person_last_name AS person_last_name,
		p.person_suffix AS person_suffix,
    e.employee_job_title AS employee_job_title,
		e.employee_gender_code AS employee_gender_code,
		e.employee_hire_date AS employee_hire_date,
		e.employee_marital_status AS employee_marital_status,
		e.employee_national_id_number AS employee_national_id_number
  FROM
    {{ ref("stg__sales_person") }} AS sp
  LEFT JOIN {{ ref("stg__person")}} AS p ON sp.sales_person_entity_id = p.person_id
  LEFT JOIN {{ ref("stg__employee") }} AS e ON sp.sales_person_entity_id = e.employee_id
)

SELECT * FROM sales_person
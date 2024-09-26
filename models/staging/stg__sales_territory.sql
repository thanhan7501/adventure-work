WITH sales_territory AS (
  SELECT
    *
  FROM
    `sunny-ship-430009-t4.adventure_work.SalesTerritory`
),
final AS (
  SELECT
    TerritoryID AS dm_sales_territory_id,
    Name AS sales_territory_name,
    CountryRegionCode AS country_region_code,
    "Group" AS group_name
  FROM
    sales_territory
)

SELECT * FROM final
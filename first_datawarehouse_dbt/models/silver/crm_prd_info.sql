WITH crm_prd_info AS (
	SELECT 	
		prd_id
		,replace(substring(prd_key for 5), '-', '_') AS cat_id
		,substring(prd_key from 7 for length(prd_key)) as prd_key
		,coalesce(prd_cost, 0) AS prd_cost
		,case UPPER(TRIM(prd_line))
			when 'M' then 'Mountain'
			when 'S' then 'Other Sales'
			when 'T' then 'Touring'
			when 'R' then 'Road'
			else 'n/a'
		end as prd_line
		,prd_start_dt::date
		,(LEAD(prd_start_dt) OVER (partition by prd_key order by prd_start_dt asc) - interval '1 days')::date as prd_end_dt
		FROM bronze.crm_prd_info
	)
SELECT * FROM crm_prd_info
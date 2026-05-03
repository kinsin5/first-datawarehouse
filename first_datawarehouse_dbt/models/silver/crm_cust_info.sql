WITH crm_cust_info AS (
	SELECT 
		cst_id
		,cst_key
		,TRIM(cst_firstname) AS cst_firstname
		,TRIM(cst_lastname) AS cst_lastname
		,CASE 
			WHEN cst_martial_status = 'M' THEN 'Married'
			WHEN cst_martial_status = 'S' THEN 'Single'
			ELSE 'n/a'
		END AS cst_martial_status
		,CASE 
			WHEN cst_gndr = 'M' THEN 'Male'
			WHEN cst_gndr = 'F' THEN 'Female'
			ELSE 'n/a'
		END AS cst_gdnr
		,cst_create_date
	FROM (
		SELECT 
			*,
			ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) as rn
		FROM bronze.crm_cust_info
		ORDER BY cst_id)f
	WHERE rn = 1)
SELECT * FROM crm_cust_info
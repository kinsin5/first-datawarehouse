select
	cst_id,
	COUNT(*) as cst_id_count
FROM bronze.crm_cust_info
group by cst_id
having 
	COUNT(*) > 1 or cst_id is null;
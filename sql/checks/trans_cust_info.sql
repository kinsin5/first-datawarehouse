--duplicates handling

select * from (
SELECT 
	*,
	ROW_NUMBER() over (partition by cst_id order by cst_create_date desc) flag_last
FROM bronze.crm_cust_info
)t where flag_last = 1


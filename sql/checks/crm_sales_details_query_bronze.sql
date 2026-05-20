select 
	sls_ord_num
	,sls_prd_key
	,sls_cust_id
	,sls_order_dt
	,sls_ship_dt
	,sls_due_dt
	,sls_sales
	,sls_quantity as sls_quantity
	,sls_price as sls_price
from bronze.crm_sales_details
where sls_sales is not null or sls_quantity is not null or sls_price is not null
or sls_sales != 0 or sls_quantity != 0 or sls_price != 0
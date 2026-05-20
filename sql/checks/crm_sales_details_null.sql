with crm_null as (
    select 
				sls_ord_num
				,sls_prd_key
				,sls_cust_id
				,sls_order_dt
				,sls_ship_dt
				,sls_due_dt
				,sls_sales
				,abs(sls_quantity) as sls_quantity
				,abs(sls_price) as sls_price
			from silver.crm_sales_details
			where 
				sls_sales is null or sls_quantity is null or sls_price is null
				or sls_sales = 0 or sls_quantity = 0 or sls_price = 0
    )
    select * from crm_null

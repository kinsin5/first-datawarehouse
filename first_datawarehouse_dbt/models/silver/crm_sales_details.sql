with crm_sales_details as (
	SELECT 
		sls_ord_num
		,sls_prd_key
		,sls_cust_id
        ,{{ parse_date('sls_order_dt') }} as sls_order_dt
        ,{{ parse_date('sls_ship_dt') }} as sls_ship_dt
        ,{{ parse_date('sls_due_dt') }} as sls_due_dt
		,(sls_quantity * sls_price) as sls_sales
		,sls_quantity
		,sls_price
		,now()::timestamp as dwh_created_dt
	from (
			select 
				sls_ord_num
				,sls_prd_key
				,sls_cust_id
				,case
					when length(sls_order_dt) != 8 then '19000101'
					else sls_order_dt
				end as sls_order_dt
				,sls_ship_dt
				,sls_due_dt
				,sls_sales
				,abs(sls_quantity) as sls_quantity
				,abs(sls_price) as sls_price
			from bronze.crm_sales_details
		)	
)
select * from crm_sales_details
with crm_sales_details as (
	SELECT 
		sls_ord_num
		,sls_prd_key
		,sls_cust_id
		,make_date(
			substring(sls_order_dt for 4)::int,
			substring(sls_order_dt from 5 for 2)::int,
			substring(sls_order_dt from 7 for 2)::int	
		) as sls_order_dt
		,make_date(
			substring(sls_ship_dt for 4)::int,
			substring(sls_ship_dt from 5 for 2)::int,
			substring(sls_ship_dt from 7 for 2)::int	
		) as sls_ship_dt
		,make_date(
			substring(sls_due_dt for 4)::int,
			substring(sls_due_dt from 5 for 2)::int,
			substring(sls_due_dt from 7 for 2)::int	
		) as sls_due_dt
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

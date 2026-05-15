SELECT 
    sls_ord_num,
    sls_order_dt,
    sls_ship_dt
    from bronze.crm_sales_details
where sls_ship_dt < sls_order_dt
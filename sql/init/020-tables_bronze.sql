--CRM
CREATE TABLE IF NOT EXISTS bronze.crm_cust_info(
    cst_id INT,
    cst_key VARCHAR(50),
    cst_firstname VARCHAR(50),
    cst_lastname VARCHAR(50),
    cst_martial_status CHAR(1),
    cst_gndr CHAR(1),
    cst_create_date DATE
);

CREATE TABLE IF NOT EXISTS bronze.crm_prd_info(
    prd_id INT,
    prd_key VARCHAR(50),
    prd_nm VARCHAR(50),
    prd_cost INT,
    prd_line CHAR(1),
    prd_start_dt DATE,
    prd_end_dt DATE
);

CREATE TABLE IF NOT EXISTS bronze.crm_sales_details(
    sls_ord_num VARCHAR(8),
    sls_prd_key VARCHAR(50),
    sls_cust_id INT,
    sls_order_dt VARCHAR(8),
    sls_ship_dt VARCHAR(8),
    sls_due_dt VARCHAR(8),
    sls_sales INT,
    sls_quantity INT,
    sls_price INT
);
--ERP

CREATE TABLE IF NOT EXISTS bronze.erp_cust_az12(
    CID VARCHAR(13),
    BDATE DATE,
    GEN VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS bronze.erp_loc_a101(
    CID VARCHAR(11),
    CNTRY VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS bronze.erp_px_cat_g1v2(
    ID VARCHAR(5),
    CAT VARCHAR(50),
    SUBCAT VARCHAR(50),
    MAINTENANCE VARCHAR(3)
);
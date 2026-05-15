CREATE OR REPLACE PROCEDURE bronze.load_data()
LANGUAGE plpgsql
AS $$
DECLARE
    date_start TIMESTAMP;
    date_end TIMESTAMP;
BEGIN                                     

    RAISE NOTICE '================================';
    RAISE NOTICE 'Loading data into bronze layer';
    RAISE NOTICE '================================';

    date_start := CURRENT_TIMESTAMP;

    COPY bronze.crm_cust_info 
    FROM '/data/source_crm/cust_info.csv'
    DELIMITER ',' CSV HEADER;

    COPY bronze.crm_prd_info 
    FROM '/data/source_crm/prd_info.csv'
    DELIMITER ',' CSV HEADER;

    COPY bronze.crm_sales_details
    FROM '/data/source_crm/sales_details.csv'
    DELIMITER ',' CSV HEADER;

    COPY bronze.erp_cust_az12
    FROM '/data/source_erp/cust_az12.csv'
    DELIMITER ',' CSV HEADER;

    COPY bronze.erp_loc_a101
    FROM '/data/source_erp/loc_a101.csv'
    DELIMITER ',' CSV HEADER;

    COPY bronze.erp_px_cat_g1v2
    FROM '/data/source_erp/px_cat_g1v2.csv'
    DELIMITER ',' CSV HEADER;

    date_end := CURRENT_TIMESTAMP;

    RAISE NOTICE 'Data loaded successfully';
    RAISE NOTICE 'Time elapsed: %', (date_end - date_start);

END;                                     
$$;

CALL bronze.load_data();
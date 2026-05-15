
-- Generate row-count queries as notices
DO $$
DECLARE
    rec RECORD;
    row_count BIGINT;
BEGIN
    FOR rec IN
        SELECT tablename
        FROM pg_tables
        WHERE schemaname = 'bronze'
    LOOP
        EXECUTE format(
            'SELECT COUNT(*) FROM bronze.%I',
            rec.tablename
        )
        INTO row_count;

        RAISE NOTICE 'bronze.%: % rows', rec.tablename, row_count;
    END LOOP;
END $$;

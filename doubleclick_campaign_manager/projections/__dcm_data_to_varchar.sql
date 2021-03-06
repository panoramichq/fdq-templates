CREATE OR REPLACE FUNCTION DOUBLECLICK_CAMPAIGN_MANAGER_VIEWS.DCM_DATA_TO_VARCHAR(INPUT VARCHAR)
    RETURNS VARCHAR
    STRICT IMMUTABLE
AS
    $$
    CASE WHEN
        TRIM(INPUT) = '(not set)'
    OR
        TRIM(INPUT) = ''
    THEN
        NULL
    ELSE
        INPUT
    END
    $$
;

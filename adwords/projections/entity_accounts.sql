CREATE OR REPLACE VIEW "ADWORDS_VIEWS"."ENTITY_ACCOUNTS" AS

SELECT 

  ID::VARCHAR                           AS CUSTOMER_ID
  , MANAGER_CUSTOMER_ID::VARCHAR        AS MANAGER_CUSTOMER_ID
  , ACCOUNT_LABEL_ID::VARCHAR           AS ACCOUNT_LABEL_ID
  , ACCOUNT_LABEL_NAME::VARCHAR(256)    AS ACCOUNT_LABEL_NAME
  , CAN_MANAGE_CLIENTS::BOOLEAN         AS CAN_MANAGE_CLIENTS
  , CURRENCY_CODE::VARCHAR(256)         AS CURRENCY_CODE
  , DATE_TIMEZONE::VARCHAR(256)         AS DATE_TIMEZONE
  , NAME::VARCHAR(256)                  AS ACCOUNT_NAME
  , TEST_ACCOUNT::BOOLEAN               AS TEST_ACCOUNT
  , _FIVETRAN_SYNCED::TIMESTAMP_TZ(9)   AS _FIVETRAN_SYNCED

FROM "GOOGLE_ADS_ACCOUNT"."ACCOUNT"
;
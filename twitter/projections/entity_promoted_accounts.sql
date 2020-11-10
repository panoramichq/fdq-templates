CREATE OR REPLACE VIEW "TWITTER_ADS_VIEWS"."ENTITY_PROMOTED_ACCOUNTS" AS

SELECT 

	ID::VARCHAR(256)                  AS PROMOTED_ACCOUNT_ID
	, LINE_ITEM_ID::VARCHAR(256)        AS LINE_ITEM_ID
	, USER_ID::VARCHAR(256)             AS USER_ID
	, ENTITY_STATUS::VARCHAR(256)       AS ENTITY_STATUS
	, CREATED_AT::TIMESTAMP_TZ(9)       AS CREATED_AT
	, UPDATED_AT::TIMESTAMP_TZ(9)       AS UPDATED_AT
	, APPROVAL_STATUS::VARCHAR(256)     AS APPROVAL_STATUS
	, DELETED::BOOLEAN                  AS DELETED
	, _FIVETRAN_SYNCED::TIMESTAMP_TZ(9) AS _FIVETRAN_SYNCED

FROM (

  SELECT *
    , ROW_NUMBER() OVER (PARTITION BY ID ORDER BY _FIVETRAN_SYNCED DESC) ___R
  FROM "TWITTER_ADS"."PROMOTED_ACCOUNT_HISTORY"

) DT
WHERE DT.___R = 1
;


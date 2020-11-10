CREATE OR REPLACE VIEW "TWITTER_ADS_VIEWS"."ENTITY_MEDIA_CREATIVES" AS

SELECT 

	ID::VARCHAR(256)                    AS MEDIA_CREATIVE_ID
	, UPDATED_AT::TIMESTAMP_TZ(9)       AS UPDATED_AT
	, LINE_ITEM_ID::VARCHAR(256)        AS LINE_ITEM_ID
	, ACCOUNT_MEDIA_ID::VARCHAR(256)    AS ACCOUNT_MEDIA_ID
	, LANDING_URL::VARCHAR(256)         AS LANDING_URL
	, ENTITY_STATUS::VARCHAR(256)       AS ENTITY_STATUS
	, APPROVAL_STATUS::VARCHAR(256)     AS APPROVAL_STATUS
	, DELETED::BOOLEAN                  AS DELETED
	, CREATED_AT::TIMESTAMP_TZ(9)       AS CREATED_AT
	, _FIVETRAN_SYNCED::TIMESTAMP_TZ(9) AS _FIVETRAN_SYNCED

FROM (

  SELECT *
    , ROW_NUMBER() OVER (PARTITION BY ID ORDER BY _FIVETRAN_SYNCED DESC) ___R
  FROM "TWITTER_ADS"."MEDIA_CREATIVE_HISTORY"

) DT
WHERE DT.___R = 1
;
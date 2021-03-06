CREATE OR REPLACE VIEW "TWITTER_ADS_VIEWS"."ENTITY_TWEET_USER_MENTIONS" AS

SELECT 

	TWEET_ID::VARCHAR(256)              AS TWEET_ID
	, ID::VARCHAR(256)                  AS USER_ID
	, SCREEN_NAME::VARCHAR(256)         AS SCREEN_NAME
	, NAME::VARCHAR(256)                AS USER_NAME
	, INDICES::VARIANT                  AS USER_INDICES
	, _FIVETRAN_SYNCED::TIMESTAMP_TZ(9) AS _FIVETRAN_SYNCED

FROM "TWITTER_ADS"."TWEET_USER_MENTION"
;


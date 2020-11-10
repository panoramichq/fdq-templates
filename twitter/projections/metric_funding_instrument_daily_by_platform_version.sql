CREATE OR REPLACE VIEW "TWITTER_ADS_VIEWS"."METRIC_FUNDING_INSTRUMENT_DAILY_BY_PLATFORM_VERSION" AS

SELECT 

	ACCOUNT_ID::VARCHAR(256)                                AS ACCOUNT_ID
	, FUNDING_INSTRUMENT_ID::VARCHAR(256)                   AS FUNDING_INSTRUMENT_ID
	, DATE::TIMESTAMP_TZ(9)                                 AS DATE
	, PLACEMENT::VARCHAR(256)                               AS PLACEMENT
    , PLATFORM_NAME::VARCHAR(256)                           AS PLATFORM_NAME
    , PLATFORM_TARGET_VALUE::VARCHAR(256)                   AS PLATFORM_TARGET_VALUE
    , SEGMENT::VARCHAR(256)                                 AS PLATFORM_VERSION
    , _FIVETRAN_SYNCED::TIMESTAMP_TZ(9)                     AS _FIVETRAN_SYNCED
    
    , IMPRESSIONS::NUMBER(38,0)                             AS IMPRESSIONS
    , BILLED_CHARGE_LOCAL_MICRO::NUMBER(38,0)               AS BILLED_CHARGE_LOCAL_MICRO
    , BILLED_ENGAGEMENTS::NUMBER(38,0)                      AS BILLED_ENGAGEMENTS
    , REPLIES::NUMBER(38,0)                                 AS REPLIES
    , ENGAGEMENTS::NUMBER(38,0)                             AS ENGAGEMENTS
    , FOLLOWS::NUMBER(38,0)                                 AS FOLLOWS
    , UNFOLLOWS::NUMBER(38,0)                               AS UNFOLLOWS
    , RETWEETS::NUMBER(38,0)                                AS RETWEETS
    , LIKES::NUMBER(38,0)                                   AS LIKES


FROM "TWITTER_ADS"."FUNDING_INSTRUMENT_PLATFORM_VERSIONS_REPORT"
;


CREATE OR REPLACE VIEW "LINKEDIN_VIEWS"."ENTITY_CAMPAIGN_GROUPS" AS 

SELECT

    ID
    , NAME
    , PLATFORM_CREATED_AT
    , PLATFORM_UPDATED_AT
    , PROCESSED_AT
    , STATUS
    , BACKFILLED
    , RUN_SCHEDULE_START
    , RUN_SCHEDULE_END
    , ACCOUNT_ID

FROM (

  SELECT
    ID::VARCHAR                                 AS ID
    , NAME::VARCHAR                             AS NAME
    , CREATED_TIME::TIMESTAMP_TZ                AS PLATFORM_CREATED_AT
    , LAST_MODIFIED_TIME::TIMESTAMP_TZ          AS PLATFORM_UPDATED_AT
    , _FIVETRAN_SYNCED::TIMESTAMP_TZ            AS PROCESSED_AT
    , STATUS::VARCHAR                           AS STATUS
    , BACKFILLED::BOOLEAN                       AS BACKFILLED
    , RUN_SCHEDULE_START::TIMESTAMP_TZ          AS RUN_SCHEDULE_START
    , RUN_SCHEDULE_END::TIMESTAMP_TZ            AS RUN_SCHEDULE_END
    , ACCOUNT_ID::VARCHAR                       AS ACCOUNT_ID
    , ROW_NUMBER() OVER (PARTITION BY ID ORDER BY _FIVETRAN_SYNCED DESC) AS ROW_NUM
  FROM "LINKEDIN_ADS"."CAMPAIGN_GROUP_HISTORY"

)
WHERE ROW_NUM = 1
;
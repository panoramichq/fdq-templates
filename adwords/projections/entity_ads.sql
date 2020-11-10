CREATE OR REPLACE VIEW "ADWORDS_VIEWS"."ENTITY_ADS" AS

SELECT

    AD_ID
    , AD_TYPE
    , AD_STATUS
    , AD_GROUP_ID
    , AUTOMATED
    , BASE_ADGROUP_ID
    , BASE_CAMPAIGN_ID
    , DEVICE_PREFERENCE
    , DISPLAY_URL
    , FINAL_URL_SUFFIX
    , POLICY_SUMMARY_COMBINED_APPROVAL_STATUS
    , POLICY_SUMMARY_DENORMALIZED_STATUS
    , POLICY_SUMMARY_REVIEW_STATE
    , SYSTEM_MANAGED_ENTITY_SOURCE
    , TRACKING_URL_TEMPLATE
    , URL
    , UPDATED_AT

FROM (

  SELECT 
      ID::VARCHAR                                                   AS AD_ID
      , AD_GROUP_ID::VARCHAR                                        AS AD_GROUP_ID
      , AD_TYPE::VARCHAR(256)                                       AS AD_TYPE
      , AUTOMATED::BOOLEAN                                          AS AUTOMATED
      , BASE_ADGROUP_ID::VARCHAR                                    AS BASE_ADGROUP_ID
      , BASE_CAMPAIGN_ID::VARCHAR                                   AS BASE_CAMPAIGN_ID
      , DEVICE_PREFERENCE::NUMBER(38,0)                             AS DEVICE_PREFERENCE
      , DISPLAY_URL::VARCHAR(256)                                   AS DISPLAY_URL
      , FINAL_URL_SUFFIX::VARCHAR(256)                              AS FINAL_URL_SUFFIX
      , POLICY_SUMMARY_COMBINED_APPROVAL_STATUS::VARCHAR(256)       AS POLICY_SUMMARY_COMBINED_APPROVAL_STATUS
      , POLICY_SUMMARY_DENORMALIZED_STATUS::VARCHAR(256)            AS POLICY_SUMMARY_DENORMALIZED_STATUS
      , POLICY_SUMMARY_REVIEW_STATE::VARCHAR(256)                   AS POLICY_SUMMARY_REVIEW_STATE
      , STATUS::VARCHAR(256)                                        AS AD_STATUS
      , SYSTEM_MANAGED_ENTITY_SOURCE::VARCHAR(256)                  AS SYSTEM_MANAGED_ENTITY_SOURCE
      , TRACKING_URL_TEMPLATE::VARCHAR(512)                         AS TRACKING_URL_TEMPLATE
      , URL::VARCHAR(256)                                           AS URL
      , UPDATED_AT::TIMESTAMP_TZ(9)                                 AS UPDATED_AT
      , _FIVETRAN_SYNCED::TIMESTAMP_TZ(9)                           AS _FIVETRAN_SYNCED
      , ROW_NUMBER() OVER (PARTITION BY ID ORDER BY _FIVETRAN_SYNCED DESC) AS ROW_NUM

  FROM "GOOGLE_ADS_ACCOUNT"."AD_HISTORY"
)
WHERE ROW_NUM = 1
;
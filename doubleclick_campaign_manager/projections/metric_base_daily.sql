CREATE OR REPLACE VIEW "DOUBLECLICK_CAMPAIGN_MANAGER_VIEWS"."METRIC_BASE_DAILY" AS
SELECT
    ACCOUNT_ID                                              AS ACCOUNT_ID
    , ADVERTISER_ID::VARCHAR                                AS ADVERTISER_ID
    , CAMPAIGN_ID::VARCHAR                                  AS CAMPAIGN_ID
    , SITE_ID_DCM_::VARCHAR                                 AS SITE_ID
    , PLACEMENT_ID::VARCHAR                                 AS PLACEMENT_ID
    -- DCM specifies not set ad_ids for programmatic ads, updating values to NULL
    , (CASE WHEN AD_ID IN ('(not set)','')
        THEN NULL
        ELSE AD_ID END)::VARCHAR                            AS AD_ID
    -- DCM specifies NULL for "default" (1x1) Creative IDs.
    , IFNULL(CREATIVE_ID, '__DEFAULT')::VARCHAR             AS CREATIVE_ID
    , ACTIVITY::VARCHAR                                     AS ACTIVITY
    , DATE::DATE                                            AS DATE

    , DBM_COST_ACCOUNT_CURRENCY_::FLOAT                     AS DBM_COST_ACCOUNT_CURRENCY
    , DBM_COST_USD::FLOAT                                   AS DBM_COST_USD
    , MEDIA_COST::FLOAT                                     AS MEDIA_COST
    , CLICKS::NUMBER(38,0)                                  AS CLICKS
    , IMPRESSIONS::NUMBER(38,0)                             AS IMPRESSIONS
    , ACTIVE_VIEW_VIEWABLE_IMPRESSIONS::NUMBER(38,0)        AS ACTIVE_VIEW_VIEWABLE_IMPRESSIONS
    , ACTIVE_VIEW_MEASURABLE_IMPRESSIONS::NUMBER(38,0)      AS ACTIVE_VIEW_MEASURABLE_IMPRESSIONS
    , ACTIVE_VIEW_ELIGIBLE_IMPRESSIONS::NUMBER(38,0)        AS ACTIVE_VIEW_ELIGIBLE_IMPRESSIONS
    , ACTIVE_VIEW_CUSTOM_METRIC_MEASURABLE_IMPRESSIONS::NUMBER(38,0)            AS ACTIVE_VIEW_CUSTOM_METRIC_MEASURABLE_IMPRESSIONS
    , ACTIVE_VIEW_CUSTOM_METRIC_VIEWABLE_IMPRESSIONS::NUMBER(38,0)              AS ACTIVE_VIEW_CUSTOM_METRIC_VIEWABLE_IMPRESSIONS
    , ACTIVE_VIEW_IMPRESSIONS_AUDIBLE_AND_VISIBLE_AT_COMPLETION::NUMBER(38,0)   AS ACTIVE_VIEW_IMPRESSIONS_AUDIBLE_AND_VISIBLE_AT_COMPLETION
    , ACTIVE_VIEW_IMPRESSIONS_VISIBLE_10_SECONDS::NUMBER(38,0)                  AS ACTIVE_VIEW_IMPRESSIONS_VISIBLE_10_SECONDS

    , VIDEO_INTERACTIONS::NUMBER(38,0)                      AS VIDEO_INTERACTIONS
    , VIDEO_PLAYS::NUMBER(38,0)                             AS VIDEO_PLAYS
    , VIDEO_VIEWS::NUMBER(38,0)                             AS VIDEO_VIEWS
    , VIDEO_FIRST_QUARTILE_COMPLETIONS::NUMBER(38,0)        AS VIDEO_FIRST_QUARTILE_COMPLETIONS
    , VIDEO_MIDPOINTS::NUMBER(38,0)                         AS VIDEO_MIDPOINTS
    , VIDEO_THIRD_QUARTILE_COMPLETIONS::NUMBER(38,0)        AS VIDEO_THIRD_QUARTILE_COMPLETIONS
    , VIDEO_COMPLETIONS::NUMBER(38,0)                       AS VIDEO_COMPLETIONS
    
    , TOTAL_CONVERSIONS::FLOAT                              AS TOTAL_CONVERSIONS
    , TOTAL_REVENUE::FLOAT                                  AS TOTAL_REVENUE
    , CLICK_THROUGH_CONVERSIONS::FLOAT                      AS CLICK_THROUGH_CONVERSIONS
    , CLICK_THROUGH_REVENUE::FLOAT                          AS CLICK_THROUGH_REVENUE
    , VIEW_THROUGH_CONVERSIONS::FLOAT                       AS VIEW_THROUGH_CONVERSIONS
    , VIEW_THROUGH_REVENUE::FLOAT                           AS VIEW_THROUGH_REVENUE

FROM "DOUBLE_CLICK_CAMPAIGN_MANAGER"."GENERAL_METRICS_MAIN_ACCOUNT"
;
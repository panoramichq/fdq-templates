CREATE OR REPLACE VIEW "DOUBLECLICK_CAMPAIGN_MANAGER_VIEWS"."ENTITY_PLACEMENTS" AS
SELECT ACCOUNT_ID::VARCHAR                                                  AS ADVERTISER_ID
       , CAMPAIGN_ID::VARCHAR                                               AS CAMPAIGN_ID
       , SITE_ID_DCM_::VARCHAR                                              AS SITE_ID
       , SITE_DCM_::VARCHAR                                                 AS SITE
       , SITE_KEYNAME::VARCHAR                                              AS SITE_KEY_NAME
       , SITE_ID_SITE_DIRECTORY_::VARCHAR                                   AS SITE_DIRECTORY
       , PLACEMENT_ID::VARCHAR                                              AS PLACEMENT_ID
       , PLACEMENT::VARCHAR                                                 AS PLACEMENT
       , PLACEMENT_COST_STRUCTURE::VARCHAR                                  AS PLACEMENT_COST_STRUCTURE

       , DCM_DATA_TO_VARCHAR(PLACEMENT_STRATEGY)                            AS PLACEMENT_STRATEGY
       , (DCM_DATA_TO_VARCHAR(PLACEMENT_RATE))::FLOAT                       AS PLACEMENT_RATE
       , (DCM_DATA_TO_VARCHAR(PLACEMENT_TOTAL_BOOKED_UNITS))::FLOAT         AS PLACEMENT_TOTAL_BOOKED_UNITS
       , (DCM_DATA_TO_VARCHAR(PLACEMENT_TOTAL_PLANNED_MEDIA_COST))::FLOAT   AS PLACEMENT_TOTAL_PLANNED_MEDIA_COST
       , (DCM_DATA_TO_VARCHAR(FLIGHT_BOOKED_COST))::FLOAT                   AS FLIGHT_BOOKED_COST
       , (DCM_DATA_TO_VARCHAR(FLIGHT_BOOKED_RATE))::FLOAT                   AS FLIGHT_BOOKED_RATE
       , (DCM_DATA_TO_VARCHAR(FLIGHT_BOOKED_UNITS))::FLOAT                  AS FLIGHT_BOOKED_UNITS
       , PLANNED_MEDIA_COST::FLOAT                                          AS PLANNED_MEDIA_COST

       , BOOKED_ACTIVITIES::FLOAT                                           AS BOOKED_ACTIVITIES
       , BOOKED_CLICKS::FLOAT                                               AS BOOKED_CLICKS
       , BOOKED_IMPRESSIONS::FLOAT                                          AS BOOKED_IMPRESSIONS
       , BOOKED_VIEWABLE_IMPRESSIONS::FLOAT                                 AS BOOKED_VIEWABLE_IMPRESSIONS
FROM (SELECT *,
             ROW_NUMBER() OVER (PARTITION BY
               ACCOUNT_ID,
               PLACEMENT_ID
               ORDER BY DATE DESC) ___R
      FROM "DOUBLE_CLICK_CAMPAIGN_MANAGER"."GENERAL_METRICS_MAIN_ACCOUNT"
     ) DT
where DT.___R = 1
;

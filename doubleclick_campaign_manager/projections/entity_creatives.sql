CREATE OR REPLACE VIEW "DOUBLECLICK_CAMPAIGN_MANAGER_VIEWS"."ENTITY_CREATIVES" AS
SELECT ACCOUNT_ID::VARCHAR              AS ACCOUNT_ID
       , ADVERTISER_ID::VARCHAR         AS ADVERTISER_ID
       , CREATIVE_ID::VARCHAR           AS CREATIVE_ID
       , CREATIVE::VARCHAR              AS CREATIVE
       , CREATIVE_PIXEL_SIZE::VARCHAR   AS CREATIVE_SIZE
       , CREATIVE_TYPE::VARCHAR         AS CREATIVE_TYPE
FROM (SELECT *,
             ROW_NUMBER() OVER (PARTITION BY
               ACCOUNT_ID,
               ADVERTISER_ID,
               CREATIVE_ID
               ORDER BY _FIVETRAN_SYNCED DESC) ___R
      FROM "DOUBLE_CLICK_CAMPAIGN_MANAGER"."GENERAL_METRICS_MAIN_ACCOUNT"
     ) DT
where DT.___R = 1;



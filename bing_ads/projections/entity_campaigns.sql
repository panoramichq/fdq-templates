CREATE OR REPLACE VIEW "BING_ADS_VIEWS"."ENTITY_CAMPAIGNS" AS
SELECT 
       DT.ID,
       MODIFIED_TIME,
       BUDGET,
       PRIORITY,
       LANGUAGE,
       STATUS,
       WEBSITE,
       ACCOUNT_ID,
       BUDGET_ID,
       NAME,
       TYPE,
       BID_ADJUSTMENT,
       BID_STRATEGY_MAX_CPC,
       BID_STRATEGY_TARGET_CPA,
       BID_STRATEGY_TYPE,
       COUNTRY_CODE,
       DOMAIN_LANGUAGE,
       LOCAL_INVENTORY_ADS_ENABLED,
       STORE_ID,
       SUB_TYPE,
       TIME_ZONE,
       TRACKING_TEMPLATE
FROM (
         SELECT CH.*,
                ROW_NUMBER() OVER (
                    Partition By CH.ID
                    ORDER BY
                        MODIFIED_TIME DESC
                    )        ___R
         FROM "BING_ADS"."CAMPAIGN_HISTORY" CH
     ) DT
WHERE DT.___R = 1;

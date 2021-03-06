CREATE OR REPLACE VIEW "BING_ADS_VIEWS"."USER_LOCATION_PERFORMANCE_DAILY_REPORT" AS
SELECT
  DT.ACCOUNT_ID,
  DT.ACCOUNT_NAME,
  DT.AD_DISTRIBUTION,
  DT.AD_GROUP_ID,
  DT.ASSISTS,
  DT.AVERAGE_CPC,
  DT.AVERAGE_POSITION,
  DT.BID_MATCH_TYPE,
  DT.CAMPAIGN_ID,
  DT.CITY,
  DT.CLICKS,
  DT.CONVERSIONS,
  DT.CONVERSION_RATE,
  DT.COST_PER_ASSIST,
  DT.COST_PER_CONVERSION,
  DT.COUNTRY,
  DT.COUNTY,
  DT.CTR,
  DT.CURRENCY_CODE,
  DT.DATE,
  DT.DELIVERED_MATCH_TYPE,
  DT.DEVICE_OS,
  DT.DEVICE_TYPE,
  DT.IMPRESSIONS,
  DT.LANGUAGE,
  DT.LOCATION_ID,
  DT.METRO_AREA,
  DT.NETWORK,
  DT.POSTAL_CODE,
  DT.QUERY_INTENT_CITY,
  DT.QUERY_INTENT_COUNTRY,
  DT.QUERY_INTENT_COUNTY,
  DT.QUERY_INTENT_DMA,
  DT.QUERY_INTENT_LOCATION_ID,
  DT.QUERY_INTENT_POSTAL_CODE,
  DT.QUERY_INTENT_STATE,
  DT.RADIUS,
  DT.RETURN_ON_AD_SPEND,
  DT.REVENUE,
  DT.REVENUE_PER_ASSIST,
  DT.REVENUE_PER_CONVERSION,
  DT.SPEND,
  DT.STATE,
  DT.TOP_VS_OTHER
FROM
  "BING_ADS"."USER_LOCATION_PERFORMANCE_DAILY_REPORT" DT
;

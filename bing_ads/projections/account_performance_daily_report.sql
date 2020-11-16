CREATE OR REPLACE VIEW "BING_ADS_VIEWS"."ACCOUNT_PERFORMANCE_DAILY_REPORT" AS
SELECT
  DT.ACCOUNT_ID::VARCHAR        AS ACCOUNT_ID,
  DT.AD_DISTRIBUTION,
  DT.ASSISTS,
  DT.AVERAGE_CPC,
  DT.AVERAGE_POSITION,
  DT.BID_MATCH_TYPE,
  DT.CLICKS,
  DT.CLICK_CALLS,
  DT.CONVERSIONS,
  DT.CONVERSION_RATE,
  DT.COST_PER_ASSIST,
  DT.COST_PER_CONVERSION,
  DT.CTR,
  DT.CURRENCY_CODE,
  DT.DATE,
  DT.DELIVERED_MATCH_TYPE,
  DT.DEVICE_OS,
  DT.DEVICE_TYPE,
  DT.IMPRESSIONS,
  DT.LOW_QUALITY_CLICKS,
  DT.LOW_QUALITY_CLICKS_PERCENT,
  DT.LOW_QUALITY_CONVERSIONS,
  DT.LOW_QUALITY_CONVERSION_RATE,
  DT.LOW_QUALITY_GENERAL_CLICKS,
  DT.LOW_QUALITY_IMPRESSIONS,
  DT.LOW_QUALITY_IMPRESSIONS_PERCENT,
  DT.LOW_QUALITY_SOPHISTICATED_CLICKS,
  DT.MANUAL_CALLS,
  DT.NETWORK,
  DT.PHONE_CALLS,
  DT.PHONE_IMPRESSIONS,
  DT.RETURN_ON_AD_SPEND,
  DT.REVENUE,
  DT.REVENUE_PER_ASSIST,
  DT.REVENUE_PER_CONVERSION,
  DT.SPEND,
  DT.TOP_VS_OTHER
FROM
  "BING_ADS"."ACCOUNT_PERFORMANCE_DAILY_REPORT" DT
;

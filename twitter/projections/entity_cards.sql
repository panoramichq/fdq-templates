CREATE OR REPLACE VIEW "TWITTER_ADS_VIEWS"."ENTITY_CARDS" AS

SELECT 

	ID::VARCHAR(256)                              AS CARD_ID
	, UPDATED_AT::TIMESTAMP_TZ(9)                   AS UPDATED_AT
	, ACCOUNT_ID::VARCHAR(256)                      AS ACCOUNT_ID
	, NAME::VARCHAR(256)                            AS CARD_NAME
	, GOOGLEPLAY_APP_ID::VARCHAR(256)               AS GOOGLEPLAY_APP_ID
	, IMAGE_DISPLAY_HEIGHT::VARCHAR(256)            AS IMAGE_DISPLAY_HEIGHT
	, IMAGE_DISPLAY_WIDTH::VARCHAR(256)             AS IMAGE_DISPLAY_WIDTH
	, COUNTRY_CODE::VARCHAR(256)                    AS COUNTRY_CODE
	, MEDIA_URL::VARCHAR(256)                       AS MEDIA_URL
	, MEDIA_KEY::VARCHAR(256)                       AS MEDIA_KEY
	, CREATED_AT::TIMESTAMP_TZ(9)                   AS CREATED_AT
	, CARD_URI::VARCHAR(256)                        AS CARD_URI
	, APP_CTA::VARCHAR(256)                         AS APP_CTA
	, DELETED::BOOLEAN                              AS DELETED
	, CARD_TYPE::VARCHAR(256)                       AS CARD_TYPE
	, FIRST_CTA::VARCHAR(256)                       AS FIRST_CTA
	, FIRST_CTA_WELCOME_MESSAGE_ID::VARCHAR(256)    AS FIRST_CTA_WELCOME_MESSAGE_ID
	, RECIPIENT_USER_ID::VARCHAR(256)               AS RECIPIENT_USER_ID
	, THANK_YOU_TEXT::VARCHAR(256)                  AS THANK_YOU_TEXT
	, FIRST_CTA_TWEET::VARCHAR(256)                 AS FIRST_CTA_TWEET
	, TITLE::VARCHAR(256)                           AS TITLE
	, WEBSITE_SHORTENED_URL::VARCHAR(256)           AS WEBSITE_SHORTENED_URL
	, WEBSITE_DISPLAY_URL::VARCHAR(256)             AS WEBSITE_DISPLAY_URL
	, WEBSITE_DEST_URL::VARCHAR(256)                AS WEBSITE_DEST_URL
	, WEBSITE_TITLE::VARCHAR(256)                   AS WEBSITE_TITLE
	, WEBSITE_URL::VARCHAR(256)                     AS WEBSITE_URL
	, VIDEO_POSTER_HEIGHT::VARCHAR(256)             AS VIDEO_POSTER_HEIGHT
	, VIDEO_HEIGHT::VARCHAR(256)                    AS VIDEO_HEIGHT
	, VIDEO_URL::VARCHAR(256)                       AS VIDEO_URL
	, CONTENT_DURATION_SECONDS::NUMBER(38,0)        AS CONTENT_DURATION_SECONDS
	, VIDEO_OWNER_ID::VARCHAR(256)                  AS VIDEO_OWNER_ID
	, VIDEO_WIDTH::VARCHAR(256)                     AS VIDEO_WIDTH
	, VIDEO_HLS_URL::VARCHAR(256)                   AS VIDEO_HLS_URL
	, VIDEO_POSTER_URL::VARCHAR(256)                AS VIDEO_POSTER_URL
	, POSTER_MEDIA_URL::VARCHAR(256)                AS POSTER_MEDIA_URL
	, VIDEO_POSTER_WIDTH::VARCHAR(256)              AS VIDEO_POSTER_WIDTH
	, START_TIME::TIMESTAMP_TZ(9)                   AS START_TIME
	, FIRST_CHOICE::VARCHAR(256)                    AS FIRST_CHOICE
	, SECOND_CHOICE::VARCHAR(256)                   AS SECOND_CHOICE
	, END_TIME::TIMESTAMP_TZ(9)                     AS END_TIME
	, DURATION_IN_MINUTES::NUMBER(38,0)             AS DURATION_IN_MINUTES
	, _FIVETRAN_SYNCED::TIMESTAMP_TZ(9)             AS _FIVETRAN_SYNCED

FROM (

  SELECT *
    , ROW_NUMBER() OVER (PARTITION BY ID, ACCOUNT_ID ORDER BY _FIVETRAN_SYNCED DESC) ___R
  FROM "TWITTER_ADS"."CARD_HISTORY"

) DT
WHERE DT.___R = 1
;

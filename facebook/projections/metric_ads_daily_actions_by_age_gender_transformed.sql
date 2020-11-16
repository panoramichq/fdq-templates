CREATE OR REPLACE VIEW "FACEBOOK_VIEWS"."METRIC_ADS_DAILY_ACTIONS_BY_AGE_GENDER_TRANSFORMED" AS

SELECT
    DATE::DATE              AS DATE
    , AD_ID::VARCHAR        AS AD_ID
    , AGE::VARCHAR          AS AGE
    , GENDER::VARCHAR       AS GENDER

    , VIDEO_VIEW
    , "LIKE"
    , "COMMENT"
    , POST
    , POST_ENGAGEMENT
    , POST_REACTION
    , INTERACTIVE_COMPONENT_TAP
    , LINK_CLICK
    , LANDING_PAGE_VIEW
    , VIEW_CONTENT
    , PAGE_ENGAGEMENT
    , PHOTO_VIEW
    , SEARCH
    , COMPLETE_REGISTRATION
    , MOBILE_APP_INSTALL
    , ADD_PAYMENT_INFO
    , ADD_TO_WISHLIST
    , ADD_TO_CART
    , INITIATE_CHECKOUT
    , PURCHASE

    , ONSITE_CONVERSION__MESSAGING_BLOCK
    , ONSITE_CONVERSION__MESSAGING_FIRST_REPLY
    , ONSITE_CONVERSION__POST_SAVE
    , ONSITE_CONVERSION__VIEW_CONTENT

    , OFFSITE_CONVERSION__FB_PIXEL_VIEW_CONTENT
    , OFFSITE_CONVERSION__FB_PIXEL_SEARCH
    , OFFSITE_CONVERSION__FB_PIXEL_COMPLETE_REGISTRATION
    , OFFSITE_CONVERSION__FB_PIXEL_ADD_PAYMENT_INFO
    , OFFSITE_CONVERSION__FB_PIXEL_ADD_TO_WISHLIST
    , OFFSITE_CONVERSION__FB_PIXEL_ADD_TO_CART
    , OFFSITE_CONVERSION__FB_PIXEL_INITIATE_CHECKOUT
    , OFFSITE_CONVERSION__FB_PIXEL_PURCHASE

    , APP_CUSTOM_EVENT__FB_MOBILE_ACTIVATE_APP
    , APP_CUSTOM_EVENT__FB_MOBILE_COMPLETE_REGISTRATION
    , APP_CUSTOM_EVENT__FB_MOBILE_ADD_TO_CART
    , APP_CUSTOM_EVENT__FB_MOBILE_INITIATED_CHECKOUT
    , APP_CUSTOM_EVENT__FB_MOBILE_PURCHASE

    , OMNI_VIEW_CONTENT
    , OMNI_SEARCH
    , OMNI_APP_INSTALL
    , OMNI_ACTIVATE_APP
    , OMNI_COMPLETE_REGISTRATION
    , OMNI_ADD_TO_CART
    , OMNI_INITIATED_CHECKOUT
    , OMNI_PURCHASE

FROM (
  SELECT
      DATE,
      AD_ID,
      AGE,
      GENDER,
      ACTION_TYPE,
      VALUE
  FROM "FACEBOOK"."AGE_GENDER_ACTIONS"
) AS ACTIONS PIVOT(SUM(VALUE) FOR ACTION_TYPE IN(

                                            'video_view'
                                          , 'like'
                                          , 'comment'
                                          , 'post'
                                          , 'post_engagement'
                                          , 'post_reaction'
                                          , 'interactive_component_tap'
                                          , 'link_click'
                                          , 'landing_page_view'
                                          , 'view_content'
                                          , 'page_engagement'
                                          , 'photo_view'
                                          , 'search'
                                          , 'complete_registration'
                                          , 'mobile_app_install'
                                          , 'add_payment_info'
                                          , 'add_to_wishlist'
                                          , 'add_to_cart'
                                          , 'initiate_checkout'
                                          , 'purchase'

                                          , 'onsite_conversion.messaging_block'
                                          , 'onsite_conversion.messaging_first_reply'
                                          , 'onsite_conversion.post_save'
                                          , 'onsite_conversion.view_content'

                                          , 'offsite_conversion.fb_pixel_view_content'
                                          , 'offsite_conversion.fb_pixel_search'
                                          , 'offsite_conversion.fb_pixel_complete_registration'
                                          , 'offsite_conversion.fb_pixel_add_payment_info'
                                          , 'offsite_conversion.fb_pixel_add_to_wishlist'
                                          , 'offsite_conversion.fb_pixel_add_to_cart'
                                          , 'offsite_conversion.fb_pixel_initiate_checkout'
                                          , 'offsite_conversion.fb_pixel_purchase'

                                          , 'app_custom_event.fb_mobile_activate_app'
                                          , 'app_custom_event.fb_mobile_complete_registration'
                                          , 'app_custom_event.fb_mobile_add_to_cart'
                                          , 'app_custom_event.fb_mobile_initiated_checkout'
                                          , 'app_custom_event.fb_mobile_purchase'

                                          , 'omni_view_content'
                                          , 'omni_search'
                                          , 'omni_app_install'
                                          , 'omni_activate_app'
                                          , 'omni_complete_registration'
                                          , 'omni_add_to_cart'
                                          , 'omni_initiated_checkout'
                                          , 'omni_purchase'
                    )
                  ) AS P (
                    DATE
                  , AD_ID
                  , AGE
                  , GENDER
                  , VIDEO_VIEW
                  , "LIKE"
                  , "COMMENT"
                  , POST
                  , POST_ENGAGEMENT
                  , POST_REACTION
                  , INTERACTIVE_COMPONENT_TAP
                  , LINK_CLICK
                  , LANDING_PAGE_VIEW
                  , VIEW_CONTENT
                  , PAGE_ENGAGEMENT
                  , PHOTO_VIEW
                  , SEARCH
                  , COMPLETE_REGISTRATION
                  , MOBILE_APP_INSTALL
                  , ADD_PAYMENT_INFO
                  , ADD_TO_WISHLIST
                  , ADD_TO_CART
                  , INITIATE_CHECKOUT
                  , PURCHASE

                  , ONSITE_CONVERSION__MESSAGING_BLOCK
                  , ONSITE_CONVERSION__MESSAGING_FIRST_REPLY
                  , ONSITE_CONVERSION__POST_SAVE
                  , ONSITE_CONVERSION__VIEW_CONTENT

                  , OFFSITE_CONVERSION__FB_PIXEL_VIEW_CONTENT
                  , OFFSITE_CONVERSION__FB_PIXEL_SEARCH
                  , OFFSITE_CONVERSION__FB_PIXEL_COMPLETE_REGISTRATION
                  , OFFSITE_CONVERSION__FB_PIXEL_ADD_PAYMENT_INFO
                  , OFFSITE_CONVERSION__FB_PIXEL_ADD_TO_WISHLIST
                  , OFFSITE_CONVERSION__FB_PIXEL_ADD_TO_CART
                  , OFFSITE_CONVERSION__FB_PIXEL_INITIATE_CHECKOUT
                  , OFFSITE_CONVERSION__FB_PIXEL_PURCHASE

                  , APP_CUSTOM_EVENT__FB_MOBILE_ACTIVATE_APP
                  , APP_CUSTOM_EVENT__FB_MOBILE_COMPLETE_REGISTRATION
                  , APP_CUSTOM_EVENT__FB_MOBILE_ADD_TO_CART
                  , APP_CUSTOM_EVENT__FB_MOBILE_INITIATED_CHECKOUT
                  , APP_CUSTOM_EVENT__FB_MOBILE_PURCHASE

                  , OMNI_VIEW_CONTENT
                  , OMNI_SEARCH
                  , OMNI_APP_INSTALL
                  , OMNI_ACTIVATE_APP
                  , OMNI_COMPLETE_REGISTRATION
                  , OMNI_ADD_TO_CART
                  , OMNI_INITIATED_CHECKOUT
                  , OMNI_PURCHASE
                                                  
)
;
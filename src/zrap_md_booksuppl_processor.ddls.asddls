@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection for booking supplement'
@Metadata.ignorePropagatedAnnotations: false
@VDM.viewType: #CONSUMPTION
define view entity ZRAP_MD_BOOKSUPPL_PROCESSOR as projection on ZRAP_MD_BOOKING_SUPPL
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    SupplementId,
    Price,
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _Booking : redirected to parent ZRAP_MD_BOOKING_PROCESSOR,
    _Supplement,
    _SupplText,
    _Travel
}

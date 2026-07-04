@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection for root trael entity'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #CONSUMPTION
@Metadata.allowExtensions: true
define root view entity ZRAP_MD_TRAVEL_PROCESSOR as projection on ZRAP_MD_TRAVEL_ROOT
{
    key TravelId,
    AgencyId,
    CustomerId,
    BeginDate,
    EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee,
     @Semantics.amount.currencyCode: 'CurrencyCode'
    TotalPrice,
    CurrencyCode,
    Description,
    OverallStatus,
    CreatedBy,
    CreatedAt,
    LastChangedBy,
    LastChangedAt,
    /* Associations */
    _Agency,
    _Booking : redirected to composition child ZRAP_MD_BOOKING_PROCESSOR,
    _Currency,
    _Customer,
    _OverallStatus
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplements child entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZRAP_MD_BOOKING_SUPPL as select from /dmo/booksuppl_m
association to parent ZRAP_MD_TRAVEL_BOOKING as _Booking
    on $projection.TravelId = _Booking.TravelId and
    $projection.BookingId = _Booking.BookingId
    association of one to one ZRAP_MD_TRAVEL_ROOT as _Travel
    on $projection.TravelId = _Travel.TravelId
    association of one to one /DMO/I_Supplement as _Supplement
    on $projection.SupplementId = _Supplement.SupplementID
    association of one to many /DMO/I_SupplementText as _SupplText
    on $projection.SupplementId = _SupplText.SupplementID
    
{
    
    key /dmo/booksuppl_m.travel_id as TravelId,
    key /dmo/booksuppl_m.booking_id as BookingId,
    key /dmo/booksuppl_m.booking_supplement_id as BookingSupplementId,
    /dmo/booksuppl_m.supplement_id as SupplementId,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    /dmo/booksuppl_m.price as Price,
    /dmo/booksuppl_m.currency_code as CurrencyCode,
    @Semantics.systemDateTime.lastChangedAt: true
    /dmo/booksuppl_m.last_changed_at as LastChangedAt,
    _Booking,
    _Travel,
    _Supplement,
    _SupplText
}

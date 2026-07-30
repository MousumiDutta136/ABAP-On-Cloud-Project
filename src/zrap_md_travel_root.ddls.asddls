@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root CDS entity for travel request'
@Metadata.ignorePropagatedAnnotations: false
@VDM.viewType: #COMPOSITE
@Metadata.allowExtensions: true
define root view entity ZRAP_MD_TRAVEL_ROOT as select from /dmo/travel_m
composition [0..*] of ZRAP_MD_TRAVEL_BOOKING as _Booking
association of one to one /DMO/I_Agency as _Agency
on $projection.AgencyId = _Agency.AgencyID
association of one to one /DMO/I_Customer as _Customer
on $projection.CustomerId = _Customer.CustomerID
association of one to one I_Currency as _Currency
on $projection.CurrencyCode = _Currency.Currency  
association of one to one /DMO/I_Overall_Status_VH as _OverallStatus
on $projection.OverallStatus = _OverallStatus.OverallStatus
{
    @ObjectModel.text.element: [ 'Description' ]
    key travel_id as TravelId,
    @ObjectModel.text.element: [ 'AgencyName' ]
    @Consumption.valueHelpDefinition: [{ 
    entity: {
    name: '/DMO/I_Agency',
    element: 'AgencyID'
    }    
     }]
    agency_id as AgencyId,
    _Agency.Name as AgencyName,
    @ObjectModel.text.element: [ 'CustomerName' ]
    @Consumption.valueHelpDefinition: [{ 
    entity: {
    name: '/DMO/I_Customer',
    element: 'CustomerID'
    }    
     }]
    customer_id as CustomerId,
    concat_with_space(_Customer.FirstName, _Customer.LastName, 1) as CustomerName,
    begin_date as BeginDate,
    end_date as EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    booking_fee as BookingFee,
     @Semantics.amount.currencyCode: 'CurrencyCode'
    total_price as TotalPrice,
    currency_code as CurrencyCode,
    description as Description,
     @ObjectModel.text.element: [ 'StatusText' ]
     @Consumption.valueHelpDefinition: [{ 
    entity: {
    name: '/DMO/I_Overall_Status_VH',
    element: 'CustomerID'
    }    
     }]
    overall_status as OverallStatus,
    case overall_status
     when 'O' then 2
     when 'A' then 3
     when 'R' then 1
     else 1    
    end as Minion,
    _OverallStatus._Text[Language=$session.system_language].Text as StatusText,
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
    @Semantics.user.lastChangedBy: true
    last_changed_by as LastChangedBy,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at as LastChangedAt,
    _Booking,
    _Agency,
    _Customer,
    _Currency,
    _OverallStatus   
    
}

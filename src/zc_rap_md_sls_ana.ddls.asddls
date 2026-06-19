@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Analytic Query for Sales for Fiori'
@Metadata.ignorePropagatedAnnotations: false
@VDM.viewType: #CONSUMPTION
@Analytics.query: true
define view entity ZC_RAP_MD_SLS_ANA as select from ZCO_RAP_MD_SLS_CUBE
{
    key ProductName,
    @Consumption.filter.selectionType: #SINGLE
    key ProductCategory,
    @AnalyticsDetails.query.axis: #ROWS
    key CompanyName,
    ConvertCurrency,
    ConvertedAmount,
    Qty,
    Uom
}

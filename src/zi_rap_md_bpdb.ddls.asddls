@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic Interface for Business partner'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #BASIC
@Analytics.dataCategory: #DIMENSION
define view entity ZI_RAP_MD_BPDB as select from zrap_md_bpdb   
{
    key bp_id as BusinessPartnerId,
    bp_role as BpRole,
    company_name as CompanyName,
    country as Country
    
}

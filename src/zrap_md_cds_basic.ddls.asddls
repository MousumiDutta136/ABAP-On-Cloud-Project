@AbapCatalog.sqlViewName: 'ZRAPMDCDSBASIC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basics of CDS view'
@Metadata.ignorePropagatedAnnotations: true
define view ZRAP_MD_CDS_BASIC as select from zrap_md_bpdb
{
    
    key bp_id as BpId,
    bp_role as BpRole,
    company_name as CompanyName,
    street as Street,
    country as Country,
    region as Region,
    city as City
}

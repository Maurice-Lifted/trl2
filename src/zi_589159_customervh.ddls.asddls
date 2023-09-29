@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Value Help'
define view entity ZI_589159_CustomerVH as select from ZI_589159_Customer
{
    key CustomerId,
    FirstName,
    LastName,
    Title,
    Street,
    PostalCode,
    City,
    CountryCode
}

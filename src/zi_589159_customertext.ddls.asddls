@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Textelemente'
define view entity ZI_589159_CustomerText
  as select from ZI_589159_Customer
{
  key CustomerId,
      concat_with_space(FirstName, LastName, 1) as CustomerName
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
@Metadata.allowExtensions: true
define view entity ZC_589159_Booking
  as projection on ZR_589159_Booking
{
  key BookingUuid,
      TravelUuid,
      BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      FlightPrice,
      CurrencyCode,
      
      /* Associations */
      _Travel : redirected to parent ZC_589159_Travel
}

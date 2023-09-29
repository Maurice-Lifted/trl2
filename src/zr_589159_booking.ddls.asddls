@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
define view entity ZR_589159_Booking
  as select from z589159_abooking
  association to parent ZR_589159_Travel as _Travel on $projection.TravelUuid = _Travel.TravelUuid
{
      @EndUserText: { label: 'BookingUUID', quickInfo: 'Booking UUID' }
  key booking_uuid  as BookingUuid,
      @EndUserText: { label: 'Travel UUID', quickInfo: 'Travel UUID' }
      travel_uuid   as TravelUuid,
      booking_id    as BookingId,
      booking_date  as BookingDate,
      customer_id   as CustomerId,
      carrier_id    as CarrierId,
      connection_id as ConnectionId,
      flight_date   as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price  as FlightPrice,
      currency_code as CurrencyCode,
      
      /* Associations */
      _Travel
}

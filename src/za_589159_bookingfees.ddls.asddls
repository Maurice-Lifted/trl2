@EndUserText.label: 'Booking Fees'
define abstract entity ZA_589159_BookingFees
{
    @Semantics.amount.currencyCode: 'CurrencyCode'
    BookingFee : /dmo/booking_fee;
    currencyCode : /dmo/currency_code;
    
}

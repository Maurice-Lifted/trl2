CLASS lhc_ZR_589159_Travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ZR_589159_Travel RESULT result.
    METHODS show_test_message FOR MODIFY
      IMPORTING keys FOR ACTION travel~show_test_message.
    METHODS cancel_booking FOR MODIFY
      IMPORTING keys FOR ACTION travel~cancel_booking.
    METHODS maintain_booking_fees FOR MODIFY
      IMPORTING keys FOR ACTION travel~maintain_booking_fees.

ENDCLASS.

CLASS lhc_ZR_589159_Travel IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD show_test_message.

    DATA(message) = NEW zcm_589159_travel(
      i_textid    = zcm_589159_travel=>zcm_589159_travel
      i_severity  = if_abap_behv_message=>severity-success
      i_user_name = sy-uname ).
    APPEND message TO reported-%other.

  ENDMETHOD.

  METHOD cancel_booking.

    "Ausgewählte Daten(Reise) lesen
    READ ENTITY IN LOCAL MODE ZR_589159_Travel
        FIELDS ( TravelUUID Description Status )
        WITH CORRESPONDING #( keys )
        RESULT DATA(travels).
    "Select FROM Z589159_atravel
    "FIELDS TravelUUID, Status
    "WHERE TravelUUID in keys
    "INTO TABLE @DATA(travels.)

    "Über die Daten (Reisen) sequentiell verarbeiten
    LOOP AT travels REFERENCE INTO DATA(travel).

      "Validierung
      IF travel->Status = 'X'.
        DATA(message) = NEW zcm_589159_travel(
          i_textid    = zcm_589159_travel=>travel_already_cancelled
          i_severity  = if_abap_behv_message=>severity-error
          i_travel    = travel->Description ).
        APPEND VALUE #( %tky = travel->%tky %msg = message ) TO reported-travel.
        APPEND VALUE #( %tky = travel->%tky ) TO failed-travel.
        CONTINUE.
      ENDIF.

      "Daten (Reisen) ändern und ggfs. Nachrichten erzeugen
      travel->Status = 'X'.
      message = NEW zcm_589159_travel(
        i_textid    = zcm_589159_travel=>travel_successfully_cancelled
        i_severity  = if_abap_behv_message=>severity-success
        i_travel    = travel->Description ).
      APPEND VALUE #( %tky = travel->%tky %msg = message ) TO reported-travel.          CONTINUE.

      "Daten (Reisen) zurückschreiben
      MODIFY ENTITY IN LOCAL MODE ZR_589159_Travel
        UPDATE FIELDS ( Status )
        WITH VALUE #( ( %tky = travel->%tky Status = travel->Status ) ).

    ENDLOOP.

  ENDMETHOD.

  METHOD maintain_booking_fees.

    READ ENTITY IN LOCAL MODE ZR_589159_Travel
        FIELDS ( TravelUUID )
        WITH CORRESPONDING #( keys )
        RESULT DATA(travels).

    LOOP AT travels REFERENCE INTO DATA(travel).

      travel->BookingFee = keys[ sy-tabix ]-%param-BookingFee.
      travel->CurrencyCode = keys[ sy-tabix ]-%param-CurrencyCode.

      MODIFY ENTITY IN LOCAL MODE ZR_589159_Travel
          UPDATE FIELDS ( BookingFee CurrencyCode )
          WITH VALUE #( ( %tky = travel->%tky
                          BookingFee = travel->BookingFee
                          CurrencyCode = travel->CurrencyCode ) ).

    ENDLOOP.

    ENDMETHOD.

ENDCLASS.

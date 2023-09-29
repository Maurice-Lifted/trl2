CLASS zcm_589159_travel DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_abap_behv_message .
    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    CONSTANTS:
      BEGIN OF zcm_589159_travel,
        msgid TYPE symsgid VALUE 'Z589159 Travel',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'USER NAME',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF zcm_589159_travel.

    CONSTANTS:
      BEGIN OF travel_successfully_cancelled,
        msgid TYPE symsgid VALUE 'Z589159 Travel',
        msgno TYPE symsgno VALUE '002',
        attr1 TYPE scx_attrname VALUE 'USER NAME',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF travel_successfully_cancelled.

    CONSTANTS:
      BEGIN OF travel_already_cancelled,
        msgid TYPE symsgid VALUE 'Z589159 Travel',
        msgno TYPE symsgno VALUE '003',
        attr1 TYPE scx_attrname VALUE 'Travel',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF travel_already_cancelled.

    TYPES ty_user_name TYPE c LENGTH 12.

    METHODS constructor
      IMPORTING
        i_textid    LIKE if_t100_message=>t100key
        i_previous  LIKE previous OPTIONAL
        i_severity  TYPE if_abap_behv_message=>t_severity
        I_user_name TYPE ty_user_name OPTIONAL
        i_travel TYPE /dmo/description OPTIONAL.

    DATA user_name TYPE ty_user_name.
    DATA travel TYPE /dmo/description.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcm_589159_travel IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = i_previous ).

    if_t100_message~t100key = i_textid.
    if_abap_behv_message~m_severity = i_severity.
    user_name = i_user_name.
    travel = i_travel.

  ENDMETHOD.

ENDCLASS.

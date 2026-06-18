CLASS zcl_rap_md_first_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rap_md_first_class IMPLEMENTATION.
METHOD if_oo_adt_classrun~main.


    select * from I_Country into table @data(itab).
    out->write(
      EXPORTING
        data   = itab
*        name   =
*      RECEIVING
*        output =
    ).


  ENDMETHOD.

ENDCLASS.

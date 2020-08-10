*** 
*** ReFox X  #UK933629  MANRIQUE ORELLANA  MANSOFT SYSTEMS [VFP80]
***
LOCAL lnwinhandle
DECLARE INTEGER FindWindow IN  ;
        Win32API INTEGER, STRING
lnwinhandle = findwindow(0,  ;
              'SISTEMA GESTION COMERCIAL' +  ;
              " " + tentacion)
IF lnwinhandle <> 0
     = MESSAGEBOX( ;
       "El sistema ya se esta ejecutando!",  ;
       16)
     QUIT
ENDIF
ENDPROC
**
*** 
*** ReFox - retrace your steps ... 
***

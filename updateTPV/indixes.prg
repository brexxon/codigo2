*** 
*** ReFox X  #UK933629  MANRIQUE ORELLANA  MANSOFT SYSTEMS [VFP80]
***
SET SAFETY OFF
LOCAL sy
sy = MESSAGEBOX( ;
     "No debe estar el programa abierto en ninguna pc",  ;
     052, "CONTINUAR")
IF sy = 6
     CLOSE DATABASES
     OPEN DATABASE datos  ;
          EXCLUSIVE
     VALIDATE DATABASE
     MODIFY WINDOW screen TITLE  ;
            '"FERRETERIA ROMAN"'
     SET RESOURCE OFF
     SET COLLATE TO 'SPANISH'
     SET DATE TO DMY
     RELEASE WINDOW 'estándar'
     SET SYSMENU TO
     _SCREEN.windowstate = 2
     _SCREEN.closable = .F.
     _SCREEN.backcolor = RGB(80,  ;
                         80,  ;
                         128)
     @ 10, 15 SAY  ;
       "POR FAVOR ESPERE... REORGANIZANDO ARCHIVOS"  ;
       FONT "ARIAL", 16
     @ 15, 15 SAY  ;
       "ASEGURESE DE QUE NINGUNA PC ESTE CON EL PROGRAMA ABIERTO MIENTRAS DURA ESTE PROCESO"  ;
       FONT "ARIAL", 10
     DO rata
     READ EVENTS
ENDIF
ENDPROC
**
*** 
*** ReFox - retrace your steps ... 
***

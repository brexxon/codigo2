*** 
*** ReFox X  #UK933629  MANRIQUE ORELLANA  MANSOFT SYSTEMS [VFP80]
***
PARAMETER xpass
wpass = xpass
PUBLIC warray, mtablas[30],  ;
       otaller[30], consult[30],  ;
       reporte[30], otr[30]
i = 1
FOR i = 1 TO 30
     mtablas[i] = .T.
     otaller[i] = .T.
     consult[i] = .T.
     reporte[i] = .T.
     otr[i] = .T.
ENDFOR
USE SHARED accesos.dbf
SET ORDER TO UseryNivel
SEEK wpass 
DO WHILE usuario=wpass
     DO CASE
          CASE SUBSTR(nivel, 1,  ;
               1) = "1"
               warray = "mtablas"
               DO enabledisableoptions
          CASE SUBSTR(nivel, 1,  ;
               1) = "2"
               warray = "otaller"
               DO enabledisableoptions
          CASE SUBSTR(nivel, 1,  ;
               1) = "3"
               warray = "consult"
               DO enabledisableoptions
          CASE SUBSTR(nivel, 1,  ;
               1) = "4"
               warray = "reporte"
               DO enabledisableoptions
          CASE SUBSTR(nivel, 1,  ;
               1) = "5"
               warray = "otr"
               DO enabledisableoptions
     ENDCASE
ENDDO
USE
RETURN
ENDPROC
**
PROCEDURE EnableDisableOptions
i = 1
wnivel = SUBSTR(nivel, 1, 1)
DO WHILE SUBSTR(nivel, 1, 1)= ;
   wnivel
     &warray[i]=iif(habilitado=.t.,.f.,.t.)
     i = i + 1
     SKIP
ENDDO
RETURN
ENDPROC
**
*** 
*** ReFox - retrace your steps ... 
***

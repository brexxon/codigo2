*** 
*** ReFox X  #UK933629  MANRIQUE ORELLANA  MANSOFT SYSTEMS [VFP80]
***
SET PATH TO "WinRAR" ADDITIVE
gccomando = "winrar a -ep1 -m5  c:\tpvabaco\copia\" +  ;
            "multibackup" +  ;
            SUBSTR(TIME(), 7, 2) +  ;
            "   c:\tpvabaco\*"
oshell = CREATEOBJECT("WScript.Shell")
oshell.run(gccomando, 0, .T.)
ENDPROC
**
*** 
*** ReFox - retrace your steps ... 
***

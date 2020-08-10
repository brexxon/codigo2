*** 
*** ReFox X  #UK933629  MANRIQUE ORELLANA  MANSOFT SYSTEMS [VFP80]
***
**
PROCEDURE MesaErro
PARAMETER m.error, m.programa,  ;
          m.linea, m.mensaje
= MESSAGEBOX( ;
  'Error Detectado... ' + CHR(13) +  ;
  'Error # :' + STR(m.error, 5) +  ;
  CHR(13) + 'Programa:' +  ;
  m.programa + CHR(13) +  ;
  'Mensaje :' + m.mensaje, 48,  ;
  'TOME NOTA DEL ERROR Y AVISE AL ENCARGADO DEL LOCAL' ;
  )
USE SHARED errores
APPEND BLANK
REPLACE fecha WITH DATE(), hora  ;
        WITH TIME(), error WITH  ;
        m.error, programa WITH  ;
        m.programa, mensaje WITH  ;
        m.mensaje
SELECT errores
USE
QUIT
ENDPROC
**
*** 
*** ReFox - retrace your steps ... 
***

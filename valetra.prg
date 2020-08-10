*** 
*** ReFox X  #UK933629  MANRIQUE ORELLANA  MANSOFT SYSTEMS [VFP80]
***
PARAMETER numeros
numeros = to
PUBLIC letras
n = ''
n1 = 'UN/O'
n2 = 'DOS'
n3 = 'TRES'
n4 = 'CUATRO'
n5 = 'CINCO'
n6 = 'SEIS'
n7 = 'SIETE'
n8 = 'OCHO'
n9 = 'NUEVE'
n10 = 'DIEZ'
n11 = 'ONCE'
n12 = 'DOCE'
n13 = 'TRECE'
n14 = 'CATORCE'
n15 = 'QUINCE'
n16 = 'DIECISEIS'
n17 = 'DIECISIETE'
n18 = 'DIECIOCHO'
n19 = 'DIECINUEVE'
n20 = 'VEINTE'
n30 = 'TREINTA'
n40 = 'CUARENTA'
n50 = 'CINCUENTA'
n60 = 'SESENTA'
n70 = 'SETENTA'
n80 = 'OCHENTA'
n90 = 'NOVENTA'
n100 = 'CIEN'
n200 = 'DOSCIENTOS'
n300 = 'TRESCIENTOS'
n400 = 'CUATROCIENTOS'
n500 = 'QUINIENTOS'
n600 = 'SEISCIENTOS'
n700 = 'SETECIENTOS'
n800 = 'OCHOCIENTOS'
n900 = 'NOVECIENTOS'
pasada = 1
desde = 1
IF RIGHT(STR(numeros, 9, 2), 2) >=  ;
   '50'
     parcial = STR(numeros - 1,  ;
               9)
ELSE
     parcial = STR(numeros, 9)
ENDIF
to3 = STR(numeros, 9, 2)
letras = ''
DO WHILE pasada<4
     subcadena = SUBSTR(parcial,  ;
                 desde, 3)
     centena = SUBSTR(subcadena,  ;
               1, 1) + '00'
     decena = SUBSTR(subcadena, 2,  ;
              2)
     unidad = SUBSTR(subcadena, 3,  ;
              1)
     IF VAL(subcadena) > 99
          LETRAS=LETRAS+N&CENTENA+' ';

          IF VAL(decena) <> 0  ;
             .AND. VAL(centena) =  ;
             100
               letras = ALLTRIM(letras) +  ;
                        'TO '
          ENDIF
     ENDIF
     valdec = VAL(decena)
     IF valdec > 0
          DO CASE
               CASE (INT(valdec /  ;
                    10) = valdec /  ;
                    10) .OR.  ;
                    (valdec > 9  ;
                    .AND. valdec <  ;
                    20)
                    LETRAS=LETRAS+N&DECENA+' '
               CASE (INT(valdec /  ;
                    10) <> valdec /  ;
                    10) .AND.  ;
                    (valdec > 9)
                    decena = SUBSTR(decena,  ;
                             1,  ;
                             1) +  ;
                             '0'
                    IF decena <>  ;
                       '20'
                         IF unidad =  ;
                            '1'  ;
                            .AND.  ;
                            pasada =  ;
                            2
                              LETRAS=LETRAS+N&DECENA+' Y UN '
                         ELSE
                              LETRAS=LETRAS+N&DECENA+' Y '+N&UNIDAD+' '
                         ENDIF
                    ELSE
                         IF unidad =  ;
                            '1'  ;
                            .AND.  ;
                            pasada =  ;
                            2
                              letras =  ;
                               letras +  ;
                               'VEINTIUN '
                         ELSE
                              LETRAS=LETRAS+'VEINTI'+N&UNIDAD+' '
                         ENDIF
                    ENDIF
               CASE valdec < 10
                    IF unidad =  ;
                       '1' .AND.  ;
                       pasada =  ;
                       2
                         letras =  ;
                          letras +  ;
                          'UN '
                    ELSE
                         LETRAS=LETRAS+N&UNIDAD+' '
                    ENDIF
          ENDCASE
     ENDIF
     IF numeros > 999 .AND.  ;
        pasada = 2 .AND.  ;
        VAL(subcadena) > 0
          letras = letras +  ;
                   'MIL '
     ENDIF
     IF numeros > 999 .AND.  ;
        pasada = 2 .AND.  ;
        VAL(subcadena) > 0
          letras = letras + ''
     ENDIF
     desde = pasada * 3 + 1
     pasada = pasada + 1
     IF numeros > 999999 .AND.  ;
        pasada = 2 .AND.  ;
        VAL(subcadena) > 0
          letras = letras +  ;
                   'MILLON/es'
     ENDIF
ENDDO
IF RIGHT(to3, 2) <> '00'
     letras = letras + 'con ' +  ;
              RIGHT(to3, 2) +  ;
              '/100.-)'
ELSE
     letras = ALLTRIM(letras) +  ;
              '.-)'
ENDIF
? letras
RETURN letras
ENDFUNC
**
PROCEDURE wizerrorhandler
WAIT WINDOW MESSAGE()
RETURN
ENDPROC
**
*** 
*** ReFox - retrace your steps ... 
***

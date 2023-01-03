
PARAMETERS tcTexto,cFile
LOCAL plRet, pnFich, pnFichn, pnFtama, pnTammax, pnLongAc
LOCAL pcChar, pnPos
plRet    = .T.
pnLongAc = 0
pnTammax = 30000  && tamaño maximo
pnFtama = 0

IF FILE(SYS(5)+SYS(2003)+"\"+'&cFile')    && ¿Existe el archivo? 
 pnFich = FOPEN(SYS(5)+SYS(2003)+"\"+'&cFile',12) && Sí: abrir lect./escrit.
 pnFtama=FSEEK(pnFich, 0, 2)      && Mueve el puntero a EOF
             && y devuelve el tamaño
ELSE
 pnFich = FCREATE(SYS(5)+SYS(2003)+"\"+'&cFile') && Si no, crearlo
ENDIF
IF pnFich < 0          && Comprobar el error
             && abriendo el archivo
 plRet = .F.
 WAIT 'No puedo abrir o crear el archivo de salida (fich)' WINDOW NOWAIT
ELSE             && Si no hay error, 
             && escribir en el archivo
 IF pnFtama > pnTammax       && Si el tamaño es mayor que el max
  pnFichn = FCREATE(SYS(5)+SYS(2003)+"\"+"N"+'&cFile')  && Crear nuevo log
  IF pnFichn < 0
   WAIT 'No puedo abrir o crear el archivo de salida (fichn)' WINDOW NOWAIT
  ELSE
   pnPos = FSEEK(pnFich, -(pnTammax - 256), 1)
   pcChar = FREAD(pnFich, 1)
   DO WHILE pcChar <> CHR(10)
    pcChar = FREAD(pnFich, 1)
   ENDDO
   pnPos = FSEEK(pnFich, 0, 1)
   DO WHILE NOT(FEOF(pnFich))
    = FPUTS(pnFichn,FGETS(pnFich))
   ENDDO
   =FCLOSE(pnFich)
   =FCLOSE(pnFichn)
   DELETE FILE SYS(5)+SYS(2003)+"\"+'&cFile'
   RENAME SYS(5)+SYS(2003)+"\"+"N"+'&cFile' TO SYS(5)+SYS(2003)+"\"+'&cFile'
   pnFich = FOPEN(SYS(5)+SYS(2003)+"\"+'&cFile',12)
   pnFtama=FSEEK(pnFich, 0, 2)
  ENDIF
 ENDIF
 &&=FWRITE(pnFich, DTOC(DATE())+CHR(9))
 && =FWRITE(pnFich, TIME()+CHR(9))
 =FWRITE(pnFich, tcTexto+CHR(13)+CHR(10))
ENDIF
=FCLOSE(pnFich)          && Cerrar archivo

RETURN plRet


* EJECUTA UN COMANDO EXTERNO Y NO MUESTRA EL CUADRO NEGRO
FUNCTION rune
PARAMETER doscmd
DECLARE INTEGER WinExec IN win32api AS run STRING command, INTEGER param
DO CASE
   CASE file("c:\windows\system32\cmd.exe")
        cmdstart= "c:\windows\system32\cmd.exe /c"
   CASE file("d:\windows\system32\cmd.exe")
        cmdstart= "d:\windows\system32\cmd.exe /c"
   CASE file("e:\windows\system32\cmd.exe")
        cmdstart= "e:\windows\system32\cmd.exe /c"
ENDCASE
fullcmd = cmdstart + doscmd
retval = run(fullcmd,0)    && SI SE CAMBIA ESTE 0 POR UN 1 MUESTRA LA EJECUCIÓN
RETURN retval
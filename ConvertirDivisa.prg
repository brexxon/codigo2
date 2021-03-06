*!*	? ConvertirDivisa(1, "USD", "ARS") && D�lar EEUU a Peso Argentino
*!*	? ConvertirDivisa(1, "EUR", "ARS") && Euro a Peso Argentino
*!*	? ConvertirDivisa(1, "ARS", "USD") && Peso Argentino a D�lar EEUU

FUNCTION ConvertirDivisa(pnMonto, plFrom, plTo)
  LOCAL lc, lcUrl, la(1)
  DECLARE LONG URLDownloadToFile IN URLMON.DLL ;
    LONG, STRING, STRING, LONG, LONG
  ERASE "cambio.txt"
  lcURL = "https://www.google.com/finance/converter?a="+TRANSFORM(pnMonto)+"&from="+ plFROM +"&to=" + plTO
  IF 0 = URLDownloadToFile(0, lcURL, "cambio.txt", 0, 0)
    TRY
      INKEY(1)
      lc = FILETOSTR("cambio.txt")
      ALINES(la,lc,1,"<span class=bld>")
      lc=la(2)
      ALINES(la,lc,1,"</span>")
      lc = la(1)
    CATCH
      lc =  "Error de divisas"
    ENDTRY
  ELSE
    lc =  "No hay conexion"
  ENDIF
  RETURN lc
ENDFUNC
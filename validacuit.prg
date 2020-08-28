
LPARAMETERS tcCUIT

LOCAL lnSuma, llRet
  IF EMPTY(tcCuit)
    llRet = .T.
  ELSE
    IF TYPE('tcCuit') = 'C' AND LEN(tcCuit) = 13
      lnSuma = VAL(SUBS(tcCUIT,11,1)) * 2 + ;
        VAL(SUBS(tcCUIT,10,1)) * 3 + ;
        VAL(SUBS(tcCUIT,9,1)) * 4 + ;
        VAL(SUBS(tcCUIT,8,1)) * 5 + ;
        VAL(SUBS(tcCUIT,7,1)) * 6 + ;
        VAL(SUBS(tcCUIT,6,1)) * 7 + ;
        VAL(SUBS(tcCUIT,5,1)) * 2 + ;
        VAL(SUBS(tcCUIT,4,1)) * 3 + ;
        VAL(SUBS(tcCUIT,2,1)) * 4 + ;
        VAL(SUBS(tcCUIT,1,1)) * 5
      llRet = VAL(SUBS(tcCUIT,13,1)) = ;
        IIF(MOD(lnSuma,11) = 0, 0, 11-MOD(lnSuma,11))
    ELSE
    
      *WAIT WINDOW "EL CUIT No es Correcto"
      llRet = .F.
    ENDIF
  ENDIF
  RETURN llRet

		


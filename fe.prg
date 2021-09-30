PARAMETERS VARINU,nComanda
public cObserva
cObserva=""
cObserva=INPUTBOX("Observaciones", "Ingrese")
DECLARE INTEGER ShellExecute IN shell32.dll;
INTEGER hndWin, ;
STRING cAction,;
STRING cFileName,;
STRING cParams,;
STRING cDir,;
INTEGER nShowWin
local nRespuesta
WAIT WINDOW NOWA AT 25,35 "Pidiendo Autorizacion al Web Service AFIP........." 
IF ALLT(CONFIG.MODO_e)="0"
	nRespuesta=ShellExecute(0,"OPEN",Sys(5)+Sys(2003)+"\FE\"+"VAFIPFE1.EXE","-ARCH"+" " +allt(STR(VARINU))+".TXT"+" " +"-SALIDA"+" " +allt(STR(VARINU))+"SAL"+".TXT"+ " -MODO"+ " " + ALLT(CONFIG.MODO_E),Sys(5)+Sys(2003)+"\FE\",1)
	=INKEY(12)
ELSE
	*nRespuesta=ShellExecute(0,"OPEN",Sys(5)+Sys(2003)+"\FE\"+"VAFIPFE1.EXE","-ARCH"+" " +allt(STR(VARINU))+".TXT"+" " +"-SALIDA"+" " +allt(STR(VARINU))+"SAL"+".TXT"+ " -MODO"+ " " + ALLT(CONFIG.MODO_E)+ " " + "-CUIT" +" " +CONFIG.CUIT+ " " + "-CERT" + ALLT(CONFIG.CERTIFICADO_E) +" " + "-CLAV"+ " " + ALLT(CONFIG.CLAVE_E)+ " "+ "-LICE" + " " +ALLT(CONFIG.LICENCIA_E) ,Sys(5)+Sys(2003)+"\FE\",1)
	nRespuesta=ShellExecute(0,"OPEN",Sys(5)+Sys(2003)+"\FE\"+"VAFIPFE1.EXE","-ARCH"+" " +allt(STR(VARINU))+".TXT"+" " +"-SALIDA"+" " +allt(STR(VARINU))+"SAL"+".TXT"+ " -MODO"+ " " + ALLT(CONFIG.MODO_E)+ " " + "-CUIT" +" " +TRANSFORM(config.cuit,'99999999999')+ " " + "-CERT" +" " + ALLT(CONFIG.CERTIFICADO_E) +" " + "-CLAV"+ " " + ALLT(CONFIG.CLAVE_E)+ " "+ "-LICE" + " " +ALLT(CONFIG.LICENCIA_E) ,Sys(5)+Sys(2003)+"\FE\",1)
	=INKEY(12)

ENDIF

Create Cursor cRespuestaE(TEXTO C(20),TEXTO1 C(20),TEXTO2 C(20),TEXTO3 C(20),TEXTO4 C(20),TEXTO5 C(20),TEXTO6 C(20),TEXTO7 C(20),TEXTO8 C(100),TEXTO9 C(20))

IF nRespuesta>=32
    wait window  "Por favor espere......" NOWA 

	select cRespuestaE
	APPEND FROM Sys(5)+Sys(2003)+"\FE\"+allt(STR(VARINU))+"SAL"+".TXT" DELIMITED with character ";"
	select cRespuestaE
	GO top	
	
	IF !EMPTY(cRespuestaE.Texto5) AND !EMPTY(cRespuestaE.Texto8)
		WAIT WINDOW NOWA AT 25,27 "CAE OBTENIDO:" + ALLT(cRespuestaE.Texto8) TIMEO 3
		Select Fac_Cabe
		Append Blank
		Replace FECHA With Date(), ;
			cliente With Alltrim(VCLIETO), ;
			cuit With VKUY, ;
			tipofa With cTipoComprobante , ;
			diezt With DIEZ
		Replace ventit With VENTI , ;
			sint With SUB, ;
			tot With SIVA, ;
			cae_vence with DATE()+10
		
		Replace nro With Val(cRespuestaE.Texto5), ;
			prefijo With CONFIG.cajae, ;
			cae with allt(cRespuestaE.Texto8),nro_fact with varinu,electronica with .T.
		=Tableupdate(.T.)
		DO FAc_deta
		SELECT TEMPO
		m.numerofe=transform(config.cajae,"@L 99999")+"-"+TRANSFORM(VAL(allt(cRespuestaE.Texto5)),"@L 99999999")
		m.cae=allt(cRespuestaE.Texto8)
		m.vencecae=DTOC(DATE()+10)
		m.cPathQR=(Sys(5)+Sys(2003)+"\FE\"+allt(STR(VARINU))+".TXT"+".JPG")
		
		LABEL FORM ca_ticket to print
		
		if nComanda>0
			
			LABEL FORM comanda to print 
		endif
		Select cRespuestaE
		USE
		
	ELSE
		wait windo  at 25,25 "No se obtuvo CAE..." + cRespuestaE.Texto8 NOWA TIMEO 2
		Select Fac_Cabe
		Append Blank
		Replace FECHA With Date(), ;
			cliente With Alltrim(VCLIETO), ;
			cuit With VKUY, ;
			tipofa With cTipoComprobante , ;
			diezt With DIEZ
		Replace ventit With VENTI , ;
			sint With SUB, ;
			tot With SIVA, ;
			cae_vence with DATE()+10
		
		Replace nro With Val(cRespuestaE.Texto5), ;
			prefijo With CONFIG.cajae, ;
			cae with allt(cRespuestaE.Texto8),nro_fact with varinu,electronica with .T.
		=Tableupdate(.T.)
		DO fac_deta
		
		
	ENDIF
ELSE
	wait window nowa at 25,25 "Error con el CUIT...no se imprimira el comprobante"

enDI

PROCEDURE fac_deta
select tempo
GO top
DO while !EOF()
	insert into Fact_Deta (CANTIDAD, DESCRIPCIO, PU,DESCUENTO,PTOTAL,FECHA,NRO_FACT,CODIGO) VALUES (TEMPO.CANTIDAD, TEMPO.DESCRIPCIO, TEMPO.PU,TEMPO.DESCUENTO,TEMPO.PTOTAL,TEMPO.FECHA,TEMPO.NRO_FACT,CODIGO)
	Select tempo
	SKIP
ENDDO
SELE Fact_Deta
=TABLEUPDATE(.T.)

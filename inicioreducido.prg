***
*** ReFox X  #UK933629  MANRIQUE ORELLANA  MANSOFT SYSTEMS [VFP80]
***
*#INCLUDE "INCLUDE\TPV.H"
Set Multilocks On
Set Sysmenu To
Do hdnserie
Public va, ca, vnoaa, toro, kant
kant = 0
toro = 0
vnoaa = ""
va = " "
ca = " "
*WAIT WINDOW VERSION(4)+VERSION(2)+VERSION(3)
Public venti, diez, siva, noe,  ;
	vatipo, frm
Public hoy, hoyh, elca, elsal, nu,  ;
	ret, toin, toeg, ecaja, v
Public unc, cincoc, diezc,  ;
	veinticincoc, cincuentac,  ;
	unp, dosp, cincop, diezp,  ;
	veintep, cincuentap, cienp,  ;
	efete
Public primera, segunda, ncan,  ;
	imp
primera = ""
segunda = ""
ncan = 0
imp = 0
v = ""
frm = ""
Public tc, td, ch, vl, tic, toar,  ;
	ladife
toar = 0
ladife = 0
tc = 0
td = 0
ch = 0
vl = 0
tic = 0
efete = 000000.00
unc = 0
cincoc = 0
diezc = 0
veinticincoc = 0
cincuentac = 0
unp = 0
dosp = 0
cincop = 0
diezp = 0
veintep = 0
cincuentap = 0
cienp = 0
vatipo = ""
noe = .F.
siva = 0
venti = 0
diez = 0
Public ultimo, esdemo
esdemo = .F.
Public demow, clabase, vautoriza,  ;
	capitan, negativo
capitan = ""
vautoriza = .F.
demow = ""
Public conte
conte = 0
clabase = "datos"
Set Default To Sys(2003)
Do PRESENTAN.Exe
Do abrir
Use CONFIG SHARED
Public tentacion
tentacion = Alltrim(config.Local)
negativo = Alltrim(config.fax)
Do noabre2vc
Modify Window Screen Title  ;
'SISTEMA PUNTO DE VENTA - WWW.brexxon.net.ar'
*!*		'SISTEMA GESTION COMERCIAL' +  ;
*!*		" " + tentacion
Select config
Use
*!*	If  .Not. File("fprun.dll")
*!*		Messagebox( ;
*!*			"ERROR,COMUNIQUESE,www.brexxon.net.ar",  ;
*!*			16, "ATENCION")
*!*		Clear Events
*!*		Quit
*!*	Endif
*!*	Set Status Bar Off
*!*	Set Console Off
*!*	Use fprun.Dll
*!*	Public maquina
*!*	maquina = Substr(Sys(0), 1, 10)
*!*	Select fprun
*!*	Goto Top
*!*	Locate For Alltrim(fprun.nombre) =  ;
*!*		maquina
*!*	If Found()
*!*		If lpvolnumber <> fprun.dia
*!*			lacu = 21 - fprun.campo
*!*			Do Form registro
*!*			esdemo = .T.
*!*			If campo >= 21
*!*				Messagebox( ;
*!*					"ERROR,COMUNIQUESE,www.brexxon.net.ar",  ;
*!*					16,  ;
*!*					"ATENCION")
*!*				Do Form registro
*!*				Clear Events
*!*				Quit
*!*			Else
*!*				Local trae
*!*				trae = 0
*!*				trae = fprun.campo
*!*				Replace fprun.campo  ;
*!*					WITH trae +  ;
*!*					1
*!*			Endif
*!*		Endif
*!*	Else
*!*		Select fprun
*!*		Append Blank
*!*		Replace fprun.nombre With  ;
*!*			maquina
*!*		If lpvolnumber <> fprun.dia
*!*			lacu = 21 - fprun.campo
*!*			Do Form registro
*!*			esdemo = .T.
*!*			If campo >= 21
*!*				Messagebox( ;
*!*					"ERROR,COMUNIQUESE,www.brexxon.net.ar",  ;
*!*					16,  ;
*!*					"ATENCION")
*!*				Clear Events
*!*				Quit
*!*			Else
*!*				Local trae
*!*				trae = 0
*!*				trae = fprun.campo
*!*				Replace fprun.campo  ;
*!*					WITH trae +  ;
*!*					1
*!*			Endif
*!*		Endif
*!*	Endif
Set Date To Dmy
Set ENGINEBEHAVIOR 70
Public variable, pctexto, redir,  ;
	puertoi, tipotpv, iarqueo
iarqueo = ""
tipotpv = ""
puertoi = ""
redir = ""
pctexto = ""
variable = 0
Public lugar
Public acceso, desdeh, hastah
desdeh = 0
hastah = 0
acceso = .T.
Set Procedure To procs
Set Resource Off
Set Collate To 'SPANISH'
Set Status Bar On
Set Century On
Set Cursor On
Set Scoreboard Off
Set Bell Off
Set Safety Off
Set Confirm Off
Set Deleted On
Set Escape Off
Set Talk Off
Set Clock Off
Set Date To Dmy
Set Typeahead To 1
Set Hours To 24
Set Message To 24 Center
Release Window 'estándar'
Set Exclusive Off
Set Multilocks On
Set Readborder Off
Set Sysmenu To
Set Status Bar On
Set procedure to fe.prg additive
Public archi, cualera, yata, c,  ;
	paga,cMarcaIFiscal
cMarcaIFiscal="EPSON"
paga = 0000.00
c = ""
yata = 0
cualera = ""
archi = 0
On Key Label CTRL+Enter archi=1
On Key Label F12 archi=0
With _Screen
	.WindowState = 2
	.Closable = .F.
	.MaxButton = .F.
	.AutoCenter = .F.
	.MinButton = .F.
ENDWITH
*!* EJEMPLO DE INTEGRACIÓN VFPsControlSkin
*!* By VFPSTEAM BI SOLUTIONS 

SET CONSOLE OFF
SET TALK OFF

*!* INICIAR VFPSCONTROLSKIN (REALIZARLO SIEMPRE DESDE SU MAIN PRINCIPAL)
*!* PARAMETROS
*!* APPLICATION = ENTORNO PRINCIPAL DE VISUAL FOXPRO
*!* _SCREEN     = OBJETO DONDE SE VA A CREAR VFPsControlSkin
*!* 1           = TIPOS DE SKIN VA DESDE 1 A 8

IF FILE("VFPsControlSkin.Exe")
 
   VFPsControlSkin(APPLICATION,_SCREEN,"5") && SE ENVIA EL STYLE OFFICE 2010 BLUE
ENDIF

*!* LLENAR PARAMETROS VFPS MESSAGEBOX
_SCREEN.llHyperLinks  = .T.                 &&COLOCAR EN .T. SI SE DESEA USAR HYPERLINKS.
_SCREEN.lcTituloText  = "Atención !!"       &&TITULO OPCIONAL QUE DESEAMOS VISUALIZAR ANTES DEL MENSAJE EN EL VFPS MESSAGEBOX
_SCREEN.lcFooterText  = "<A HREF=" + ["] + "http://www.brexxon.net.ar" + ["] + ">Brexxon Tecnologia " + ALLTRIM(STR(YEAR(DATE()))) + "</A> Grandes Soluciones Para Negocios Pequeños"
_SCREEN.llVista8      = .T.				    &&SI DESEA USAR EL ESTILO DE VFPS MESSAGEBOX DE WINDOWS 8 COLOCARLO EN .T.
_SCREEN.lnDialogWidth = 0					&&TAMAÑO DE LA VENTANA DE VFPS MESSAGEBOX
On Error Do MESAERRO With  Error(), Program(),;
	LINENO(), Message()
On Shutdown Do SALIDA

If _login(1)
	tipotpv = Filetostr("TIPOTPV.TXT")
	Create Cursor cTIPOTPV(TEXTO c(25))
	Strtofile(tipotpv,"tpv.txt")
	Select cTIPOTPV
	Append From ("tpv.txt") Type Sdf
	Go Bottom
	cMarcaIFiscal=cTIPOTPV.TEXTO
	Use
	&&WAIT WINDOW  TIPOTPV
	If tipotpv = "FISCAL"
		Do Form venta2rnF
	Else
		Do Form venta2rn
	Endif
	Read Events
Else
	Close All
	Clear Events
	Set Sysmenu To Default
Endif
If Substr(Sys(0), 1, 9) <>  ;
		"mostrador"
	Set Deleted On
Endif
Close Databases All
Endproc
**
Procedure SALIDA
	If 6 = Messagebox("¿Desea salir?",  ;
			036, "Salir")
		Close Databases
		On Shutdown
		Clear Events
		Close All
		Quit
	Endif
	Return
Endproc
**
***
*** ReFox - retrace your steps ...
***

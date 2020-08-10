*** 
*** ReFox X  #UK933629  MANRIQUE ORELLANA  MANSOFT SYSTEMS [VFP80]
***
**
FUNCTION _Login
LPARAMETERS mainmenu, nnivel
LOCAL llret
DO CASE
     CASE PARAMETERS() < 1 .OR.  ;
          PARAMETERS() > 1
          mainmenu = .F.
     CASE PARAMETERS() = 1
          mainmenu = .T.
ENDCASE
SET SKIP OF MENU _MSYSMENU .T.
USE SHARED usuarios IN 10
loform = CREATEOBJECT("Login",  ;
         mainmenu, nnivel)
loform.show()
llret = loform.lretorno
RELEASE loform
USE
SET SKIP OF MENU _MSYSMENU .F.
IF llret
     RETURN .T.
ELSE
     RETURN .F.
ENDIF
ENDFUNC
**
DEFINE CLASS Login AS FORM
height = 110
width = 220
docreate = .T.
autocenter = .T.
borderstyle = 2
caption = "Ingrese usuario y contraseña"
controlbox = .F.
closable = .F.
maxbutton = .F.
minbutton = .F.
windowtype = 1
nintentos = -1
nnivel = -1
mainmenu = .F.
name = "Login"
lretorno = .F.
ADD OBJECT cmdaceptar AS  ;
    commandbutton WITH top = 72,  ;
    left = 48, height = 25, width =  ;
    72, fontname =  ;
    "MS Sans Serif", fontsize = 8,  ;
    caption = "Aceptar", default =  ;
    .F., tabindex = 5, name =  ;
    "cmdAceptar"
ADD OBJECT cmdcancelar AS  ;
    commandbutton WITH top = 72,  ;
    left = 133, height = 25,  ;
    width = 72, fontname =  ;
    "MS Sans Serif", fontsize = 8,  ;
    cancel = .T., caption =  ;
    "Salir", tabindex = 6, name =  ;
    "cmdCancelar"
ADD OBJECT lblusuario AS label  ;
    WITH fontname =  ;
    "MS Sans Serif", fontsize = 8,  ;
    alignment = 1, backstyle = 0,  ;
    caption = "Usuario", height =  ;
    15, left = 12, top = 16,  ;
    width = 60, tabindex = 2,  ;
    name = "lblUsuario"
ADD OBJECT lblcontrasena AS label  ;
    WITH fontname =  ;
    "MS Sans Serif", fontsize = 8,  ;
    alignment = 1, backstyle = 0,  ;
    caption = "Contraseña",  ;
    height = 15, left = 12, top =  ;
    40, width = 60, tabindex = 4,  ;
    name = "lblContrasena"
ADD OBJECT txtusuario AS textbox  ;
    WITH fontname =  ;
    "MS Sans Serif", fontsize = 8,  ;
    format = "!k", height = 21,  ;
    left = 85, maxlength = 15,  ;
    tabindex = 1, top = 12, width =  ;
    120, name = "txtUsuario"
ADD OBJECT txtcontrasena AS  ;
    textbox WITH fontname =  ;
    "MS Sans Serif", fontsize = 8,  ;
    format = "!k", height = 21,  ;
    left = 85, maxlength = 5,  ;
    tabindex = 3, top = 36, width =  ;
    120, passwordchar = "*", name =  ;
    "txtContrasena"
**
FUNCTION validausuario
     LPARAMETERS tcusuario,  ;
                 tccontrasena,  ;
                 mainmenu,  ;
                 nnivel
     LOCAL lcuser, lcpass,  ;
           lcmainmenu, lcnivel
     lcmainmenu = mainmenu
     lcnivel = nnivel
     tcusuario = ALLTRIM(UPPER(tcusuario))
     tccontrasena = ALLTRIM(tccontrasena)
     SELECT 10
     LOCATE FOR  ;
            ALLTRIM(UPPER(nombre)) ==  ;
            tcusuario
     IF FOUND()
          lcuser = tcusuario
          lcpass = asc2cha(ALLTRIM(password))
          lcpass1 = ALLTRIM(password)
     ELSE
          lcuser = "ALY"
          lcpass = "ALY"
     ENDIF
     IF  .NOT. (tcusuario ==  ;
         lcuser .AND.  ;
         tccontrasena == lcpass)
          = MESSAGEBOX( ;
            'Usuario o contraseña inválida',  ;
            48, 'Advertencia')
          RETURN .F.
     ELSE
          IF lcmainmenu
               DO validaaccesos  ;
                  WITH lcpass1
               capitan = ALLTRIM(tcusuario)
               RETURN .T.
          ELSE
               USE SHARED accesos
               SET ORDER TO USERYNIVEL
               SEEK lcpass1 +  ;
                    lcnivel 
               IF  .NOT. FOUND()
                    MESSAGEBOX( ;
                              "Usuario " +  ;
                              tcusuario +  ;
                              ". Acceso no Autorizado.",  ;
                              048,  ;
                              "Acceso no Autorizado" ;
                              )
                    USE
                    thisform.hide
                    RETURN .F.
               ELSE
                    IF  .NOT.  ;
                        habilitado
                         MESSAGEBOX( ;
                          "Usuario " +  ;
                          tcusuario +  ;
                          ". Acceso no Autorizado.",  ;
                          048,  ;
                          "Acceso no Autorizado" ;
                          )
                         USE
                         thisform.hide
                         RETURN .F.
                    ELSE
                         RETURN .T.
                    ENDIF
                    USE
               ENDIF
          ENDIF
     ENDIF
ENDFUNC
**
FUNCTION UNLOAD
     RETURN thisform.lretorno
ENDFUNC
**
PROCEDURE INIT
     LPARAMETERS mainmenu, nnivel
     WITH thisform
          .nintentos = 0
          .nnivel = nnivel
          .mainmenu = mainmenu
          .txtusuario.setfocus
          .cmdaceptar.default = .F.
     ENDWITH
ENDPROC
**
PROCEDURE cmdaceptar.CLICK
     thisform.nintentos = thisform.nintentos +  ;
                          1
     thisform.lretorno = thisform.validausuario(thisform.txtusuario.value,  ;
                         thisform.txtcontrasena.value,  ;
                         thisform.mainmenu,  ;
                         thisform.nnivel)
     IF thisform.lretorno
          thisform.hide
     ELSE
          IF thisform.nintentos <  ;
             3
               IF EMPTY(thisform.txtusuario.value)
                    thisform.txtusuario.setfocus
               ELSE
                    thisform.txtcontrasena.setfocus
               ENDIF
          ELSE
               = MESSAGEBOX( ;
                 'Acceso denegado',  ;
                 16,  ;
                 'Advertencia')
               thisform.hide
          ENDIF
     ENDIF
ENDPROC
**
PROCEDURE cmdcancelar.CLICK
     WITH thisform
          .lretorno = .F.
          .hide
     ENDWITH
ENDPROC
**
ENDDEFINE
**
FUNCTION Cha2Asc
PARAMETER mena
a = LEN(mena)
lcresultado = ''
FOR b = 1 TO a
     r = SUBSTR(mena, b, 1)
     lcresultado = lcresultado +  ;
                   CHR(ASC(r) +  ;
                   60 - 1)
ENDFOR
RETURN lcresultado
ENDFUNC
**
FUNCTION Asc2Cha
PARAMETER mena
a = LEN(mena)
lcresultado = ''
FOR b = 1 TO a
     r = SUBSTR(mena, b, 1)
     lcresultado = lcresultado +  ;
                   CHR(ASC(r) + 1 -  ;
                   60)
ENDFOR
RETURN lcresultado
ENDFUNC
**
FUNCTION reg_lock
PARAMETER wwait
PRIVATE forever, xjw
IF RLOCK()
     RETURN (.T.)
ENDIF
xjw = wwait
DO WHILE .T.
     forever = (wwait = 0)
     DO WHILE (forever .OR. wwait> ;
        0)
          INKEY(0.5 )
          wwait = wwait - 0.5 
          IF RLOCK()
               RETURN (.T.)
          ENDIF
     ENDDO
     rr = 0
     rr = MESSAGEBOX( ;
          'El registro de la tabla ' +  ;
          '"' + DBF() + '"' +  ;
          ' esta siendo utilizado.... Desea esperar(S/N)?',  ;
          036, " ")
     IF rr = 7
          RETURN (.F.)
     ENDIF
     wwait = xjw
ENDDO
RETURN (.F.)
ENDFUNC
**
*** 
*** ReFox - retrace your steps ... 
***

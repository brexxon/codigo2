*-------------------------------------------
*--- COMIENZO DEL PROGRAMA DE EJEMPLO
*--- Versión 2 - 2000.04.20
*-------------------------------------------
*--- Libreria de la clase Presenta
SET CLASSLIB TO Presenta.vcx ADDITIVE

*--- Creo el objeto 
*---  CREATEOBJECT("Presenta", tcTitulo, tcImagen)
*---  Parámetros: tcTitulo: Título de la aplicación
*---              tcImagen: Imagen de fondo del formulario (.BMP, .JPG ó .GIF)

oPresenta = CREATEOBJECT("presenta", "www.br-exxon.net")
oPresenta.SHOW

_SCREEN.VISIBLE = .F.

*--- Retardo para que se muestre completa la pantalla
DOEVENTS
DOEVENTS
DOEVENTS

*-------------------------------------------
*--- Aquí hago todos los seteos
*--- o tareas mientras se muestra
*--- la presentación
*-------------------------------------------

*--------------------------
*--- Para prueba espero 5"
*--- quitar el INKEY()
=INKEY(5)
*--------------------------

oPresenta.RELEASE

*--- Para volver a mostrar la pantalla de VFP
_SCREEN.VISIBLE = .T.

*-------------------------------------------
*--- Aquí llamo al menú
*--- o formulario principal
*--- de mi aplicación
*-------------------------------------------

RETURN

*-------------------------------------------
*--- FINAL DEL PROGRAMA DE EJEMPLO
*-------------------------------------------

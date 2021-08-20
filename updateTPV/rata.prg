*** 
*** ReFox X  #UK933629  MANRIQUE ORELLANA  MANSOFT SYSTEMS [VFP80]
***
USE EXCLUSIVE PEDIDOS
DELETE TAG all
INDEX ON proveedor TAG proveedor  ;
      COLLATE 'GENERAL'
INDEX ON detalle TAG detalle  ;
      COLLATE 'GENERAL'
PACK
USE EXCLUSIVE VENDEDORES
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      COLLATE 'GENERAL'
PACK
USE EXCLUSIVE VENTAS
DELETE TAG all
INDEX ON fecha TAG fmati COLLATE  ;
      'GENERAL'
INDEX ON codigo TAG codigo  ;
      COLLATE 'GENERAL'
INDEX ON DTOC(fecha) + tipo TAG  ;
      tipofe COLLATE 'GENERAL'
PACK
USE EXCLUSIVE PROVEE
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      COLLATE 'GENERAL'
INDEX ON razon TAG razon COLLATE  ;
      'GENERAL'
PACK
USE EXCLUSIVE RUBROS
DELETE TAG all
INDEX ON rubro TAG rubro COLLATE  ;
      'GENERAL'
INDEX ON codigo TAG codigo  ;
      COLLATE 'GENERAL'
PACK
USE EXCLUSIVE PRO
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      COLLATE 'GENERAL'
INDEX ON razon TAG razon COLLATE  ;
      'GENERAL'
INDEX ON factura TAG factura  ;
      COLLATE 'GENERAL'
INDEX ON pagada TAG pagada  ;
      COLLATE 'GENERAL'
PACK
USE EXCLUSIVE INGRESO
DELETE TAG all
INDEX ON fecha TAG fecha COLLATE  ;
      'MACHINE'
PACK
USE EXCLUSIVE EGRESO
DELETE TAG all
INDEX ON fecha TAG fecha COLLATE  ;
      'MACHINE'
INDEX ON detalle TAG detalle  ;
      COLLATE 'MACHINE'
PACK
USE EXCLUSIVE CONSOLI
DELETE TAG all
INDEX ON fecha TAG fecha COLLATE  ;
      'MACHINE'
PACK
USE EXCLUSIVE KUENTAS
DELETE TAG all
INDEX ON detalle TAG detalle  ;
      COLLATE 'MACHINE'
INDEX ON numero TAG numero  ;
      COLLATE 'MACHINE'
PACK
USE EXCLUSIVE KUENTAS2
DELETE TAG all
INDEX ON detalle TAG detalle  ;
      COLLATE 'GENERAL'
INDEX ON numero TAG numero  ;
      COLLATE 'MACHINE'
PACK
USE EXCLUSIVE MERCA
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      COLLATE 'GENERAL'
INDEX ON detalle TAG detalle  ;
      COLLATE 'GENERAL'
INDEX ON rubro TAG rubro COLLATE  ;
      'GENERAL'
INDEX ON proveedor TAG proveedor  ;
      COLLATE 'GENERAL'
INDEX ON proveedor + detalle TAG  ;
      pd COLLATE 'GENERAL'
INDEX ON artipro TAG artipro  ;
      COLLATE 'GENERAL'
INDEX ON barra TAG barra COLLATE  ;
      'GENERAL'
PACK
USE EXCLUSIVE AFA
DELETE TAG all
INDEX ON cliente TAG cliente  ;
      COLLATE 'MACHINE'
INDEX ON fecha TAG fecha COLLATE  ;
      'MACHINE'
PACK
USE EXCLUSIVE REMITOS
DELETE TAG all
INDEX ON fecha TAG fecha COLLATE  ;
      'GENERAL'
INDEX ON (numero + DTOC(fecha))  ;
      TAG nf COLLATE 'GENERAL'
INDEX ON numero TAG numero  ;
      COLLATE 'GENERAL'
PACK
USE EXCLUSIVE CLIENTES
DELETE TAG all
INDEX ON codigo TAG codigo  ;
      COLLATE 'GENERAL'
INDEX ON grupo + nombre TAG nom  ;
      COLLATE 'GENERAL'
INDEX ON nombre TAG nombre  ;
      COLLATE 'GENERAL'
PACK
USE EXCLUSIVE PAGOS
DELETE TAG all
INDEX ON fecha TAG fecha COLLATE  ;
      'GENERAL'
INDEX ON codigo TAG codigo  ;
      COLLATE 'GENERAL'
PACK
USE EXCLUSIVE DEVCTA
DELETE TAG all
INDEX ON fecha TAG fecha COLLATE  ;
      'MACHINE'
PACK
USE EXCLUSIVE CUENTACN
DELETE TAG all
INDEX ON DTOS(fecha) +  ;
      PADL(ALLTRIM(remito), 10)  ;
      TAG fevene COLLATE  ;
      'GENERAL'
INDEX ON DTOS(fecha) +  ;
      PADL(ALLTRIM(remito), 10)  ;
      TAG fedepa COLLATE  ;
      'GENERAL'
INDEX ON VAL(DTOS(fecha)) +  ;
      VAL(remito) TAG fere  ;
      COLLATE 'GENERAL'
INDEX ON (fecha) + VAL(remito)  ;
      TAG feva COLLATE 'GENERAL'
INDEX ON codcli TAG codcli  ;
      COLLATE 'GENERAL'
INDEX ON fecha TAG fecha COLLATE  ;
      'GENERAL'
INDEX ON (remito + DTOC(fecha))  ;
      TAG cnfr COLLATE 'GENERAL'
INDEX ON (DTOC(fecha) + remito)  ;
      TAG frcn COLLATE 'GENERAL'
INDEX ON remito TAG remito  ;
      COLLATE 'GENERAL'
INDEX ON  ;
      PADL(ALLTRIM(STR(YEAR(fecha),  ;
      4)), 4, "0") +  ;
      PADL(ALLTRIM(STR(MONTH(fecha),  ;
      2)), 2, "0") +  ;
      PADL(ALLTRIM(STR(DAY(fecha),  ;
      2)), 2, "0") +  ;
      PADL(ALLTRIM(remito), 10,  ;
      "0") TAG fedeva COLLATE  ;
      'MACHINE'
PACK
USE EXCLUSIVE KLIENTES
DELETE TAG all
INDEX ON nombre TAG nombre  ;
      COLLATE 'GENERAL'
INDEX ON codigo TAG codigo  ;
      COLLATE 'GENERAL'
DELETE TAG all
USE EXCLUSIVE cLIE
DELETE TAG all
INDEX ON cliente TAG nombre  ;
      COLLATE 'MACHINE'
PACK
USE EXCLUSIVE ABREK
DELETE TAG all
INDEX ON fecha TAG fecha COLLATE  ;
      'MACHINE'
PACK
CLOSE ALL
ON SHUTDOWN
CLEAR EVENTS
CLOSE ALL
QUIT
ENDPROC
**
*** 
*** ReFox - retrace your steps ... 
***

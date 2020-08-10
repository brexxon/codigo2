*** 
*** ReFox X  #UK933629  MANRIQUE ORELLANA  MANSOFT SYSTEMS [VFP80]
***
PARAMETER lproot
PUBLIC lnret, lcstring, lpvolname,  ;
       nvolsize, lpvolnumber,  ;
       lpmaxcomp, lpflags,  ;
       lpfsname, nfssize,  ;
       lpbuffer, nsize
IF EMPTY(lproot)
     lproot = "C:\"
ENDIF
lpvolname = SPACE(256)
nvolsize = 256
lpvolnumber = 0
lpmaxcomp = 256
lpflags = 0
lpfsname = SPACE(256)
nfssize = 256
nsize = 256
lpbuffer = SPACE(256)
DECLARE INTEGER GetActiveWindow  ;
        IN user32 AS GetHwnd
DECLARE INTEGER  ;
        GetVolumeInformation IN  ;
        kernel32 AS GetVol STRING  ;
        @, STRING @, INTEGER,  ;
        INTEGER @, INTEGER @,  ;
        INTEGER @, STRING @,  ;
        INTEGER
lnret = getvol(@lproot,  ;
        @lpvolname, nvolsize,  ;
        @lpvolnumber, @lpmaxcomp,  ;
        @lpflags, @lpfsname,  ;
        nfssize)
lcstring = "Drive:            " +  ;
           UPPER(ALLTRIM(lproot)) +  ;
           CHR(13) + "Volumen: " +  ;
           LEFT(ALLTRIM(lpvolname),  ;
           LEN(ALLTRIM(lpvolname)) -  ;
           1) + CHR(13) +  ;
           "Serie ---> " +  ;
           ALLTRIM(STR(lpvolnumber)) +  ;
           CHR(13) + "FS : " +  ;
           ALLTRIM(lpfsname)
RETURN ALLTRIM(STR(lpvolnumber))
ENDFUNC
**
*** 
*** ReFox - retrace your steps ... 
***

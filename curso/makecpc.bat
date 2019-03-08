@echo off
REM _________________________________________________________
REM Inicializamos las variables de sistema de Z88DK
REM _________________________________________________________
echo "ESTA ES LA VERSION 1.10"
set Z88DK_PATH=c:\z88dk10
set PATH=%Z88DK_PATH%\bin;%PATH%
set Z80_OZFILES=%Z88DK_PATH%\Lib\
set ZCCCFG=%Z88DK_PATH%\Lib\Config\
REM _________________________________________________________
REM Compilamos el juego
REM _________________________________________________________
echo ## COMPILANDO
zcc +cpc -lndos -o juegocpc.bin juegocpc.c
echo ## CONSTRUYENDO DISCO
rem cambia JUEGO por el nombre que quieres que salga en Program:
utilscpc\cpcdiskxp -File juegocpc.bin -AddAmsdosHeader 6000 -AddToNewDsk juegocpc.dsk
REM _________________________________________________________
REM Borramos ficheros temporales generados
REM _________________________________________________________
echo ## BORRANDO TEMPORALES
del juegocpc.bin
del *.def
echo ## FIN
REM _________________________________________________________
REM Esperamos a que el usuario pulse una tecla para cerrar
REM _________________________________________________________
pause

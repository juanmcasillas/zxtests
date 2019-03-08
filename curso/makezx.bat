@echo off
REM _________________________________________________________
REM Inicializamos las variables de sistema de Z88DK
REM _________________________________________________________
echo "ESTA ES LA VERSION 1.10"
set Z88DK_PATH=C:\Users\l0086\Desktop\ZX\z88dk
set PATH=%Z88DK_PATH%\bin;%PATH%
set Z80_OZFILES=%Z88DK_PATH%\lib
set ZCCCFG=%Z88DK_PATH%\lib\config

REM _________________________________________________________
REM Compilamos el juego
REM _________________________________________________________
echo ## COMPILANDO
zcc +zx -vn juegozx.c -o juegozx.bin -lndos -zorg=24200
echo ## CONSTRUYENDO CINTA
rem cambia JUEGO por el nombre que quieres que salga en Program:
rem Si quieres pantalla de carga renombra loaderzx_con_pantalla.bas por loaderzx.bas
rem meto otra linea mejor
rem utilszx\bas2tap.exe -a10 -sJUEGO loaderzx.bas loaderzx.tap
utilszx\bas2tap.exe -a10 -sJUEGO loaderzx_con_pantalla.bas loaderzx.tap
rem Si quieres pantalla de carga quita el siguiente "rem"
utilszx\bin2tap -o screenzx.tap -a 16384 loadingzx.bin
utilszx\bin2tap -o mainzx.tap -a 24200 juegozx.bin
copy /b loaderzx.tap + screenzx.tap + mainzx.tap juegozx.tap
REM _________________________________________________________
REM Borramos ficheros temporales generados
REM _________________________________________________________
echo ## BORRANDO TEMPORALES
REM del loaderzx.tap
REM del mainzx.tap
REM del juegozx.bin
REM del *.def
echo ## FIN
REM _________________________________________________________
REM Esperamos a que el usuario pulse una tecla para cerrar
REM _________________________________________________________
REM pause

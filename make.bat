REM zcc +zx -vn -startup=1 -clib=new -SO3 --max-allocs-per-node200000 -Wall hello.c -o hello -create-app
zcc +zx -vn -startup=1 -clib=new -SO3 -Wall hello.c -o hello -create-app

bas2tap -a10 -sLOADER loader.bas loader.tap
pasmo --tap --name SCREEN loading_screen.asm loading_screen.tap LS.TXT
copy /b loader.tap + loading_screen.tap + hello.tap  bundle.tap

del loader.tap
del loading_screen.tap
del hello.tap
del *.def

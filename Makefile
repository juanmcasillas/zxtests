# http://cs.colby.edu/maxwell/courses/tutorials/maketutor/
CC = zcc
CFLAGS = +zx -vn -startup=1 -clib=sdcc_ix -SO3 --max-allocs-per-node200000 --reserve-regs-iy -Wall 
DEPS = 
all:	bundle

%.o: %.c $(DEPS)
	$(CC) $(CFLAGS) -c -o $@ $< 

hello: hello.o
	$(CC) $(CFLAGS) -o $@ $^ -create-app

loader: 
	../Tools/bas2tap-master/bas2tap -a10 -sLOADER loader.bas loader.tap

loading_screen:
	../Tools/pasmo-0.5.4.beta2/pasmo --tap --name SCREEN loading_screen.asm loading_screen.tap LS.TXT

bundle: loader loading_screen hello
		cat loader.tap loading_screen.tap hello.tap > bundle.tap

.PHONY:	clean

clean:
	rm -f *_CODE.bin *_UNASSIGNED.bin *.tap *.TAP *.o LS.TXT

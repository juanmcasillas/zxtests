# http://cs.colby.edu/maxwell/courses/tutorials/maketutor/
CC = zcc
CFLAGS = +zx -vn -startup=1 -clib=sdcc_ix -SO3 --max-allocs-per-node200000 --reserve-regs-iy -Wall 
DEPS = 
all:	hello

%.o: %.c $(DEPS)
	$(CC) $(CFLAGS) -c -o $@ $< 

hello: hello.o
	$(CC) $(CFLAGS) -o $@ $^ -create-app

sudoku:	sudoku.c
	$(CC) $(CFLAGS) -o $@ $^ -create-app

.PHONY:	clean

clean:
	rm -f *_CODE.bin *_UNASSIGNED.bin *.tap *.o

#zcc +cpm -vn -SO3 -clib=sdcc_iy --max-allocs-per-node200000 sudoku.c -o sudoku -create-app
zcc +zx -vn -startup=1 -clib=sdcc_ix -SO3 --max-allocs-per-node200000 --reserve-regs-iy sudoku.c -o sudoku -create-app

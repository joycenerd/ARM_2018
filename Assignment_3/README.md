# Assignment_3 Matrix Computation

## Code Explanation ##

1. define my matrix a(3x2)

```
1 2
3 4
5 6
```

2. define my matrix b(2x3)

```
1 2 3
4 5 6
```

3. because the register is limited so I didn't load all the thing in the same time. Instead I load the whole b matrix to r2-r7. r2=1,r3=2,r4=3,r5=4,r6=5,r7=6. And load empty matrix c to r1. Load the first row of matrix a to r8 and r9. First do row1 of a multiply col1 of b. save it to c(1,1). And then row1 of a multiply col2 of b and save it to c(1,2). After finishing row1 of a then I load row2 of a. Do this until c(3,3) is stored. 
4. The result of matrix c will be:
```
9 12 15
19 26 33
29 40 51
```

## How to Use ##

1. If arm-toolchain is in this path: `~/arm-new/bin`, then put my hw3 directory in `~/arm-new/bin` , `cd [hw3 directory]`, type `make`, then hw3.s will be compile to hw3.exe. Last thing is to load hw3.exe into insight and run.
2. If your arm-toolchain's path is different from 1. then need to go to your arm-toolchain and do the all the command by yourself.

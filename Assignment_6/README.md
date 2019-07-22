# Assignment_6 C call Assembly Program

## Code Explanation ##

1. main function (hw6_test.c)

My main function is written in C. This is a simple program calling gcd function doing gcd. My main function will call a function name gcd, which is written in ARM assembly language. 

There will be two arguments a=80, b=48 be passed into the gcd function. The two parameters will do gcd and return 16 at last,since gcd(80,48)=16. 

The gcd function I use is same as the hw5's gcd function. At last output will be print out in the console like this: "The greatest common divider is 16".

2. gcd function (gcd.s)

First I initialize the system stack as:

```
mov ip,sp;
stmfd sp!,{fp,ip,lr,pc}
sub fp,ip,#4
```

The two parameters be passing into this function is in r0 and r1. This two parameters are the parameters that will be used in the function gcd.

Then do gcd: compare r0 and r1 value, if they are not equal  then go into the loop. If r0>r1, then r0=r0-r1, else if r1>r0, then r1=r1-r0, the loop ends when r0=r1.

The return value (result) will be in r0

At last function exit:

```
ldmea fp,{fp,sp,pc}
```

## How to use ##

1. require: arm-toolchain in the path `~/arm-new/bin`, put this hw6 directory in `~/arm-new/bin` too
2. open terminal change directory to hw6 folder
3. type command: `make`
4. hw6.exe will be generated in hw5 folder too
5. open arm-none-eabi-insight
6. load in hw6.exe
7. run

If your environment doesn't fit the requirement in 1., then type every command by yourself
1. cd [your arm-toolchain path]
2. `./arm-none-eabi-gcc -g -O0 [hw6 directory path]/hw6_test.s [hw6s directory path]/gcd.s -o [hw6 directory path]hw5.exe`
3. open arm-none-eabi-insight
4. load in hw6.exe
5. run


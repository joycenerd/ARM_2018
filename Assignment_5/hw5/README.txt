# Assignment_5 GCD Function
 
 ## Code Explanation ##

1. main function

	My main function first initialize system stack

	```
	mov ip,sp;
	stmfd sp!,{fp,ip,lr,pc}
	sub fp,ip,#4
	```

	And then pass in two parameters: assign two integers one to r0 another to r1, this two parameters are the parameters that will be used in the function gcd.

	Then I call the function gcd to find gcd of the two parameters by branch with link to gcd function

	The return value (result of gcd) will be in r0

	function exit

	```
	ldmea fp,{fp,sp,pc}
	```

2. gcd function

	First initialize system stack same as my main function.

	Then do gcd: compare r0 and r1 value, (because r0 and r1 are the two parameters pass in from main function) if they are not equal go into the loop. If r0>r1, then r0=r0-r1, else if r1>r0, then r1=r1-r0, the loop ends when r0=r1.

	The return value (result) will be in r0

	At last function exit same as my main function

## How to use ##

1. require: arm-toolchain in the path `~/arm-new/bin`, put this hw5 directory in `~/arm-new/bin` too
2. open terminal change directory to hw5 folder
3. type command: `make`
4. hw5.exe will be generated in hw5 folder too
5. open arm-none-eabi-insight
6. load in hw5.exe
7. run

If your environment doesn't fit the requirement in 1., then type every command by yourself
1. cd [your arm-toolchain path]
2. `./arm-none-eabi-gcc -g -O0 [hw5 directory path]/hw5_test.s [hw5 directory path]/gcd.s -o [hw5 directory path]hw5.exe`
3. open arm-none-eabi-insight
4. load in hw5.exe
5. run




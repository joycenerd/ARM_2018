# Assignment_4 Finding GCD

## Code Explanation ##

Using Euclidean Algorithm to find greatest common divisor.

1. Assign a value (integer) to r0 (64)
2. Assign another value (integer) to r1 (40)
3. Compare r0 and r1
4. If not the same then go into the loop
5. If r0 is greater than r1, then r0=r0-r1
6. Else if r0 is less than r1, then r1=r1-r0
7. If r0 and r1 still not the same then continue the loop until it's then same
8. r0 will hold the GCD of the two numbers at last (8)

## How to Use ##

1. Open terminal
2. go into the hw4 directory: `cd [hw4 directory path]`
2. turn hw4.s to executable file: `make`
3. The executable file hw4.exe will be in the same directory as hw4.s
4. If you can't find hw4.exe in the directory, this is because your arm-toolchain's path isn't same as I, if you want to use make your arm-toolchain's path must be `~/arm-new/bin`
5. If your arm-toolchain's path is different then you can compile hw4.s manually
	* `cd [toolchain path]`
	* `./arm-none-eabi-gcc -g -O0 [hw4 directory path]/hw4.s -o hw4.exe`
6. open insight:
	* `cd [toolchain path]`
	* `./arm-none-eabi-insight`
7. Load hw4.exe into insight and run the code
8. Be sure to open Register from View so you can see the answer

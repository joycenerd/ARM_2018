# Assignment_8 Intrinsic Function

## Code Explanation ##

This program is to do 200 * 200 floating point computation. There is two version of this program. One is written in ordinary C code and another is using intrinsic functions that gcc support to fasten the operation. 

1. Read 200 * 200 floating point numbers from data.txt
2. Multiply and add every pair of rows using `_mm_add_ps()` and `_mm_mul_ps()` and store the result in `rowsum[i][j]` ,i,j is the row numbers of the pair doing computation
3. The output will be 200 rows with single number: `accum[i]:=all rowsum[i][j], accumulate j from 0 to 199`
4. The answers will be output to `output.txt` for normal C version and `output_simd.txt` for SIMD version.

## How to use ##

1. require:
	* My program works well on Apple System gcc version: Apple LLVM version 10.0.0, and Ubuntu gcc version 7.3.0
	* I only use basic SSE instruction
	* Don't use csie workstation to test my program, because the system isn't campatible.
2. open terminal and change directory to hw8 directory
3. type command: `make`
4. hw8.out, hw8simd.out will be deleted after program execution as I written in my makefile for convenient to the execution next time 
5. Look into hw8 directory, you will see two new files generated after the program execution, that is output.txt and output_simd.txt. output.txt is the result for normal C code vesion and output_simd.txt is the result for SIMD version. The error between two result is no more than 1.
6. If the result is 200 nan in output_simd.txt than this is probably because your system can't run my SIMD code, recommend you try and find another system to test my program again.
7. output_simd.txt will have one extra space in the first line of result, becasue I find it not generating correct result without first printing that space out in Linux system.

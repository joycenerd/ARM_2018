# Assignment_7 FILE I/O

## Code Explanation ##

This program is to get data from input file (input.txt) and transform every lower case letter in the input data to upper case and pass the data to output data. 

I first set up all the parameters needed in
	1. open input file: filename addr (input.txt), argument(0x2 read),filename length (9)
	2. read from file: file descriptor, read buffer, bytes to read
	3. close input file: file descriptor
	4. string: string for writing to output file
	5. open output file: filename addr (output.txt), argument(0x4 write), filename length
	6. write into file: file descriptor, addr of the string, length of the string
	7. close output file: file descriptor

Then start the main function by initializing the system stack

* Processing input data from input file:
	1. Open input file using SWI_Open
	2. Get the file length using SWI_FLen
	3. load empty string space for storing my input data after processing
	4. reading file by running a loop and using SWI_Read
	5. if lower case letter (ascii code >= 97), change it to upper case ascii code-32
	6. store the result to my output string
	7. close input file by SWI_Close

* Write my string to output file:
	1. Open onput file using SWI_Open
	2. write into output file by passing (string, string length= file length of input file) as parameter of SWI_Write
	3.  close output file by SWI_Close

Finally end the program by `ldmea fp,{fp,sp,pc}`

## How to use ##

1. require: arm-toolchain in the path `~/arm-new/bin`, put this hw7 directory in `~/arm-new/bin` too
2. open terminal change directory to hw7 directory
3. type command: `make`
4. hw7.exe will be generated in hw7 directory too
5. open arm-none-eabi-insight
6. load in hw7.exe
7. run
8. see the result in output.txt which should be in hw7 directory

If your environment doesn't fit the requirement in 1., then type every command by yourself
1. cd [your arm-toolchain path]
2. `./arm-none-eabi-gcc -g -O0 [hw7 directory path]/hw7_test.s [hw7's directory path]/gcd.s -o [hw7 directory path]hw7.exe`
3. open arm-none-eabi-insight
4. load in hw7.exe
5. run
6. see the result in output.txt which should be in hw7 directory

NOTE: be sure NOT to move any file (hw7.s, hw7.exe, input.txt, output.txt, makefile) out of the directory, or else the program cannot be executed


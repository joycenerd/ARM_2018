/* =============== hw7.s ================*/
/*  Created by Joyce Chin on 2018/12/14. */


.set SWI_Open, 0x1
.set SWI_Close, 0x2
.set SWI_WriteC, 0x3
.set SWI_Write, 0x5
.set SWI_Read, 0x6
.set SWI_FLen, 0xC
.set AngelSWI, 0x123456

/* ========================= */
/*       DATA SECTION        */
/* ========================= */
    .data
    .align 4
/* --- data for input --- */
.file_address:  /* my input file */
    .ascii "input.txt\000"
.readbuffer:    /* reserve space for reading */
    .space 4

/* --- data for output ---*/
content:    /* my output string */
    .space 100000,0
out_filename:   /* output filename */
    .ascii "output.txt\000"

/* ========================= */
/*       TEXT SECTION        */
/* ========================= */
    .section .text
    .global main
    .type main,%function

/* --- input parameters --- */

/* filename is the adress assign in data section */
.in_filename:
    .word .file_address

/* parameters for open a file */
.openin_param:
    .word .file_address /* address of filename */
    .word 0x2   /* argument: read 0x2 */
    .word 0x9   /* filename length */

/* reserve space for file */
.filelength_param:
    .space 4

/* parameters for reading a file */
.read_param:
    .space 4    /* file descriptor */
    .word .readbuffer   /* address of read buffer */
    .space 4    /* bytes to be read */

/* parameters for closing input file */
.closein_param:
    .space 4 /* file descriptor */

/* --- output parameters --- */

.string:    /* string to pass into output file */
    .word content

/* open output file parameters */
.openout_param:
    .word out_filename
    .word 0x4
    .word 0x8

/* parameters to write into file */
.write_param:
    .space 4
    .space 4
    .space 4

/* parameters for closing output file */
.closeout_param:
    .space 4


main:
    /* initialize system stack */
    mov ip,sp
    stmfd sp!,{fp,ip,lr,pc}
    sub fp,ip,#4

    /* --- process input file ---*/

    /* open file */
    mov r0,#SWI_Open /* put function to call in r0 */
    adr r1,.openin_param  /* parameters addr to r1 */
    swi AngelSWI    /* 0x123456 */
    mov r2,r0   /* return value is file descriptor */

    /* length of file */
    mov r0,#SWI_FLen    /* r0=function call */
    adr r1,.filelength_param  /* r1=param to call function */
    str r2,[r1,#0]  /* file descriptor as first param */
    swi AngelSWI    /* call swi */
    mov r6,r0 /* return current length of file */

    mov r9,r6   /* input file length=output string length */

    /* read file */
    adr r1,.read_param
    str r2,[r1,#0]  /* file descriptor as first param */
    ldr r5,[r1,#4] /* load read buffer address */
    mov r3,#1   /* length of string */
    str r3,[r1,#8]
    ldr r7,.string /* prepare space to read data into the string */
    mov r8,#0 /* string index initialize */

    /* start reading file */
    cmp r6,#0
    bne LOOP

LOOP:
    mov r0,#SWI_Read
    swi AngelSWI
    /* load read data from read buffer */
    ldrb r4,[r5,#0]
    /* change lowercase letter to upper case */
    cmp r4,#97
    subge r4,r4,#32
    strb r4,[r7,r8] /* construct the output string */
    add r8,#1
    sub r6,r6,#1
    cmp r6,#0
    bne LOOP

    /* close input file */
    adr r1,.closein_param
    str r2,[r1,#0]
    mov r0,#SWI_Close
    swi AngelSWI

    /* --- pass output data to output file --- */

    /* open output file */
    mov r0,#SWI_Open
    adr r1,.openout_param
    swi AngelSWI
    mov r0,r2

    /* write to file */
    adr r1,.write_param
    str r2,[r1,#0]
    ldr r3,.string
    str r3,[r1,#4] /* pass string I construct */
    mov r3,r9
    str r3,[r1,#8]
    mov r0,#SWI_Write
    swi AngelSWI

    /* close output file */
    adr r1,.closeout_param
    str r2,[r1,#0]
    mov r0,#SWI_Close
    swi AngelSWI
    
    nop	
    /* end program */
    ldmea fp,{fp,sp,pc}
.end

/* ========================= */
/*       TEXT SECTION        */
/* ========================= */
    .section .text
    .global main
    .type main,%function
main:
    mov r0,#64  /* assign r0 to a */
    mov r1,#40  /* assign r1 to b*/
    cmp r0,r1   /* compare r0 and r1 */
    bne LOOP    /* if not the same run the loop */

/* gcd */
LOOP:
    cmp r0,r1
    subgt r0,r0,r1  /* if r0>r1, then r0=r0-r1 */
    sublt r1,r1,r0  /* else if r1>r0, then r1=r1-r0 */
    /* if r0 is not equal to r1, then keep running the loop until it's  the same */
    /* r0 will be the answer */
    cmp r0,r1   
    bne LOOP
    nop
.end


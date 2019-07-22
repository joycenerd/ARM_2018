/* ========================= */
/*       TEXT SECTION        */
/* ========================= */
    .section .text
    .global gcd
    .type gcd,%function
/* gcd function */
gcd:
    /* initialize system stack */
    mov ip,sp;
    stmfd sp!,{fp,ip,lr,pc}
    sub fp,ip,#4

    /* do gcd */
    cmp r0,r1   /* compare r0 and r1 */
    bne LOOP    /* if not the same run the loop */

/* gcd */
LOOP:
    cmp r0,r1
    subgt r0,r0,r1  /* if r0>r1, then r0=r0-r1 */
    sublt r1,r1,r0  /* else if r1>r0, then r1=r1-r0 */
    /* if r0 is not equal to r1, then keep running the loop until it is  the same */
    /* r0 will be the answer */
    cmp r0,r1   
    bne LOOP
    nop

    /* exit function */
    ldmea fp,{fp,sp,pc}
    .end



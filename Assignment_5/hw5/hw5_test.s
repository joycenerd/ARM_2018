/* ========================= */
/*	     TEXT SECTION	     */
/* ========================= */

	.section .text
	.global main
	.type main,%function

main:
	/* initialize system stack */
	mov ip,sp;
	stmfd sp!,{fp,ip,lr,pc}
	sub fp,ip,#4

	/* two parameters for gcd(r0,r1) */
	mov r0,#8
	mov	r1,#50
	/* called gcd function */
	bl gcd
    /* gcd result will be in r0 */
	nop
	
	/* function exit */
	ldmea fp,{fp,sp,pc}
	.end

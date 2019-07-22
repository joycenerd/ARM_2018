/* ========================= */
/*       DATA section        */
/* ========================= */
	.data
	.align 4

/* --- variable a --- */
	.type a, %object
	.size a, 24
a:
	.word 1
	.word 1
	.word 1
	.word 1
	.word 1
	.word 1

/* --- variable b --- */
	.type b, %object
	.size b, 24
b:  .word 1
	.word 1
	.word 1
	.word 1
	.word 1
	.word 1
c:
	.space 36, 0

/* ========================= */
/*       TEXT section        */
/* ========================= */
	.section .text
	.global main
	.type main,%function	
.matrix:
	.word a
	.word b
	.word c
main:
	/* load matrix b */
	ldr r0, .matrix+4
	ldmia r0,{r2-r7}

	/* load empty matrix c */
	ldr r1, matrix+8

	/* load row1 of matrix a */
	ldr r0, .matrix
	ldmia r0!, {r8,r9}

	/* multiply row1 of a and col1 of b and store to c(1,1) */
	mul r10,r8,r2
	mul r11,r9,r5
	add r10,r10,r11
	str r10,[r1],#4

	/* multiply row1 of a and col2 of b and store to c(1,2) */
	mul r10,r8,r3
	mul r11,r9,r6
	add r10,r10,r11
	str r10,[r1],#4

	/* multiply row1 of a and col3 of b and store to c(1,3) */
	mul r10,r8,r4
	mul r11,r9,r7
	add r10,r10,r11
	str r10,[r1],#4

	/* load row2 of matrix a */
	ldmia r0!, {r8,r9}

	/* multiply row2 of a and col1 of b and store to c(2,1) */
	mul r10,r8,r2
	mul r11,r9,r5
	add r10,r10,r11
	str r10,[r1],#4

	/* multiply row2 of a and col2 of b and store to c(2,2) */
	mul r10,r8,r3
	mul r11,r9,r6
	add r10,r10,r11
	str r10,[r1],#4

	/* multiply row2 of a and col3 of b and store to c(2,3) */
	mul r10,r8,r4
	mul r11,r9,r7
	add r10,r10,r11
	str r10,[r1],#4

	/* load row3 of matrix a */
	ldmia r0!, {r8,r9}

	/* multiply row3 of a and col1 of b and store to c(3,1) */
	mul r10,r8,r2
	mul r11,r9,r5
	add r10,r10,r11
	str r10,[r1],#4

	/* multiply row3 of a and col2 of b and store to c(3,2) */
	mul r10,r8,r3
	mul r11,r9,r6
	add r10,r10,r11
	str r10,[r1],#4

	/* multiply row3 of a and col3 of b and store to c(3,3) */
	mul r10,r8,r4
	mul r11,r9,r7
	add r10,r10,r11
	str r10,[r1],#4

	nop
.end












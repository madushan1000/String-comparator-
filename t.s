	.file	"t.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"leve live love love\000"
	.align	2
.LC1:
	.ascii	"love\000"
	.align	2
.LC2:
	.ascii	"%d\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	mov	ip, sp
	stmfd	sp!, {fp, ip, lr, pc}
	sub	fp, ip, #4
	sub	sp, sp, #40
	ldr	r3, .L19
	str	r3, [fp, #-52]
	ldr	r3, .L19+4
	str	r3, [fp, #-48]
	mov	r3, #1000
	str	r3, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L2
.L3:
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L2:
	ldr	r3, [fp, #-36]
	mov	r2, r3
	ldr	r3, [fp, #-52]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-41]
	ldrb	r3, [fp, #-41]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L3
	b	.L5
.L6:
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L5:
	ldr	r3, [fp, #-32]
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]
	strb	r3, [fp, #-41]
	ldrb	r3, [fp, #-41]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L6
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L8
.L9:
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L10
.L11:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-52]
	add	r3, r2, r3
	ldrb	r1, [r3, #0]	@ zero_extendqisi2
	ldr	r3, [fp, #-16]
	mov	r2, r3
	ldr	r3, [fp, #-48]
	add	r3, r2, r3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	cmp	r1, r3
	beq	.L12
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L12:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L10:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	blt	.L11
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	bgt	.L15
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L15:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L8:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-32]
	rsb	r3, r3, r2
	add	r2, r3, #1
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bgt	.L9
	ldr	r0, .L19+8
	ldr	r1, [fp, #-24]
	bl	printf
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #12
	ldmfd	sp, {fp, sp, pc}
.L20:
	.align	2
.L19:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.size	main, .-main
	.ident	"GCC: (GNU) 4.1.1"

	.file	"st.c"
	.text
	.align	2
	.global	comp
	.type	comp, %function
comp:
	@ args = 0, pretend = 0, frame = 4
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldrb	r3, [r0, #0]	@ zero_extendqisi2
	cmp	r3, #0
	sub	sp, sp, #4
	mov	r8, r0
	mov	sl, r1
	mov	fp, r2
	moveq	r9, r3
	beq	.L4
	mov	r9, #0
.L5:
	add	r9, r9, #1
	ldrb	r3, [r9, r8]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L5
.L4:
	ldrb	r3, [sl, #0]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r6, r3
	beq	.L8
	mov	r6, #0
.L9:
	add	r6, r6, #1
	ldrb	r3, [r6, sl]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L9
.L8:
	cmp	r9, #0
	movlt	r3, #0
	strlt	r3, [sp, #0]
	blt	.L12
	mov	r3, #0
	str	r3, [sp, #0]
	mov	r5, r8
	mvn	r7, #0
.L13:
	ldrb	r3, [r5, #0]	@ zero_extendqisi2
	cmp	r3, #0
	cmpne	r3, #32
	bne	.L14
	cmp	r6, #0
	ble	.L16
	cmp	r7, #0
	blt	.L16
	ldrb	ip, [r7, r8]	@ zero_extendqisi2
	cmp	ip, #32
	addne	lr, sl, r6
	movne	r2, r5
	movne	r1, #1
	movne	r4, #0
	addne	r0, r7, #2
	bne	.L20
	b	.L16
.L21:
	cmp	r1, r0
	beq	.L22
	ldrb	ip, [r2, #-2]	@ zero_extendqisi2
	cmp	ip, #32
	sub	r2, r2, #1
	beq	.L22
.L20:
	ldrb	r3, [lr, #-1]	@ zero_extendqisi2
	add	r1, r1, #1
	cmp	r3, ip
	addeq	r4, r4, #1
	cmp	r1, r6
	sub	lr, lr, #1
	ble	.L21
.L22:
	rsb	r3, fp, r6
	cmp	r3, r4
	ldrle	r3, [sp, #0]
	addle	r3, r3, #1
	strle	r3, [sp, #0]
.L14:
	add	r7, r7, #1
	cmp	r7, r9
	add	r5, r5, #1
	bne	.L13
.L12:
	ldr	r0, [sp, #0]
	add	sp, sp, #4
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L16:
	mov	r4, #0
	b	.L22
	.size	comp, .-comp
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"love love no a love lave live lovf thus a olive abc"
	.ascii	" 123 ikman love\000"
	.align	2
.LC1:
	.ascii	"love\000"
	.align	2
.LC2:
	.ascii	"%d \012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	r7, .L60
	mov	r2, r7
.L33:
	ldrb	r3, [r2, #1]!	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L33
	ldr	r6, .L60+4
	rsb	sl, r7, r2
	mov	r3, r6
.L35:
	ldrb	r1, [r3, #1]!	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L35
	cmp	sl, #0
	rsb	r4, r6, r3
	movlt	r9, r1
	blt	.L39
	ldr	r8, .L60
	mov	r9, r1
	mvn	r5, #0
.L40:
	ldrb	r3, [r8, #0]	@ zero_extendqisi2
	cmp	r3, #0
	cmpne	r3, #32
	bne	.L41
	cmp	r4, #0
	ble	.L43
	cmp	r5, #0
	blt	.L43
	ldrb	r0, [r8, #-1]	@ zero_extendqisi2
	cmp	r0, #32
	subne	ip, r5, #1
	movne	lr, #1
	movne	r1, #0
	bne	.L47
	b	.L43
.L48:
	cmn	ip, #1
	beq	.L49
	ldrb	r0, [ip, r7]	@ zero_extendqisi2
	cmp	r0, #32
	sub	ip, ip, #1
	beq	.L49
.L47:
	rsb	r3, lr, r4
	ldrb	r2, [r3, r6]	@ zero_extendqisi2
	add	lr, lr, #1
	cmp	r2, r0
	addeq	r1, r1, #1
	cmp	lr, r4
	ble	.L48
.L49:
	sub	r3, r4, #1
	cmp	r3, r1
	addle	r9, r9, #1
.L41:
	add	r5, r5, #1
	cmp	r5, sl
	add	r8, r8, #1
	bne	.L40
.L39:
	mov	r1, r9
	ldr	r0, .L60+8
	bl	printf
	mov	r0, #0
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L43:
	mov	r1, #0
	b	.L49
.L61:
	.align	2
.L60:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.size	main, .-main
	.ident	"GCC: (GNU) 4.1.1"

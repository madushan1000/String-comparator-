	.section .rodata
str1:
	.asciz "love love love"
find:
	.asciz "love"

format:
	.asciz "%d %d\n"
format2:
	.asciz "%d \n"
	
	.text
	.global main
main:
	sub sp,sp,#4
	str lr,[sp,#0]
	
	ldr r4,=str1
	ldr r5,=find
	mov r6,#0
for1:
	
	
	@ldr r0,=format2
	ldrb r3,[r4,#0]
	@bl printf
	add r6,r6,#1
	add r4,r4,#1
	cmp r3,#0
	bne for1
	
	ldr r4,=str1
	ldr r5,=find
	
for2:
	ldrb r3,[r5,#0]
	add r7,r7,#1
	add r5,r5,#1
	cmp r3,#0
	bne for2
	
	ldr r0,=format
	mov r1,r6
	mov r2,r7
	bl printf
	
	
	ldr lr,[sp,#0]
	add sp,sp,#4
	
	b comp
	
	ldr r0,=format2
	mov r1,r12
	bl printf
	
	mov r0,#0
	mov pc,lr

comp:
	sub sp,sp,#24
	str lr,[sp,#0]
	str r3,[sp,#4]
	str r4,[sp,#8]
	str r5,[sp,#12]
	str r6,[sp,#16]
	str r7,[sp,#20]
	
	ldr r4,=str1
	ldr r5,=find
	sub r6,r6,#1
	sub r7,r7,#1
	
for3:
	sub r6,r6,#1
	ldrb r3,[r6,#0]
	cmp r3,#' '
	beq cond
	cmp r3,#'\0'
	beq cond
	cmp r6,#0
	bne for3
	
	ldr lr,[sp,#0]
	ldr r3,[sp,#4]
	ldr r4,[sp,#8]
	ldr r5,[sp,#12]
	ldr r6,[sp,#16]
	ldr r7,[sp,#20]
	add sp,sp,#24
	
	mov r0,#0
	mov pc,lr
	
	
cond:
	sub sp,sp,#24
	str lr,[sp,#0]
	str r3,[sp,#4]
	str r4,[sp,#8]
	str r5,[sp,#12]
	str r6,[sp,#16]
	str r7,[sp,#20]
	
	mov r8,r6
	mov r9,r7
	mov r12,#0
for4:
	sub r10,r8,r9
	cmp r10,#0
	beq break
	ldrb r3,[r4,r10]
	cmp r3,#' '
	beq break
	ldrb r11,[r5,r9]
	cmp r3,r11
	beq incr
	sub r9,r9,#1
	cmp r9,#0
	bne for4
	
break:	
	ldr lr,[sp,#0]
	ldr r3,[sp,#4]
	ldr r4,[sp,#8]
	ldr r5,[sp,#12]
	ldr r6,[sp,#16]
	ldr r7,[sp,#20]
	add sp,sp,#24
	
	mov r0,#0
	mov pc,lr

incr:
	sub sp,sp,#40
	str lr,[sp,#0]
	str r3,[sp,#4]
	str r4,[sp,#8]
	str r5,[sp,#12]
	str r6,[sp,#16]
	str r7,[sp,#20]
	str r8,[sp,#24]
	str r9,[sp,#28]
	str r10,[sp,#32]
	str r11,[sp,#36]
	
	add r12,r12,#1
	ldr r0,=format2
	mov r1,r12
	bl printf
	
	ldr lr,[sp,#0]
	ldr r3,[sp,#4]
	ldr r4,[sp,#8]
	ldr r5,[sp,#12]
	ldr r6,[sp,#16]
	ldr r7,[sp,#20]
	ldr r8,[sp,#24]
	ldr r9,[sp,#28]
	ldr r10,[sp,#32]
	ldr r11,[sp,#36]
	
	add sp,sp,#40
	mov r0,#0
	mov pc,lr

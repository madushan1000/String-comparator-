	.section .rodata
str1:
	.asciz "love love love"
find:
	.asciz "love"

format:
	.asciz "%d %d\n"
format2:
	.asciz "%c \n"
	
	.text
	.global main
main:
	sub sp,sp,#4
	str lr,[sp,#0]
	
	ldr r4,=str1
	ldr r5,=find
	mov r6,#0
for1:
		ldrb r3,[r4,#0]
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
	bl comp
	ldr lr,[sp,#0]
	add sp,sp,#4
	mov r0,#0
	mov pc,lr

comp:
	sub sp,sp,#4
	str lr,[sp,#0]
	ldr r4,=str1
	ldr r5,=find
	mov r8,r4
for3:
		ldrb r3,[r8,#0]
		add r8,r8,#1
		cmp r3,#' '
		beq oeq
		cmp r3,#0
		beq oeq
		bne for3
		bl exit
oeq:
		
exit:
	ldr lr,[sp,#0]
	add sp,sp,#4
	mov r0,#0
	mov pc,lr

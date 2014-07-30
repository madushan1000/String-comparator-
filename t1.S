	.section .rodata
format:
	.asciz "%d \n"
	.text
	.global main
main:
	sub sp,sp,#4
	str lr,[sp,#0]
	
	b comp
	
	ldr lr,[sp,#0]
	add sp,sp,#4
	
	mov r0,#0
	mov pc,lr

comp:
	sub sp,sp,#4
	str lr,[sp,#0]
	ldr r0,=format
	mov r1,#4
	bl printf
	
	ldr lr,[sp,#0]
	add sp,sp,#4
	
	mov r0,#0
	mov pc,lr

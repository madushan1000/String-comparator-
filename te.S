	.section .rodata
str1:
	.asciz "chimb chyme crime grime prime slime" 	@input string
find:
	.asciz "clime" 					@search string

fmt:
	.asciz "%d \n" 					@output format string
	
	.text
	.global main
main:
	sub sp,sp,#4
	str lr,[sp,#0]
	ldr r3,=str1 					@loading input string from memory
	ldr r4,=find 					@loading search string from memory
	mov r2,#2						@number of characters can be missed, "flag"
	mov r12,#0
lens:
	ldrb r5,[r3,r12] 				@load input string bitwice
	add r12,r12,#1 					@counting characters
	cmp r5,#0 						@checking for termination char
	bne lens 						@looping
	
	sub r12,r12,#1
	mov r6,r12 						@moving input string length to r6
	mov r12,#0 
	
lenf:
	ldrb r5,[r4,r12] 				@load search string biwice
	add r12,r12,#1 					@counting characters
	cmp r5,#0 						@checking for termination char
	bne lenf 						@looping
	
	sub r12,r12,#1
	mov r7,r12 						@moving search string length to r7
	mov r12,#0 
	
	ldr lr,[sp,#0]
	b comp 							@calling function comp()
	ldr lr,[sp,#0]
	add sp,sp,#4
	
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
	
	ldr r3,=str1					@loading input string from memory
	ldr r4,=find 					@loading search string from memory
	sub r8,r6,r7 
	add r8,r8,#1 					@computing input string length - search string length + 1
	mov r9,#0 						@i
	mov r0,#0 						@number of matched words
foro:
		mov r10,#0 					@j
		mov r11,#0 					@number of mistakes
	fori:
			add r1,r10,r9 			@i+j
			ldrb r5,[r3,r1] 		@load input string[i+j] bitwice
			ldrb r12,[r4,r10] 		@load search string[j] bitwice
			cmp r5,r12 				@compairing
			bne one 				@go to "one" if not matched
			beq skip 				@goto skip unless
one:
				add r11,r11,#1 		@number of mistakes += 1
skip:
			add r10,r10,#1 			@j+=1
			cmp r10,r7 				@check if the search string is end
			bne fori 				@unless loop
		cmp r11,r2 					@compair the number of mistakes with number of allowed mistakes 
		bls last 					@if less goto last
		beq last 					@if equal go to last
		bhi skip2 					@else go to skip2
last:
			add r0,r0,#1 			@number of matched words +=1
skip2:
		add r9,r9,#1 				@i+=1
		cmp r8,r9 					@check if the input string is end
		bne foro 					@unless loop
		mov r12,r0 					@move r12 to r0
	
	ldr r0,=fmt 					@load format string from memory
	mov r1,r12 						@moving r12 to r0
	bl printf 						@printing the result
	
	ldr lr,[sp,#0]
	ldr r3,[sp,#4]
	ldr r4,[sp,#8]
	ldr r5,[sp,#12]
	ldr r6,[sp,#16]
	ldr r7,[sp,#20]
	add sp,sp,#24
	mov r0,#0
	mov pc,lr

	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, lr}
	
	mov r1, #-1	@previous
	mov r2, #1	@result
	mov r3, #0	@sum
	mov r4, #0	@counter
	
.LS:
	cmp r4, r0
	bgt .LE
	add r3, r1, r2
	mov r1, r2
	mov r2, r3
	add r4, r4, #1
	b .LS

	pop {r3, r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION
.LE:
	mov r0, r2
	pop {r3, r4, r5, pc}		@EPILOG

	.size fibonacci, .-fibonacci
	.end

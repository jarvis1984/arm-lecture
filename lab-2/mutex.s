	.syntax unified
	.arch armv7-a
	.text

	.equ locked, 1
	.equ unlocked, 0

	.global lock_mutex
	.type lock_mutex, function
lock_mutex:
        @ INSERT CODE BELOW
	mov r1, locked
.CMP:
	ldrex r2, [r0]
	cmp r1, r2
	beq .WAIT
	strex r2, r1, [r0]
	cmp r2, #1	@strex return 1 if not successful
	beq .WAIT
	dmb			@make sure the memory access above is visible
        @ END CODE INSERT
	bx lr
.WAIT:
	b .CMP

	.size lock_mutex, .-lock_mutex

	.global unlock_mutex
	.type unlock_mutex, function
unlock_mutex:
		@ INSERT CODE BELOW
	mov r1, unlocked
	dmb			@make sure all access before is done
	str r1, [r0]
        @ END CODE INSERT
	bx lr
	.size unlock_mutex, .-unlock_mutex

	.end

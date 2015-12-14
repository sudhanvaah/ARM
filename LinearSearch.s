.text
start:
mov r1,#9	;size of array
mov r5,#0	;position counter
mov r3,#9	;key
ldr r0,=arr ;address of array
loop:
ldrb r4,[r0],#1 ;similar to r4=[r0++] in C
cmp r4,r3
mov r2,r3 		;copy key to R2.
beq end
add r5,r5,#1
cmp r0,r2
bne loop
ldr r0,=not
swi 0x02
b over
end:
ldr r0,=found
swi 0x02
over:
.data
arr: .byte 1,2,3,4,5,6,8,7,9
found: .asciz "Element found. (Key in R2 and array index in R5.)"
not: .asciz "Element not found."
.end

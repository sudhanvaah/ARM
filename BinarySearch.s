.text
start:
ldr r10,=a
mov r1,#0
mov r2,#9
mov r3,#10
loop:
       cmp r1,r2
       ldrge r0,=not_found
       swige 0x02;display string on console which is present in r0
       swige 0x11;halt execution
       mov r4,r1
       add r4,r4,r2
       mov r4,r4,LSR#1
       ldrb r5,[r10,r4]
       cmp  r3,r5
       ldreq r0,=found
       swieq 0X02
       swieq 0x11
       add r6,r4,#1
       movgt r1,r6
       movlt r2,r4
       b loop
.data
a:.byte 1,2,3,4,5,6,7,8,10
found:.asciz "Element found. (Key in R3 and array index in R4.)"
not_found:.asciz"Element not found."
.end

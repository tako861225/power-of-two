# This example shows an implementation of the mathematical

.data
argument: .word   2
str1:     .string "ture"
str2:     .string "false"
.text
# t2 = 1 
# a1 = result 
main:
        lw  a0, argument   # Load argument from static data
        addi sp, sp, -4
        sw   a0 ,0(sp)
        addi t2, t2, 1    # t2 = 1
        jal ra, loop       # Jump-and-link to the 'loop' label
        lw  a0,0(sp)
        addi sp,sp, 4
        jal ra, print
        # Exit program
        li a7, 10
        ecall
   
loop:
        beq  a0, t2, true # if n==1 return true  
        andi t3, a0, 1    # t3 = n % 2
        bne  t3, zero, false # if t3!= 0 return false
        srli a0, a0, 1        # shift right 
        bne  a0, zero, loop   # while(n)
        beq  a0, zero, false    #if n = 0 return false 
true:
        addi  a1, a1 , 1             # result
        ret
false:
        addi  a1, a1 , 0
        ret
print:
        mv t0, a0  #t0 = n
        mv a0,t0
        li a7,1
        ecall
        mv t1, a1       #result
        beq t1, zero, pf
        la a0,str1
        li a7,4 
        ecall
        ret
pf:
        la a0,str2
        li a7,4 
        ecall
        ret
        
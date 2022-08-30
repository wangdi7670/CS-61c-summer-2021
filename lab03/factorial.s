.globl factorial

# 3! = 6, 7! = 5040, 8! = 40320
.data
n: .word 8

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit


# int fact (int n)
# {
## if (n <= 1) return (1);
## else return (n * fact(n −1));
# }
factorial:
    # YOUR CODE HERE
    addi sp, sp, -8
    sw a0, 0(sp)
    sw ra, 4(sp)

    addi t0, a0, -1
    bgt t0, x0, L1 # if n - 1 > 0 then go to L1

    addi a0, x0, 1
    addi sp, sp, 8
    jalr x0, ra, 0

L1:
    addi a0, a0, -1  # n = n - 1
    jal ra, factorial    

    addi, t1, a0, 0  # t1 = a0 = return-value

    lw a0, 0(sp)
    lw ra, 4(sp)
    addi sp, sp, 8

    mul a0, a0, t1
    jalr x0, ra, 0
// This file is part of www.nand2tetris.org
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.

    // Initialize R2 = 0
    @R2
    M=0

    // Initialize counter = R1
    @R1
    D=M
    @counter
    M=D

(LOOP)
    // Check if counter == 0
    @counter
    D=M
    @END
    D;JEQ

    // R2 = R2 + R0
    @R0
    D=M
    @R2
    M=D+M

    // counter = counter - 1
    @counter
    M=M-1

    // Repeat loop
    @LOOP
    0;JMP

(END)
    // Infinite loop
    @END
    0;JMP

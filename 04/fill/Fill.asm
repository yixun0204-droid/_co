// This file is part of www.nand2tetris.org
// File name: projects/04/Fill.asm

// Listen to keyboard input continuously.
// If a key is pressed, fill the screen with black.
// If no key is pressed, clear the screen with white.

(START)
    // Check keyboard input
    @KBD
    D=M

    // If a key is pressed, jump to BLACK
    @BLACK
    D;JGT

    // Otherwise, jump to WHITE
    @WHITE
    0;JMP


(BLACK)
    // Set color to black (-1)
    @color
    M=-1
    @DRAW
    0;JMP


(WHITE)
    // Set color to white (0)
    @color
    M=0


(DRAW)
    // Screen starts at RAM[16384]
    @SCREEN
    D=A
    @address
    M=D

(LOOP)
    // Write color to screen
    @color
    D=M
    @address
    A=M
    M=D

    // Move to next screen word
    @address
    M=M+1

    // Check if screen is finished
    @KBD
    D=A
    @address
    D=M-D

    // If address < KBD, continue drawing
    @LOOP
    D;JLT

    // Check keyboard again
    @START
    0;JMP

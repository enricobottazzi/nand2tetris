// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

(LOOP1)
    @24576
    D=A
    @max
    M=D

    @16384
    D=A
    @i
    M=D

    // Wait for a key press
    @KBD
    D=M
    @SETWHITE
    D;JEQ // If no key is pressed, go to SETWHITE

    // Set the screen to black

    (LOOP3)
        @i
        D=M
        @max
        D=D-M
        @LOOP1
        D;JEQ // If i = max, go to LOOP1

        // Else set the screen to black
        @i 
        A=M
        M=-1

        // Increment i
        @i
        M=M+1

        @LOOP3
        0;JMP


(SETWHITE)
    (LOOP2)
        @i
        D=M
        @max
        D=D-M
        @LOOP1
        D;JEQ // If i = max, go to LOOP1

        // Else set the screen to white
        @i 
        A=M
        M=0

        // Increment i
        @i
        M=M+1

        @LOOP2
        0;JMP

    





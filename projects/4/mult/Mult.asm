// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

   @i // init i = 0
   M=0

   @sum // init sum = 0
   M=0

   (LOOP)
   @i
   D=M 
   @R1
   D=D-M // R1 - i
   @ASSIGN
   D;JEQ // if i == R1, goto ASSIGN
   
   // else assign sum += R0
   @R0
   D=M
   @sum // load sum
   M=M+D // sum = sum + R0

   // increment i
   @i
   M=M+1

   @LOOP
   0;JMP // goto LOOP

   (ASSIGN)
   @sum 
   D=M
   @R2
   M=D // R2 = sum

   // GO TO END
   @END
   0;JMP

   (END)
   @END
   0;JMP // infinite loop


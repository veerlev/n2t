// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

	@R2 //Set R2 to 0
	M=0

	@R1 //if (R1==0) goto END
	D=M
	@END
	D;JEQ

	@R0 //if (R0 == 0) goto END
	D=M  
	@END
	D;JEQ

	@i //i=R0
	M=D 

	(LOOP)
		@i //if (i == 0) goto END
		D=M
		@END
		D;JEQ

		@R1 //R2 += R1
		D=M
		@R2
		M = M+D
		@i   //i--
		M=M-1
		
		@LOOP
               	0;JMP
	(END)
	@END
	0;JMP

// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

	@formerKey
	M=0   
	
	(LISTEN)
	@KBD
	D=M
	@currentKey
	M=D
	
	@formerKey
	D=D-M
	@LISTEN
	D;JEQ

	
	@KBD
	D=M

	@BLACKEN
	D;JNE

	@WHITEN
	D;JEQ

	(BLACKEN)
	@fillValue
	M=-1
	@FILL
	0;JMP

	(WHITEN)
	@fillValue
	M=0
	@FILL
	0;JMP

	(FILL)
	@i
	M=0
	@KBD
	D=A
	@end
	M=D
	
	
	(LOOP)
		@SCREEN
		D=A
		@i
		D=D+M
		@end
		D=M-D
		@UPDATE
		D;JEQ

		@SCREEN
		D=A
		@i
		D=D+M
		@currentPosition
		M=D
		@fillValue
		D=M
		@currentPosition
		A=M
		M=D
		@i
		M=M+1
	
	
		@LOOP
		0;JMP
	
	(UPDATE)
	@currentKey
	D=M
	@formerKey
	M=D
	@LISTEN
	0;JMP

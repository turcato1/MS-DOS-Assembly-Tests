; AUTHOR: THIAGO TURCATO DO REGO <turcato1@uol.com.br>
; Assembly program designed for x86 machines under MS-DOS Operating System
; Program tested using DEBUG.EXE

; Subject: Test program to print numbers from 9 to 0

	MOV BX,39	; Load 39h (ASCII code for '9')
	MOV DX,200	; Load 200h in DX as text location pointer for INT 20, with AH = 09 for printing until '$' is found
	MOV AL,20	; Load 20h in AL (ASCII code for ' ') for writing in address 201
	MOV [201],AL	
	MOV AL,24	; Load 24h in AL (ASCII code for '$') for writing in address 201 as text terminator
	MOV [202],AL
	MOV AX,00	; Clears AX
	MOV AH,09	; Load AH with 09h as printing function when calling INT 20 (DOS interrupt)

LOOP:	MOV [200],BX	; Load BX coded char in printing position in memory
	MOV CX,BX	; Uses CX for determining the end of loop
	SUB CX,30	; Checking for loop end later with JCXZ instruction
	INT 21		; Prints the char in memory 200h
	JCXZ "END"	; If char '0' reached, ends the program execution 
	DEC BX		; Go to next char
	JMP "LOOP"	; Loops until the last char
END:	INT 20		; Tells DOS to terminate the program execution

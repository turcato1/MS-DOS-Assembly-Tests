; AUTHOR: THIAGO TURCATO DO REGO <turcato1@uol.com.br>
; Assembly program designed for x86 machines under MS-DOS Operating System

; Subject: Test program to create a new file "NEW.TXT"
; Program tested using DEBUG.EXE

	MOV BX,0200	; Writes the file name from address 200h
	MOV AL,4E	; 'N' = 4Eh
	CALL WSEQ
	MOV AL,45	; 'E' = 45h
	CALL WSEQ
	MOV AL,57	; 'W' = 57h
	CALL WSEQ
	MOV AL,2E	; '.' = 2Eh
	CALL WSEQ
	MOV AL,54	; 'T' = 54h
	CALL WSEQ
	MOV AL,4E	; 'X' = 58h
	CALL WSEQ
	MOV AL,54	; 'T' = 54h
	CALL WSEQ
	MOV AL,00	; <NULL> = 00h
	CALL WSEQ
	MOV AX,0	; Reinitializes AX register for safety
	NOP		; Separator for file creation program execution
	MOV CX,0020	; Defines file atribute as "archive"
	MOV DX,0200	; Pointer for the file name
	MOV AH,3C	; Defines INT 20 mode for file creation
	INT 21		; Executes the file creation
	INT 20		; Tells DOS to terminate the program execution 
	
WSEQ: 	MOV [BX],AL	; Subroutine to write the file name from address 200h
	INC BX
	RET
nl macro                    ; макрос перевода строки
	push AX
	push DX
	mov AH, 2
	mov DL, 10
	int 21h
	mov DL, 13
	int 21h
	pop DX
	pop AX
endm
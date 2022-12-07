prnstr macro string         ; макрос печати строки
	push AX
	push DX
	mov AH, 9
	mov DX, offset string
	int 21h
	pop DX
	pop AX
endm
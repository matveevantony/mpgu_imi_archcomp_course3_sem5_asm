.MODEL SMALL				; код вмещается в один сегмент памяти
.STACK 100h					; на выполнение программы выделяется 256 бит

nl macro 					; макрос перевода строки
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

stars macro 				; макрос печатает 10 звездочек с новой строки
	local p
	push AX
	push DX
	push CX
	nl 						; вложенный макрос
	mov CX, 10
	mov AH, 2
	mov DL, '*'
	p:
		int 21h
	loop p
	pop CX
	pop DX
	pop AX
endm

.CODE						; сегмент кода
begin:						; метка входа в программу
	; вызов макросов
	stars
	stars
	stars

	; выход из программы
	mov AX, 4C00h
	int 21h
END begin					; завершение программы
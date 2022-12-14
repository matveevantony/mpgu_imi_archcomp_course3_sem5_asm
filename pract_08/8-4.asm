.MODEL SMALL				; код вмещается в один сегмент памяти
.STACK 100h					; на выполнение программы выделяется 256 бит

;-------------------------------------
; макрос складывает два числа размером
; один байт (результат в AL)
;-------------------------------------
m_add1 macro a, b
	mov AL, a
	add AL, b
endm

;-------------------------------------
; макрос складывает два числа размером
; один байт (результат
; передается через аргумент)
;-------------------------------------
m_add2 macro a, b, c
	push AX
	mov AL, a
	add AL, b
	mov c, AL
	pop AX
endm

.DATA						; сегмент данных
	a1 db 5
	a2 db 6
	s db 0

.CODE						; сегмент кода
begin:						; метка входа в программу
	; запись адреса сегмента данных
	mov AX, @DATA
	mov DS, AX

	m_add1 a1, a2			; 5 + 6 в AL

	m_add2 3, 4, s			; 3 + 4 в s
	mov BL, s

	; выход из программы
	mov AX, 4C00h
	int 21h
END begin					; завершение программы
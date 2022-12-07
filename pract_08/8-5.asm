; подключение файлов макросов
include 8-5-lm.inc

.MODEL SMALL				; код вмещается в один сегмент памяти
.STACK 100h					; на выполнение программы выделяется 256 бит

.DATA						; сегмент данных
	a db 9
	b db -2
	sum db 0
    dif db 0
    mult dw 0
    imult dw 0
    divi db 0
    idivi db 0

.CODE						; сегмент кода
begin:						; метка входа в программу
	; запись адреса сегмента данных
	mov AX, @DATA
	mov DS, AX

    libadd a, b             ; сложение a и b (результат в AL)
    mov sum, AL

    libsub a, b             ; вычетание из a b (результат в AL)
    mov dif, AL

    libmul a, b             ; произведение a и b (без знака) (результат в AX)
    mov mult, AX

    libimul a, b            ; произведение a и b (со знаком) (результат в AX)
    mov imult, AX

    ; запись значения a в двухбайтовый регистр
    mov CX, 0
    mov CL, a
    libdiv CX, b             ; частное a и b (беззнаковое деление с остатком) (результат в AL)
    mov divi, AL

    libidiv CX, b            ; частное a и b (знаковое деление с остатком) (результат в AL)
    mov idivi, AL

	; выход из программы
	mov AX, 4C00h
	int 21h
END begin					; завершение программы
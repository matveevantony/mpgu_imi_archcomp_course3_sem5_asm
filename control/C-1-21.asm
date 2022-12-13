.MODEL SMALL				; код вмещается в один сегмент памяти
.STACK 100h					; на выполнение программы выделяется 256 бит

.CODE						; сегмент кода
begin:                      ; метка входа в программу
    ; ввод символа с клавиатуры
    mov AH, 1h
    int 21h
    push AX

    ; перенос строки
    mov AH, 2h
    mov DX, 10
    int 21h
    mov DX, 13
    int 21h

    ; вывод 10 символов на экран
    mov CX, 10
    pop DX
    repeat:
        int 21h
        inc DX
    loop repeat

    ; выход из программы
	mov AX, 4C00h
	int 21h
END begin                   ; завершение программы
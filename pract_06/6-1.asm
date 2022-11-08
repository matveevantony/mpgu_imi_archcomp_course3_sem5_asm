.MODEL SMALL                ; код вмещается в один сегмент памяти
.STACK 100h                 ; на выполнение программы выделяется 256 бит
.DATA                       ; сегмент данных
    buf db 15 dup ('*'), '$'; строка из 15 звездочек
.CODE                       ; сегмент кода
begin:                      ; метка входа в программу
    ; запись адреса сегмента данных
    mov AX, @data
    mov DS, AX

    mov CX, 15              ; количество повторений цикла
    mov SI, 0               ; заполнение индексного регистра

    ; копирование вводимых символов в строку buf
    mov AH, 1h
    repeat:
        int 21h
        mov buf[SI], AL
        inc SI
    loop repeat

    ; перенос строки
    mov AH, 2h
    mov DX, 10
    int 21h
    mov DX, 13
    int 21h

    ; вывод строки
    mov AH, 9h
    mov DX, offset buf
    int 21h

    ; выход из программы
    mov AX, 4C00h
    int 21h
END begin                   ; завершение программы
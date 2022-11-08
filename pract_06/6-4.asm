.MODEL SMALL                ; код вмещается в один сегмент памяти
.STACK 100h                 ; на выполнение программы выделяется 256 бит
.DATA                       ; сегмент данных
    buf db 12 dup ('*'), '$'; строка из 12 звездочек
.CODE                       ; сегмент кода
begin:                      ; метка входа в программу
    ; запись адреса сегмента данных
    mov AX, @data
    mov DS, AX

    mov CX, 12              ; количество повторений цикла
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

    ; вывод строки в обратном порядке
    mov CX, 12
    mov SI, 11
    output:
        mov DX, offset buf[SI]
        int 21h
        dec SI
    loop output

    ; выход из программы
    mov AX, 4C00h
    int 21h
END begin                   ; завершение программы
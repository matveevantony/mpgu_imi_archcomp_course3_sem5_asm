.MODEL SMALL                ; код вмещается в один сегмент памяти
.STACK 100h                 ; на выполнение программы выделяется 256 бит

.CODE                       ; сегмент кода
begin:                      ; метка входа в программу
    mov AH, 2h              ; вывод символа доллара в консоль (командой 2h)
    mov DL, '$'
    int 21h

    mov AX, 4C00h           ; выход из программы
    int 21h
END begin                   ; завершение программы
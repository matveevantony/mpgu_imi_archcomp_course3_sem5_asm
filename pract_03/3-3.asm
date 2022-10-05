.MODEL SMALL                ; код вмещается в один сегмент памяти
.STACK 100h                 ; на выполнение программы выделяется 256 бит
.DATA                       ; сегмент данных
    ADR db 'M:\pract_03\msg.txt', 0
    READ db 40 dup (?), '$'
.CODE                       ; сегмент кода
    begin:                  ; метка входа в программу
    ; запись адреса сегмента данных
    mov DX, @DATA
    mov DS, DX
    
    ; открытие файла
    mov AH, 3Dh
    mov DX, offset ADR
    mov AL, 0
    mov CL, 0
    int 21h
    
    ; чтение файла
    mov BX, AX
    mov AH, 3Fh
    mov CX, 40
    mov DX, offset READ
    int 21h

    ; вывод прочитанного сообщения в консоль
    mov AH, 9h
    mov DX, offset READ
    int 21h

    ; закрытие файла:
    mov AH, 3Eh
    int 21h
    
    ; выход:
    mov AX, 4C00h
    int 21h
END begin                   ; завершение программы
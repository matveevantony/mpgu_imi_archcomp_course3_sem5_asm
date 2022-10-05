.MODEL SMALL                ; код вмещается в один сегмент памяти
.STACK 100h                 ; на выполнение программы выделяется 256 бит
.DATA                       ; сегмент данных
    ADR db 'M:\pract_03\new.txt', 0
    TXT db 'Hello!', 10, 'You are beautiful <3'
.CODE                       ; сегмент кода
    begin:                  ; метка входа в программу
    ; запись адреса сегмента данных
    mov DX, @DATA
    mov DS, DX
    
    ; создание файла
    mov AH, 5Bh
    mov DX, offset ADR
    mov CX, 0
    int 21h

    ; запись текста в файл
    mov BX, AX
    mov AH, 40h
    mov CX, 27
    mov DX, offset TXT
    int 21h

    ; закрытие файла:
    mov AH, 3Eh
    int 21h
    
    ; выход:
    mov AX, 4C00h
    int 21h
END begin                   ; завершение программы

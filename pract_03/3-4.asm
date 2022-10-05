.MODEL SMALL                ; код вмещается в один сегмент памяти
.STACK 100h                 ; на выполнение программы выделяется 256 бит
.DATA                       ; сегмент данных
    ADR db 'M:\pract_03\new.txt', 0
.CODE                       ; сегмент кода
    begin:                  ; метка входа в программу
    ; запись адреса сегмента данных
    mov DX, @DATA
    mov DS, DX
    
    ; удаление файла
    mov AH, 41h
    mov DX, offset ADR
    int 21h
    
    ; выход:
    mov AX, 4C00h
    int 21h
END begin                   ; завершение программы
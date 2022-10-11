.MODEL SMALL                ; код вмещается в один сегмент памяти
.STACK 100h                 ; на выполнение программы выделяется 256 бит
.DATA                       ; сегмент данных
    ADR db 'M:\pract_03\new.txt', 0
    MSG_OK db 'Success, file was deleted!$'
    MSG_ERR db 'ERROR! File was NOT deleted!$'
.CODE                       ; сегмент кода
    begin:                  ; метка входа в программу
    ; запись адреса сегмента данных
    mov DX, @DATA
    mov DS, DX
    
    ; удаление файла
    mov AH, 41h
    mov DX, offset ADR
    int 21h
    
    ; проверка на наличие ошибки и вывод соответствующего сообщения
    jc error_signal

    ; сообщение об успешном удалении файла
    mov AH, 9h
    mov DX, offset MSG_OK
    int 21h
    jmp exit

    ; сообщение об ошибке при удалении файла
    error_signal:
        mov AH, 9h
        mov DX, offset MSG_ERR
        int 21h

    ; выход:
    exit:
        mov AX, 4C00h
        int 21h
END begin                   ; завершение программы
.MODEL SMALL                ; код вмещается в один сегмент памяти
.STACK 100h                 ; на выполнение программы выделяется 256 бит
.DATA                       ; сегмент данных
    ADR db 'M:\pract_03\new.txt', 0
    MSG_OK db 'Success, file was deleted!$'
    MSG_ERR db 'ERROR! File was NOT deleted!$'
    MSG_ERR2 db 'ERROR! File was not found!$'
    MSG_ERR3 db 'ERROR! Folder was not found!$'
    MSG_ERR5 db 'ERROR! Access denied!'
.CODE                       ; сегмент кода
    begin:                  ; метка входа в программу
    ; запись адреса сегмента данных
    mov DX, @DATA
    mov DS, DX
    
    ; удаление файла
    mov AH, 41h
    mov DX, offset ADR
    int 21h
    
    ; проверка на наличие ошибки и её тип и вывод соответствующего сообщения
    jc error_signal

    ; сообщение об успешном удалении файла
    mov DX, offset MSG_OK
    jmp print_exit

    ; выбор сообщения об ошибке при удалении файла
    error_signal:
        cmp AX, 2
        je error_signal2

        cmp AX, 3
        je error_signal3

        cmp AX, 5
        je error_signal5

        ; сообщение при неизвестной ошибке
        mov DX, offset MSG_ERR
        jmp print_exit

    error_signal2:          ; сообщение об ошибке "файл не найден"
        mov DX, offset MSG_ERR2
        jmp print_exit

    error_signal3:          ; сообщение об ошибке "путь не найден"
        mov DX, offset MSG_ERR3
        jmp print_exit

    error_signal5:          ; сообщение об ошибке "доступ запрещён"
        mov DX, offset MSG_ERR5

    ; вывод сообщения на экран и выход:
    print_exit:
        mov AH, 9h
        int 21h

        mov AX, 4C00h
        int 21h
END begin                   ; завершение программы
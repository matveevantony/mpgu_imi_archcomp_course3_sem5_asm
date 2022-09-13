.MODEL SMALL                ; код вмещается в один сегмент памяти
.STACK 100h                 ; на выполнение программы выделяется 256 бит

.DATA                       ; сегмент данных
    MSG1 db 'Hello, world!$'; первая строка
    MSG2 db 'How are you?$' ; вторая строка
    NXTLN db 10, 13, '$'    ; перенос строки

.CODE                       ; сегмент кода
begin:                      ; метка входа в программу
    ; запись адреса сегмента данных
    mov AX, @data
    mov DS, AX
	
    ; вывод сообщений в консоль
    mov AH, 9h
    mov DX, offset MSG1
    int 21h
    mov DX, offset NXTLN
    int 21h
    mov DX, offset MSG2
    int 21h

    mov AX, 4C00h           ; выход из программы
    int 21h
END begin                   ; завершение программы
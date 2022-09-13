.MODEL SMALL                ; код вмещается в один сегмент памяти
.STACK 100h                 ; на выполнение программы выделяется 256 бит

.DATA                       ; сегмент данных
    MSG db 'Hello, World!$' ; db - define byte, dw - define word (2 byte), dd - double word (4 byte), dq - quad word (8 byte)

.CODE                       ; сегмент кода (все команды указываются в нём)
begin:                      ; метка входа в программу
    mov AX, @data           ; запись адреса сегмента данных
    mov DS, AX
	
    mov AH, 9h              ; вывод сообщения в консоль
    mov DX, offset MSG
    int 21h
	
    mov AX, 4C00h           ; выход из программы
    int 21h
END begin                   ; команда завершения программы (END в программе должен быть ровно один)

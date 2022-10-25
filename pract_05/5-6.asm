.MODEL SMALL                ; код вмещается в один сегмент памяти
.STACK 100h                 ; на выполнение программы выделяется 256 бит
.DATA
    MSG db 'Data BIOS:', 10, 13, '$'
    MTH db ' jan 19$'
.CODE                       ; сегмент кода
begin:                      ; метка входа в программу
    ; запись адреса сегмента данных
    mov AX, @data
    mov DS, AX

    ; вывод сообщения в консоль
    mov AH, 9h
    mov DX, offset MSG
    int 21h

    ; получение доступа к памяти ПЗУ
    mov AX, 0F000h          ; запись сегментного адреса ПЗУ
    mov DS, AX              ; помещение сегментного адреса ПЗУ в адрес сегмента данных

    ; вывод информации в консоль
    mov AH, 40h             ; задание функции вывода информации
    mov BX, 1               ; консольный вывод
    mov CX, 2               ; длина выводимой информации (байт)
    mov DX, 0FFF5h          ; смещение
    int 21h                 ; вызов прерывания
    
    ; вывод текстовой вставки
    push DS
    mov AX, @data
    mov DS, AX
    mov AH, 9h
    mov DX, offset MTH
    int 21h

    ; вывод оставшейся информации
    pop DS
    mov AH, 40h
    mov DX, 0FFFBh
    int 21h

    ; выход из программы
    mov AX, 4C00h           
    int 21h
END begin                   ; завершение программы
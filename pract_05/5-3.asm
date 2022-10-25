.MODEL SMALL                ; код вмещается в один сегмент памяти
.STACK 100h                 ; на выполнение программы выделяется 256 бит

.CODE                       ; сегмент кода
begin:                      ; метка входа в программу
    ; получение доступа к памяти ПЗУ
    mov AX, 0F000h          ; запись сегментного адреса ПЗУ
    mov DS, AX              ; помещение сегментного адреса ПЗУ в адрес сегмента данных

    ; вывод информации в консоль
    mov AH, 40h             ; задание функции вывода информации
    mov BX, 1               ; консольный вывод
    mov CX, 2               ; длина выводимой информации (байт)
    mov DX, 0FFF5h          ; смещение
    int 21h                 ; вызов прерывания
    mov AH, 40h             ; задание функции вывода информации
    mov CX, 3               ; длина выводимой информации (байт)
    mov DX, 0FFFAh          ; смещение
    int 21h                 ; вызов прерывания

    ; выход из программы
    mov AX, 4C00h           
    int 21h
END begin                   ; завершение программы
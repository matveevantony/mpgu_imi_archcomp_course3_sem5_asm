.MODEL SMALL                ; код вмещается в один сегмент памяти
.STACK 100h                 ; на выполнение программы выделяется 256 бит
.DATA                       ; сегмент данных
    ; стороны треугольника
    a db 230
    b db 249
    c db 250
    p dw 0                  ; место для хранения результата вычисления периметра
.CODE                       ; сегмент кода
begin:                      ; метка входа в программу
    ; запись адреса сегмента данных
    mov AX, @data
    mov DS, AX

    ; запись значения переменной a в регистр
    mov AH, 0
    mov AL, a

    ; запись значения переменной b в регистр
    mov BH, 0
    mov BL, b

    add AX, BX              ; сложение a и b (результат в AX)

    ; запись значения переменной c в регистр
    mov BL, c

    add AX, BX              ; сложение предыдущей суммы и c (результат в AX)

    mov p, AX               ; запись результата в память

    ; выход из программы
    mov AX, 4C00h
    int 21h
END begin                   ; завершение программы
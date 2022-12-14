.MODEL SMALL                ; код вмещается в один сегмент памяти
.STACK 100h                 ; на выполнение программы выделяется 256 бит
.CODE                       ; сегмент кода
    begin:                  ; метка входа в программу
    ; установим графический видеорежим
    mov AH, 0h              ; функция установки видеорежима
    mov AL, 12h             ; графический режим 16 цветов
    int 10h                 ; вызов BIOS

    ; выведем на экран вертикальную линию
    mov AH, 0Ch             ; функция вывода пиксела
    mov AL, 10              ; зеленый цвет
    mov BH, 0               ; видеостраница
    mov CX, 10              ; начальная x-координата
    mov DX, 20              ; начальная y-координата
    p_y: int 10h            ; вызов BIOS
    inc DX                  ; инкремент по y
    cmp DX, 461             ; дошли до границы по Y?
    jne p_y                 ; нет, повторяем вывод точек

    ; выведем на экран вертикальную линию
    mov AH, 0Ch             ; функция вывода пиксела
    mov AL, 14              ; желтый цвет
    mov BH, 0               ; видеостраница
    mov CX, 470             ; начальная x-координата
    mov DX, 20              ; начальная y-координата
    p_y2: int 10h           ; вызов BIOS
    inc DX                  ; инкремент по y
    cmp DX, 461             ; дошли до границы по Y?
    jne p_y2                ; нет, повторяем вывод точек

    ; выведем на экран горизонтальную линию
    mov AH, 0Ch             ; функция вывода пиксела
    mov AL, 13              ; розовый цвет
    mov BH, 0               ; видеостраница
    mov CX, 20              ; начальная x-координата
    mov DX, 10              ; начальная y-координата
    p_x: int 10h            ; вызов BIOS
    inc CX                  ; инкремент по x
    cmp CX, 461             ; дошли до границы по X?
    jne p_x                 ; нет, повторяем вывод точек

    ; выведем на экран горизонтальную линию
    mov AH, 0Ch             ; функция вывода пиксела
    mov AL, 12              ; красный цвет
    mov BH, 0               ; видеостраница
    mov CX, 20              ; начальная x-координата
    mov DX, 470             ; начальная y-координата
    p_x2: int 10h           ; вызов BIOS
    inc CX                  ; инкремент по x
    cmp CX, 461             ; дошли до границы по X?
    jne p_x2                ; нет, повторяем вывод точек

    ; выведем на экран диагональную линию
    mov AH, 0Ch             ; функция вывода пиксела
    mov AL, 11              ; циановый цвет
    mov BH, 0               ; видеостраница
    mov CX, 15              ; начальная x-координата
    mov DX, 465             ; начальная y-координата
    p_xy: int 10h           ; вызов BIOS
    inc CX                  ; инкремент по x
    dec DX                  ; инкремент по y
    cmp DX, 14              ; дошли до границы по Y?
    jne p_xy                ; нет, повторяем вывод точек

    ; выведем на экран диагональную линию
    mov AH, 0Ch             ; функция вывода пиксела
    mov AL, 9               ; голубой цвет
    mov BH, 0               ; видеостраница
    mov CX, 15              ; начальная x-координата
    mov DX, 15              ; начальная y-координата
    p_xy1: int 10h          ; вызов BIOS
    inc CX                  ; инкремент по x
    inc DX                  ; инкремент по y
    cmp CX, 466             ; дошли до границы по X?
    jne p_xy1               ; нет, повторяем вывод точек

    ; остановим программу для наблюдения результата
    mov AH, 01h             ; дошли до границы по x,
    int 21h                 ; остановка функцией ввода символа с клавиатуры
    mov AX, 3               ; восстановим текстовый
    int 10h                 ; видеорежим

    ; выход:
    mov AX, 4C00h
    int 21h
END begin                   ; завершение программы
.MODEL SMALL
.STACK 100h

.DATA
	a1 db 213
	a2 db 6
	a3 db 53
	a4 db 0
	msg1 db 'Number: $'
	msg2 db 'Enter number: $'

.CODE

; -----------------------------------------------------------
; процедура перевода строки
; -----------------------------------------------------------
nl proc
	push AX
	push DX
	mov AH, 2
	mov DL, 10
	int 21h
	mov DL, 13
	int 21h
	pop DX
	pop AX
    ret
endp

; -----------------------------------------------------------
; процедура печати строки
; -----------------------------------------------------------
outstr proc
	push AX
	mov AH, 9
	int 21h
	pop AX
    ret
endp

; -------------------------------------------------------------
; проведура ввода беззнакового целого десятичного числа с клавиатуры, 
; результат в AL (1 байт), используются регистры AX,BX,CX,DX,DI
; -------------------------------------------------------------
in10 proc
	mov DI, 0		; Очистим регистр для результата
	; Будем вводить и анализировать символы
	inpt:
		mov AH, 08h	; Ввод символа без эха
		int 21h
		cmp AL, 13	; Нажат ли Enter?
		je done		; Да, ввод числа закончен
		cmp AL, '9'	; Цифровой символ?
		ja inpt		; Нет! На повторный ввод
		cmp AL, '0'	; Цифровой символ?
		jb inpt		; Нет! На повторный ввод
		; Введен очередной цифровой символ. Выведем его
		mov AH, 02h	; Вывод символа на экран
		mov DL, AL
		int 21h
		sub AL, '0'	; Преобразуем символ в число
		xor AH, AH	; Обнулим AH (можно mov AH, 0)
		mov CX, AX	; Скопируем полученную цифру в CX
		mov AX, DI	; Результат преобразования предыдущих цифр
		mov BL, 10	; Множитель 10
		mul BL		; AX = предыдущий результат * 10
		add AX, CX	; Добавим к старому числу новую цифру
		mov DI, AX	; Сохраним в регистре DI
	jmp inpt	    ; На ввод следующей цифры
	
	done:
		mov AX, DI	; Загрузим результат в n
		ret
endp

; -----------------------------------------------------------
; Процедура вывода беззнакового целого десятичного числа из тека (2 байт),
; используются регистры AX,BX,CX,DX
; -----------------------------------------------------------
out10 proc
	push BP
	mov BP, SP
	mov AX, [BP + 4]
	mov CX, 0
	; Поместим цифры числа в стек
	p:	mov BL, 10 	;Делитель (основание системы счисления)
		div BL 		;В AH последняя цифра, в AL число без последней цифры
		add AH, '0' ;Получаем код символа
		mov BL, AH
		mov BH, 0
		push BX 	;Код символа в стек
		inc CX 		;Увеличиваем счетчик цифр
		cmp AL, 0
		je d
		mov AH, 0
	jmp p
	d: 	            ;Печать цифр числа
		mov AH, 02h
		pop DX 		;Вынимаем цифру из стека
		int 21h 	;Печатаем
	loop d
	pop BP
	ret 2
endp

begin:
	mov AX, @data
	mov DS, AX

    mov DX, offset msg1
	call outstr
	mov AH, 0
	mov AL, a1
	push AX
	call out10
	call nl
    mov DX, offset msg1
	call outstr
	mov AH, 0
	mov AL, a2
	push AX
	call out10
	call nl
    mov DX, offset msg1
	call outstr
	mov AH, 0
	mov AL, a3
	push AX
	call out10
	call nl
    mov DX, offset msg1
	call outstr
	mov AH, 0
	mov AL, a4
	push AX
	call out10
	call nl
	
	mov DX, offset msg2
	call outstr
	call in10
	mov a4, AL
	call nl
	mov DX, offset msg1
	call outstr
	mov AH, 0
	mov AL, a4
	push AX
	call out10
	call nl
	
    mov DX, offset msg2
	call outstr
	call in10
	mov a4, AL
	call nl
	mov DX, offset msg1
	call outstr
	mov AH, 0
	mov AL, a4
	push AX
	call out10
	call nl

	mov AX,4c00h
	int 21h
end begin
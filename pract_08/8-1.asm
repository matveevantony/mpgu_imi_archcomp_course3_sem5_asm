; подключение файлов макросов
include 8-1-nl.inc
include 8-1-pstr.inc

.MODEL SMALL				; код вмещается в один сегмент памяти
.STACK 100h					; на выполнение программы выделяется 256 бит

.DATA						; сегмент данных
	Msg1 db 'First line$'
	Msg2 db 'Second line$'
	Msg3 db 'Third line$'

.CODE						; сегмент кода
begin:						; метка входа в программу
	; запись адреса сегмента данных
	mov AX, @DATA
	mov DS, AX

	; вызов макросов
	prnstr Msg1
	nl
	prnstr Msg2
	nl
	prnstr Msg3

	; выход из программы
	mov AX, 4C00h
	int 21h
END begin					; завершение программы
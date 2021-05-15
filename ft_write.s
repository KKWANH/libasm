;	ssize_t	ft_write(int fil, void *buf, size_t len)
;	 arg0	(int fil)		: (rdi)
;	 arg1	(void *buf)		: (rsi)
;	 arg2	(size_t len)	: (rdx)

section		.text
	global	_ft_write
	extern	___error

_ft_write:
	mov		rax, 0x2000004	; syscall에서 write를 사용하기 위해 rax를 고유번호로 변경한다.
	syscall					; syscall 함수는 오류 발생 시 rax에 음수를 반환하며 carry flag를 1로 변경한다.
	jc		_ft_error		; 작동하지 않을 시 _ft_error를 호출한다. (jc = Jump_if_Carry_flag_1)
	jmp		_ft_exit

_ft_error:
	push	rax				; 스택 꼭대기에 rax를 저장한다.
							; rax에는 error value가 저장되어 있다.
	call	___error		; rax에 음수가 들어갔으므로 ___error를 호출한다.
							; 실행 후 rax에 &errno가 들어가 있다.
	pop		rdx				; rdx에 push 해 놓은 error value를 불러온다.
							; syscall 실행 결과가 rax에 저장되어있다.
	mov		[rax], rdx		; rax의 값만 rdx(error value)로 변경한다.
	mov		rax, -1			; rax에 -1를 넣는다. return (-1)과 같은 효과!
	jmp		_ft_exit

_ft_exit:
	ret						; 종료! (rax 반환)
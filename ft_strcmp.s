;	----[ft_strcmp by kkim]----

;	int		ft_strcmp(char *st1, char *st2)
;	 arg0	(char *st1) : (rdi)
;	 arg0	(char *st2) : (rsi)

section		.text
	global	_ft_strcmp

_ft_strcmp:
	mov 	rax, 0			; 인덱스로 사용할 rax를 0으로 초기화한다.
	jmp		_ft_loop		; _ft_loop를 호출한다.

_ft_loop:
	mov		al, [rdi]		; al 레지스터에 rdi(st1)의 포인터를 넣는다.
	mov		bl, [rsi]		; al 레지스터에 rsi(st2)의 포인터를 넣는다.
	cmp		al, 0			; al(st1)과 0을 비교한다.
	je		_ft_exit		; 같다면 종료한다.
	cmp		bl, 0			; bl(st2)과 0을 비교한다.
	je		_ft_exit		; 같다면 종료한다.
	cmp 	al, bl			; al과 bl을 비교한다.
	jne 	_ft_exit		; 둘의 결과가 동일하다면 종료한다.
	inc 	rdi				; rdi 포인터를 증가시킨다. (++st1)
	inc 	rsi				; rsi 포인터를 증가시킨다. (++st2)
	jmp 	_ft_loop		; _ft_loop 반복문을 다시 실행한다.

_ft_exit:
	movzx	rax, al			; MOVZX는 MOVe Zero Extend이다.
							; Zero Extend란 안의 값들을 모두 0으로 초기화시킨다.
							; 더 쉽게 말하면, al의 값을 rax로 넣은 뒤 남은 비트를 모두 0으로 초기화시킨다고 생각하면 된다.
							; Destination에는 반드시 레지스터가 와야 한다.
    movzx	rbx, bl			; rbx에 bl을 movzx연산한다. lin 28을 참고하자.
    sub		rax, rbx		; rax와 rbx의 차이를 계산하여 rax에 넣는다.
	ret						; 종료 (rax 반환)

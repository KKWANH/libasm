;	----[ft_strdup by kkim]----

;	char	*ft_strdup(char *str)
;	 arg0	(char *str) : (rdi)

section		.text
	global	_ft_strdup
	extern	_malloc			; malloc		호출
	extern	_ft_strlen		; _ft_strlen	호출
	extern	_ft_strcpy		; _ft_strcpy	호출

_ft_strdup:
	push	rdi				; 스택 꼭대기에 rdi(str)를 저장한다.
							; 다른 함수를 사용하기 위해 사용한다!
	call	_ft_strlen		; - strlen 호출
							; (결과 cnt는 rax에 저장되어 있다!)
	inc		rax				; rax를 1 증가시킨다.
							; 마지막 \0 문자를 추가하기 위해 사용한다.
	mov		rdi, rax		; rdi에 rax(cnt)를 저장한다.
							; malloc에서 사용하기 위해 문자열의 길이를 rdi에 저장해 놓는다.
	call	_malloc			; - malloc 호출
	cmp		rax, 0			; rax(cnt)와 0을 비교한다.
	je		_ft_exit		; 같다면 _ft_exit! (JE = Jump_if_Equal)
	mov		rdi, rax		; rdi에 rax를 저장한다.
							; malloc의 결과는 rax에 있기에 rdi에 넣어주는 것이다.
	pop		rsi				; rsi에 처음 rdi를 넣는다.
							; strcpy의 arg1(char *src)가 rsi를 사용하기 때문이다.
	call	_ft_strcpy		; - strcpy 호출
	jmp		_ft_exit

_ft_exit:
	ret						; 종료 (rax 반환)
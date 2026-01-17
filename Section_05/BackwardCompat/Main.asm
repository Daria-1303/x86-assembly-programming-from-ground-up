; daca rulam pe x64 nu avem erori
; daca rulam pe x86 avem erori deoarece trebuie sa specificam modelul de memorie pe care il utiliza
;.code

;main proc
;	mov rax, 2
;	mov rbx, 3
;	mov rcx, 4
;	ret
;
;main endp
;end

; rulare pe x64

;RAX = 0000000000000002 RBX = 0000000000000003 
;RCX = 0000000000000004 RDX = 00007FF622831005 
;RSI = 0000000000000000 RDI = 0000000000000000 
;R8  = 000000DDD91ED000 R9  = 0000000000000000 
;R10 = 00007FFC343EE210 R11 = 0000000000000000 
;R12 = 0000000000000000 R13 = 0000000000000000 
;R14 = 0000000000000000 R15 = 0000000000000000 
;RIP = 00007FF622831025 RSP = 000000DDD92FF828 
;RBP = 0000000000000000 EFL = 00000246 

; pt x86		- 32 biti
;.386
;model memorie
;.model flat

;.code

;main proc

;	mov eax, 2
;	mov ebx, 3
;	mov ecx, 4
;	ret

;main endp
;end  main

;EAX = 00000002 EBX = 00000003 
;ECX = 00000004 EDX = 008B1005 
;ESI = 008B1005 EDI = 008B1005 
;EIP = 008B101F ESP = 006FFC6C 
;EBP = 006FFC78 EFL = 00000246 

; pt x86		- 16 biti

.386

.model flat

.code

main proc

	mov ax, 2
	mov bx, 3
	mov cx, 4
	ret
main endp
end  main

;EAX = 01170002 EBX = 00FE0003 
;ECX = 00040004 EDX = 00041005 
;ESI = 00041005 EDI = 00041005 
;EIP = 0004101C ESP = 0117FC98 
;EBP = 0117FCA4 EFL = 00000246 


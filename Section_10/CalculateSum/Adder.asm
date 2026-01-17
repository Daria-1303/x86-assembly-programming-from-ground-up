.386
.model flat, c

.code

AdderASM proc
		push ebp
		mov ebp, esp

		mov eax, [ebp + 8]		;eax = 'a'
		mov ecx, [ebp + 12]		;eax = 'b'
		mov edx, [ebp + 16]		;eax = 'c'

		add eax, ecx			;eax = 'a' + 'b'
		add eax, edx			;eax = 'a' + 'b' + 'c'

		pop ebp

		ret				;breakpoint   => EAX = 0000002A   = 42

AdderASM endp
		 end
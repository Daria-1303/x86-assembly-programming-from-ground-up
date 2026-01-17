.model flat, c

.code

CountChar proc
			push ebp
			mov ebp, esp
			push esi


			mov esi, [ebp + 8]			;esi = 's'
			mov cx, [ebp + 12]			;cx = 'c']


			xor edx, edx

@@:			lodsw                       ; load next char into ax
			or ax, ax					; test for the end of the string
			jz @F						; jump forward to next @@ label if end of string is reached
			cmp ax, cx					; compare ax with 'c'
			jne @B
			inc edx
			jmp @B
				
@@:			mov eax, edx				; move the count into eax for return value
			pop esi
			pop ebp
			ret 

CountChar endp
end
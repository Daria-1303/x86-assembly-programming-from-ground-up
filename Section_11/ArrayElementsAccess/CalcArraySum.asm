.386
.model flat,c

.code

CalcArraySumASM		proc
			push ebp
			mov ebp, esp

			mov edx, [ebp + 8]		; edx = 'x'
			mov ecx, [ebp + 12]		; ecx = 'n'
			xor eax, eax			; eax = sum 

			cmp ecx, 0
			jle InvalidCount

@@:		    add eax, [edx]			; sum += *x
			add edx, 4				; x++
			dec ecx					; n--
			jnz @B					;jump if n != 0

InvalidCount:
			pop ebp
			ret 

CalcArraySumASM		endp
end
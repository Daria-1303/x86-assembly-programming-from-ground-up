.model flat, c
.code

CalcMeanStdevASM proc
				
			push ebp
			mov ebp, esp
			sub esp, 4

			xor eax, eax
			mov ecx, [ebp + 12]	; Load count
			cmp ecx, 1
			jle Done
			dec ecx

			mov [ebp - 4], ecx			;save n - 1

			inc ecx

			mov edx, [ebp + 8]			; edx = 'a'
			fldz						; st(0) = 0.0

@@:			fadd real8 ptr[edx]			;sum += a
			add edx, 8					;next a
			dec ecx
			jnz @B
			fidiv dword ptr[ebp + 12]	; mean = sum / n

			mov edx, [ebp + 8]
			mov ecx, [ebp + 12]
			fldz

@@:         fld real8 ptr[edx]			;st[0] = a
			fsub st(0), st(2)
			fmul st(0), st(0)			;(a - mean) ^ 2
			faddp
			add edx,8
			dec ecx
			jnz @B

			fidiv dword ptr[ebp - 4]	; variance = sum / (n - 1)
			fsqrt						; st(0) = stdev

			mov eax, [ebp + 20]
			fstp real8 ptr[eax]			; store stdev
			mov eax, [ebp + 16]
			fstp real8 ptr[eax]			; store mean
			mov eax, 1

Done:			mov esp, ebp
			pop ebp
			ret
CalcMeanStdevASM endp
end
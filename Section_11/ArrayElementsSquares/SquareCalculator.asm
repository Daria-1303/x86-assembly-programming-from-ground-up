.386
.model flat, c

.code

CalcArraySquaresASM proc
			push ebp
			mov ebp, esp
			push ebx
			push esi
			push edi


			; load args

			mov edi, [ebp + 8]		; edi = output array
			mov esi, [ebp + 12]		; esi = input array
			mov ecx, [ebp + 16]		; ecx = number of elements

			xor eax, eax			; clear eax (index)
			cmp ecx, 0
			jle EmptyArray			; if count <= 0, skip processing
			shl ecx, 2				;  ecx = size of aray in bytes
			xor ebx, ebx			; ebx = array eleemnt offset


@@:			mov edx, [esi + ebx]	; load input array element
			imul edx, edx			; square it
			mov [edi + ebx], edx	; store squared value in output array
			add eax, edx			; update running sum
			add ebx, 4				; move to next element
			cmp ebx, ecx			
			jl @B					; jmp if not done

EmptyArray:
			pop edi
			pop esi
			pop ebx
			pop ebp
		    ret

CalcArraySquaresASM endp
end
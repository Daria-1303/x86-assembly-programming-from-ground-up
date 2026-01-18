.model flat, c

.const

r4_MinFloat  dword 0ff7fffffh ; Smallest positive float
r4_MaxFloat  dword 7f7fffffh ; Largest positive float

.code

CalcMinMax proc
					push ebp
					mov ebp, esp

					xor eax, eax
					mov edx, [ebp + 8]			;edx = 'a'
					mov ecx, [ebp + 12]			;ecx = 'n'
					test ecx, ecx
					jle Done

					fld [r4_MinFloat]		;st(0) = min float
					fld [r4_MaxFloat]		;st(0) = max float, st(1) = min float

@@:					fld real4 ptr [edx]      ;load *a
					fld st(0)                ;duplicate it

					fcomi st(0), st(2)      ;compare with min
					fcmovnb st(0), st(2)    ;st(0) = smaller val

					fstp st(2)                ;pop duplicate

					fcomi st(0), st(2)			;compare with max
					fcmovb st(0), st(2)		;st(0) = larger val
					fstp st(2)                ;pop duplicate

					add edx, 4				;next float
					dec ecx
					jnz @B

					mov eax, [ebp + 16]			;eax = min pointer
					fstp real4 ptr [eax]	;store min
					mov eax, [ebp + 20]			;eax = max pointer
					fstp real4 ptr [eax]	;store max
					mov eax, 1				;return true

Done:				pop ebp
					ret


CalcMinMax endp
end
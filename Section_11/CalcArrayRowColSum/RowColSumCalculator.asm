.386

.model flat,c

.code

CalcArrayRowColSum proc
			push ebp
			mov ebp, esp
			push ebx
			push esi
			push edi


			xor eax, eax
			cmp dword ptr [ebp + 12], 0			; ebp + 12 = numRows
			jle InvalidArg
			mov ecx, [ebp + 16]					; ecx = numCols
			cmp ecx, 0
			jle InvalidArg


			mov edi, [ebp + 24]					; edi = rowSums
			xor eax, eax
			rep stosd							; fill rowSums with 0

			mov ebx, [ebp + 8]					; ebx = 'x'
			xor esi, esi						; i = 0


			;outer loop
Lp1:			mov edi, [ebp + 20]
			mov dword ptr [edi + esi * 4], 0			; row_sums[i] = 0
			xor edi, edi								;j = 0
			mov edx, esi								; edx = i
			imul edx, [ebp + 16]						; edx = i * numCols

			;inner loop
Lp2:			mov ecx, edx								; ecx = i * numCols
			add ecx, edi								; ecx = i * numCols + j
			mov eax, [ebx + ecx * 4]					; eax = x[i][j]
			mov ecx, [ebp + 20]							; ecx = rowSums
			add [ecx + esi * 4], eax					; row_sums[i] += x[i][j]
			mov ecx, [ebp + 24]							; ecx = colSums
			add [ecx + edi * 4], eax					; col_sums[j] += x[i][j]

			inc edi										; j++
			cmp edi, [ebp + 16]							; compare j with numCols
			jl Lp2										; jump if j < ncols

			inc esi										; i++
			cmp esi, [ebp + 12]							; compare i with numRows
			jl Lp1										; jump if i < nrows
			mov eax, 1

InvalidArg:
			pop edi
			pop esi
			pop ebx
			pop ebp
			ret

CalcArrayRowColSum endp
end
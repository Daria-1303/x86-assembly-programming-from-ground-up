

; F to C ; -32, * 5, apoi / 9
; C to F ; * 9, / 5, apoi + 32

.model flat, c

.const

r8_SfFtoC    real8 0.5555555556 ; 5/9
r8_SfCtoF    real8 1.8          ; 9/5
i4_32		dword 32

.code

FtoC	proc
		push ebp
		mov ebp, esp

		fld [r8_SfFtoC]	; incarc constanta 5/9
		fld real8 ptr [ebp + 8] ; incarc valoarea in F
		fild [i4_32]	; incarc 32
		
		fsubp                  ; ST(0) = F - 32
		fmulp                  ; ST(0) = (F - 32) * (5/9)

		pop ebp
		ret
FtoC	endp


CtoF	proc
		push ebp
		mov ebp, esp


		fld real8 ptr [ebp + 8] ; incarc valoarea in C
		fmul [r8_SfCtoF]		; inmultesc cu 9/5

		fiadd [i4_32]		; adun 32

		pop ebp
		ret
CtoF	endp
end
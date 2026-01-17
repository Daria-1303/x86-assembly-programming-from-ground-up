; aria : 4 pi r ^2
; volum: (4 pi r^2) * r /  3 = (4/3) pi r^3

.model flat, c

.const

r8_4p0  real8 4.0
r8_3p0  real8 3.0


.code

CalcSphereAreaVolume proc
			push ebp
			mov ebp, esp

			xor eax, eax
			fld real8 ptr [ebp + 8]		; load radius
			fldz						; ST(0) = 0.0 ST(1) = radius
			fcomip st(0), st(1)			; compare radius with 0.0
			fstp st(0)					; pop 0.0

			jp Done						;jump if unordered operands
			ja Done						;jump if r < 0.0

			fld real8 ptr [ebp + 8]		; load radius
			fld st(0)					; duplicate radius

			fmul st(0), st(0)			; ST(0) = r^2
			
			fldpi						; load pi

			fmul [r8_4p0]				; ST(0) = 4 * pi
			fmulp						; ST(1) = 4 * pi * r^2

			mov edx, [ebp + 16]		; load address of area
			fst real8 ptr [edx]		; store area

			fmulp						; ST(0) = 4 * pi * r^3
			fdiv [r8_3p0]				; ST(0) = (4/3) * pi * r^3

			mov edx, [ebp + 20]		; load address of volume
			fstp real8 ptr [edx]		; store volume and pop FPU stack

			mov eax, 1

Done:			pop ebp
			ret

CalcSphereAreaVolume endp
end
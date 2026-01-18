.model flat, c

.const
DegToRad   real8   0.017453229252
RadToDeg   real8   57.2957795131

.code

RectToPolar    proc
					push ebp
					mov ebp, esp

					fld real8 ptr [ebp + 16]		;load y
					fld real8 ptr [ebp + 8]			;load x

					fpatan
					fmul [RadToDeg]				
					mov eax, [ebp + 28]
					fstp real8 ptr [eax]			;store angle

					fld real8 ptr [ebp + 8]
					fmul st(0), st(0)				;square x
					fld real8 ptr [ebp + 16]
					fmul st(0), st(0)				;square y

					faddp

					fsqrt

					mov eax, [ebp + 24]
					fstp real8 ptr [eax]			;store radius

					pop ebp
					ret
RectToPolar    endp

PolarToRect    proc
					push ebp
					mov ebp, esp

					fld real8 ptr [ebp + 16]		;load angle
					fmul [DegToRad]					;convert to radians

					fsincos							;calculate sin and cos
					fmul real8 ptr [ebp + 8]		;multiply by radius
					mov eax, [ebp + 24]
					fstp real8 ptr [eax]			;store x

					fmul real8 ptr [ebp + 8]		;multiply by radius
					mov eax, [ebp + 28]
					fstp real8 ptr [eax]			;store y

					pop ebp
					ret
PolarToRect    endp
end
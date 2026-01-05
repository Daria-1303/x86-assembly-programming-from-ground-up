.386
; pentru x86

.model flat

.code

;.data

start PROC
	mov eax, 213

	add eax, 432		; 213 + 432

		ret				; breakpoint sa vedem ce trece prin registru -> start debugging

start endp

end start
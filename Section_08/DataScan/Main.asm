.386

.model flat

.data

intArray	SWORD	0,0,0,0,4,3,0,-34,-56,7,8

.code

main proc
		mov ebx, OFFSET intArray
		mov ecx, LENGTHOF intArray


L1:
		cmp WORD PTR[ebx],	0
		jnz		found
		add ebx, 2
		loop L1
		jmp		notFound

found:
		movsx eax, WORD PTR[ebx]
		jmp quit

notFound:
		mov eax,999999

quit:
		ret			;breakpint


main	endp
end		main

;EAX = 00000001 EBX = 00DF4008 ECX = 00000007 EDX = 00DF1005 ESI = 00DF1005 EDI = 00DF1005 EIP = 00DF1031 ESP = 012FF814 EBP = 012FF820 EFL = 00000202 
; eax are 1 pt ca este primul nr non zero
; daca punem 4 in loc de 1
; iar daca ne umplem array doar de 0 ne va returna 999999

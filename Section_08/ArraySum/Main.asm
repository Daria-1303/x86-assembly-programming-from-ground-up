.386
.model flat

.data
intArray DWORD 10000h,20000h,30000h,40000h;

.code
start proc
     mov edi,OFFSET intArray
	 mov ecx, LENGTHOF intArray
	 mov eax,0

LP:
	add eax,[edi]
	add edi,TYPE intArray
	loop LP
    ret							;breakpoint
start	endp
end		start

;EAX = 000A0000 EBX = 007A4000				In eax avem suma
;ECX = 00000000 EDX = 00D01005
;ESI = 00D01005 EDI = 00D04010
;EIP = 00D01026 ESP = 0093F890
;EBP = 0093F89C EFL = 00000212 


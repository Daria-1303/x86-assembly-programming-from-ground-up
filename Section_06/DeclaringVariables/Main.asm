.386
.model flat

.data

num1	dword	11111111h
num2	dword	10101010h
ans		dword	0			; add to watch - > hexa

.code

start proc
			mov eax, num1
			add eax, num2
			mov ans, eax

			ret

start endp
end start


;EAX = 21212121 EBX = 00AEC000 
;ECX = 00C31005 EDX = 00C31005 
;ESI = 00C31005 EDI = 00C31005 
;EIP = 00C31020 ESP = 00D9FC78 
;EBP = 00D9FC84 EFL = 00000206 


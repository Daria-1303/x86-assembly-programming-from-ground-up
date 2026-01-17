.386

.model flat

.data

quote  byte "Machines do feel", 0
message byte SIZEOF quote DUP(0), 0

.code

start proc
        mov esi, 0
        mov ecx, SIZEOF quote

LP:
        mov al, quote[esi]      ;get a character from quote
        mov message[esi], al    ;store it in message
        inc esi
        loop LP


        ret
start endp
end start

;EAX = 007EF900 EBX = 0095A000 ECX = 00000000 EDX = 00C51005 ESI = 00000011 EDI = 00C51005 EIP = 00C51029 ESP = 007EF95C EBP = 007EF968 EFL = 00000206 


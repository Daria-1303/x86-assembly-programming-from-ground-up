.686p                   ; Permite instructiuni Pentium (Privileged)
.mmx                    ; <--- OBLIGATORIU: Activeaza instructiuni MMX
.model flat, c
.code

; extern "C" MmxVal MmxAdd(MmxVal a, MmxVal b, MmxAddOp op);

MmxAdd      proc
            push ebp
            mov ebp,esp

            ; Parametrii pe stiva (x86 cdecl):
            ; [ebp+8]  = a (8 bytes)
            ; [ebp+16] = b (8 bytes)
            ; [ebp+24] = op (4 bytes, enum)

            mov eax,[ebp+24]                ; load 'op'
            cmp eax,AddOpTableCount         ; compare to table count
            jae BadAddOp                    ; jump if invalid

            movq mm0,[ebp+8]                ; load 'a'
            movq mm1,[ebp+16]               ; load 'b'
            
            ; Calculam offset-ul in tabel: eax * 4 (pentru ca sunt dwords)
            jmp [AddOpTable+eax*4]          ; jump tabelar

MmxPaddb:   paddb mm0,mm1                   ; packed byte addition (wraparound)
            jmp SaveResult

MmxPaddsb:  paddsb mm0,mm1                  ; packed byte addition (signed saturation)
            jmp SaveResult

MmxPaddusb: paddusb mm0,mm1                 ; packed byte addition (unsigned saturation)
            jmp SaveResult

MmxPaddw:   paddw mm0,mm1                   ; packed word addition (wraparound)
            jmp SaveResult

MmxPaddsw:  paddsw mm0,mm1                  ; packed word addition (signed saturation)
            jmp SaveResult

MmxPaddusw: paddusw mm0,mm1                 ; packed word addition (unsigned saturation)
            jmp SaveResult

MmxPaddd:   paddd mm0,mm1                   ; packed dword addition
            jmp SaveResult

BadAddOp:   pxor mm0,mm0                    ; return 0 if bad op

SaveResult: 
            ; Return value MmxVal is 64-bit.
            ; In C calling convention, 64-bit return values go in EDX:EAX.
            movd eax,mm0                    ; eax = low dword mm0
            pshufw mm2,mm0,01001110b        ; swap high & low dwords -> mm2
            movd edx,mm2                    ; edx = high dword
            
            emms                            ; clear MMX state (OBLIGATORIU)
            pop ebp
            ret

            align 4
AddOpTable:
            dword MmxPaddb, MmxPaddsb, MmxPaddusb
            dword MmxPaddw, MmxPaddsw, MmxPaddusw, MmxPaddd

; CORECTIE AICI: 'sizestr' nu este valid pentru calcule numerice. 
; Folosim 'TYPE dword' care este 4.
AddOpTableCount equ ($ - AddOpTable) / TYPE dword 

MmxAdd      endp
end
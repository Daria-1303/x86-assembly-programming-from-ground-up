.386
.model flat, c

.const
LsEpsilon real8 1.0E-12     ; Constanta interna ASM

.code

CalcLeastSquaresASM proc
    push ebp
    mov ebp, esp
    sub esp, 8              ; Rezervam spatiu local pentru 'denom'

    xor eax, eax            ; eax = 0 (return false default)
    
    mov ecx, [ebp + 16]     ; ecx = n
    test ecx, ecx
    jle Done                ; Daca n <= 0, iesim cu false

    mov eax, [ebp + 8]      ; eax = pointer la x
    mov edx, [ebp + 12]     ; edx = pointer la y

    ; Initializam sumele pe stiva FPU
    fldz                    ; ST(0) = sum_xx
    fldz                    ; ST(0) = sum_xy, ST(1) = sum_xx
    fldz                    ; ST(0) = sum_y, ...
    fldz                    ; ST(0) = sum_x, ...

    ; Stiva FPU acum: sum_x, sum_y, sum_xy, sum_xx

LoopStart:
    fld real8 ptr [edx]     ; incarca y[i]
    fld real8 ptr [eax]     ; incarca x[i]
    ; Stiva: x, y, sum_x, sum_y, sum_xy, sum_xx

    fld st(0)               ; duplicam x -> x, x, y...
    fld st(2)               ; duplicam y -> y, x, x, y...
    
    ; Update sum_y
    faddp st(5), st(0)      ; sum_y += y (si pop y)
    
    ; Update sum_x
    fadd st(4), st(0)       ; sum_x += x (fara pop, pastram x pentru calcule)

    ; Update sum_xy (avem x pe stiva, inmultim cu y-ul ramas mai jos)
    fmulp st(1), st(0)      ; st(0) devine x*y
    faddp st(4), st(0)      ; sum_xy += x*y

    ; Update sum_xx (avem un x ramas pe stiva duplicat la inceput)
    fmul st(0), st(0)       ; x * x
    faddp st(4), st(0)      ; sum_xx += x*x

    ; Avansam pointerii
    add eax, 8              ; x++
    add edx, 8              ; y++
    dec ecx
    jnz LoopStart

    ; --- Calcul Denom ---
    ; Stiva curenta: sum_x, sum_y, sum_xy, sum_xx
    
    ; Formula: denom = n * sum_xx - sum_x * sum_x
    
    fild dword ptr [ebp + 16]   ; Incarca n
    fmul st(0), st(4)           ; n * sum_xx
    
    fld st(1)                   ; push sum_x
    fmul st(0), st(0)           ; sum_x * sum_x
    
    fsubp                       ; (n*sum_xx) - (sum_x^2) -> Rezultatul este DENOM
    
    fst real8 ptr [ebp - 8]     ; Salvam denom in memorie locala
    
    ; --- Verificare Epsilon ---
    ; Stiva: denom, sum_x, sum_y, sum_xy, sum_xx
    
    fld st(0)                   ; Duplicam denom
    fabs                        ; |denom|
    fld real8 ptr LsEpsilon     ; Incarcam epsilon
    fcomip st(0), st(1)         ; Compara epsilon cu |denom| si sterge epsilon
    fstp st(0)                  ; Stergem |denom| de pe stiva
    
    jae InvalidDenom            ; Daca epsilon >= |denom|, eroare (numitor prea mic)

    ; Stiva e curata (denom original e inca acolo): denom, sum_x, sum_y, sum_xy, sum_xx

    ; --- Calcul M ---
    ; m = (n * sum_xy - sum_x * sum_y) / denom
    
    fild dword ptr [ebp + 16]   ; n
    fmul st(0), st(4)           ; n * sum_xy
    
    fld st(2)                   ; sum_x
    fld st(4)                   ; sum_y
    fmulp                       ; sum_x * sum_y
    
    fsubp                       ; (n*sum_xy) - (sum_x*sum_y)
    fdiv real8 ptr [ebp - 8]    ; imparte la denom
    
    mov eax, [ebp + 20]         ; CORECTIE: Incarcam adresa lui m in EAX
    fstp real8 ptr [eax]        ; scriem valoarea si o scoatem de pe stiva

    ; --- Calcul B (Intercept) ---
    ; b = (sum_xx * sum_y - sum_x * sum_xy) / denom
    ; Stiva ramasa: denom, sum_x, sum_y, sum_xy, sum_xx
    ; Putem scapa de denom de pe stiva acum, folosim variabila locala
    fstp st(0)                  
    
    ; Stiva: sum_x, sum_y, sum_xy, sum_xx
    
    fxch st(3)                  ; aducem sum_xx in fata -> sum_xx, sum_y, sum_xy, sum_x
    fmulp                       ; sum_xx * sum_y (si pop) -> termen1, sum_xy, sum_x
    
    fxch st(2)                  ; aducem sum_x in fata -> sum_x, sum_xy, termen1
    fmulp                       ; sum_x * sum_xy -> termen2, termen1
    
    fsubp                       ; termen1 - termen2
    fdiv real8 ptr [ebp - 8]    ; imparte la denom
    
    mov eax, [ebp + 24]         ; CORECTIE: Incarcam adresa lui b in EAX
    fstp real8 ptr [eax]        ; scriem b

    mov eax, 1                  ; return true
    jmp Done

InvalidDenom:
    ; Curatam stiva FPU (au ramas 5 valori: denom, sum_x, sum_y, sum_xy, sum_xx)
    fstp st(0)
    fstp st(0)
    fstp st(0)
    fstp st(0)
    fstp st(0)
    xor eax, eax                ; return false

Done:
    mov esp, ebp
    pop ebp
    ret

CalcLeastSquaresASM endp
end
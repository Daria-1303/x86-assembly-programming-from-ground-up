# x86 Assembly Programming From Ground Up — Portfolio

> Personal notes and project portfolio from completing the [x86 Assembly Programming From Ground Up](https://www.udemy.com/course/x86-assembly-programming-from-ground-uptm/) Udemy course.

![Level](https://img.shields.io/badge/level-intermediate-orange)
![Duration](https://img.shields.io/badge/duration-10--15%20hours-blue)
![Toolchain](https://img.shields.io/badge/toolchain-MASM%20%7C%20Visual%20Studio%202022-purple)
![Platform](https://img.shields.io/badge/platform-Windows%20x86%20(32--bit)-lightgrey)
![Certificate](https://img.shields.io/badge/certificate-completed-brightgreen)

---

## What You'll Learn

By working through the material in this repo you will be able to:

- **Write and debug real x86 ASM programs** — from a bare-bones `mov eax, 213` up to multi-function modules using all general-purpose registers.
- **Understand how C++ calls assembly** — implement full cdecl calling conventions (stack frame setup, prologue/epilogue, register preservation, local variable allocation) so ASM functions integrate cleanly into C++ projects.
- **Use the x87 FPU instruction set** — perform floating-point arithmetic with the FPU stack to implement statistics (mean, standard deviation), geometry (sphere area/volume), coordinate conversions (rectangular ↔ polar via `fpatan` / `fsincos`), and linear regression (least squares).
- **Process arrays and matrices in ASM** — traverse 1D and 2D arrays using base + index × scale addressing modes, implement nested loops, and compute row/column sums.
- **Use MMX SIMD instructions** — execute packed integer operations (add, multiply, shift) on 64-bit MMX registers across multiple data widths simultaneously.

---

## Who This Is For

- CS students who want to connect what they learn in architecture/microprocessors courses to actual running code.
- Programmers with C or C++ experience who are curious about what happens one level below the compiler.
- Hobbyists interested in low-level computing, reverse engineering foundations, or performance-critical code.

**Assumed knowledge:** comfortable with C or C++ (pointers, arrays, functions). No prior assembly experience needed — the course starts from scratch.

---

## Course Structure

The sections follow the progression of the original Udemy course. Sections with only images/screenshots contain theory covered in the video lectures.

| Section | Topic | Format | Key Concepts |
|---------|-------|--------|--------------|
| 02 | First Assembly Program | `.asm` + VS project | Registers (EAX/EBX/ECX), `mov`, `add`, debugger register watch |
| 03 | Architecture Overview | Diagrams | Von Neumann vs Harvard, Intel processor evolution |
| 04 | Digital Logic | Diagrams | AND, OR, NOT, XOR gates — binary foundation |
| 05 | x86 Basics & Compatibility | `.asm` + screenshots | 16/32/64-bit register sub-registers (AX → EAX → RAX), operating modes, `.model flat` |
| 06 | Data Declaration & Arrays | `.asm` + C++ | `.data` section, `dword` variables, array reversal with `lodsd` / `std` / `pushfd` |
| 07 | Debugging x86 | Screenshots | Reading register dumps, memory windows, flag states in VS debugger |
| 08 | Memory Access Patterns | `.asm` | `OFFSET`, `LENGTHOF`, `TYPE`, pointer traversal, data scanning, array sum loops |
| 09 | Control Flow | Diagrams | `JMP`, `CMP`, `TEST`, conditional jumps reference table |
| 10 | Integer Arithmetic + C++ Interop | `.asm` + `.cpp` | All integer sizes (byte/word/dword/qword), 4 addressing modes, `IMUL`/`IDIV`/`CDQ`, cdecl calling convention, stack frames |
| 11 | Array & Matrix Processing | `.asm` + `.cpp` | Element access, element-wise squaring/cubing, 2D matrix row & column sums with nested loops |
| 12 | String Operations | `.asm` + `.cpp` | `lodsw`, character counting, memory block transfer |
| 13 | Floating-Point (x87 FPU) | `.asm` + `.cpp` | FPU stack, `fld`/`fstp`/`fadd`/`fmul`/`fdiv`/`fsqrt`, `fpatan`, `fsincos`, temperature conversion, min/max, sphere geometry, statistics, least squares regression |
| 14 | MMX SIMD | `.asm` + `.cpp` | `.mmx` directive, `movq`/`paddb`/`paddsb`/`paddw`/`pmullw`/`pmulhw`/`punpcklwd`, jump tables, `emms` |

---

## Requirements & Setup

**Software:**
- [Visual Studio 2022](https://visualstudio.microsoft.com/) with the **Desktop development with C++** workload installed
- MASM is bundled with the C++ workload — no separate download needed
- Windows 10 or 11 (x86/x64 host; projects target Win32)

**No additional packages, pip installs, or Makefiles.** Each section folder contains a self-contained `.vcxproj` file.

---

## How to Use This Repo

1. Clone the repository.
2. Navigate to any section folder (e.g. `Section_10/CPPCallingConventions/`).
3. Open the `.vcxproj` or `.sln` file in Visual Studio 2022.
4. Build → **Debug | Win32** (most projects target 32-bit).
5. Start debugging (`F5`) and use the **Registers** window (`Debug → Windows → Registers`) and **Memory** window to observe values in real time.

Sections 02–09 build progressively; concepts from each section are used in the next. Sections 13 and 14 are largely self-contained once you've completed Section 10.

> **Note on section order:** Sections 03, 04, 07, and 09 contain only diagrams/screenshots — there is no code to run; they document theory from the video lectures.

---

## Most Complex Project: Least Squares Linear Regression (`Section_13/LeastSquares`)

The most algorithmically demanding project in the repo. A pure x87 FPU implementation of linear regression that:

- Computes Σx, Σy, Σxy, Σx² across a dataset in a single FPU-stack loop.
- Calculates the denominator `n·Σx² − (Σx)²` and guards against near-zero values using an epsilon comparison (`fcomip` against `1.0E-12`).
- Solves for slope `m` and intercept `b`, writing results back to C++ pointers via `fstp`.
- Properly cleans the FPU stack (5 entries) on the error path.

This project demonstrates production-quality ASM: error handling, floating-point precision guards, and clean C++ interoperability — all without a single high-level language construct.

---

## Evidence the Code Works

- Every `.asm` file in Sections 02, 05, 06, and 08 includes commented-out register dump snapshots (e.g., `EAX=21212121`, `ECX=00000000`) captured from the VS debugger — showing the expected state at the breakpoint.
- Sections 06–14 pair each `.asm` module with a `.cpp` harness that prints results to stdout, making correctness visually verifiable on each run.
- Screenshot captures of debugger register windows are present in Sections 06, 07, and 08.
- A completion certificate is included in the repo root (`Certificate.pdf` / `Certificate.jpg`).

---

## Further Resources

- [Intel 64 and IA-32 Architectures Software Developer Manuals](https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html) — authoritative instruction reference.
- [MASM Reference (Microsoft Docs)](https://learn.microsoft.com/en-us/cpp/assembler/masm/microsoft-macro-assembler-reference) — directives, operators, and syntax used throughout this course.
- [Original Udemy Course](https://www.udemy.com/course/x86-assembly-programming-from-ground-uptm/) — video lectures that accompany the code in this repo.

---

## Author

**Daria** — [GitHub](https://github.com/darknick131)

*Open to feedback or questions via GitHub Issues.*

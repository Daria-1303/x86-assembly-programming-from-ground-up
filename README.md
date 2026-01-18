# x86 Assembly Programming - Portofoliu de Activitate

## 1. Descrierea Temelor și Activităților

Structura proiectelor urmărește învățarea logică, acoperind următoarele domenii cheie:

### A. Fundamentele Limbajului (Secțiunile 02 - 05)
Startul a implicat familiarizarea cu sintaxa și mecanismele de bază ale arhitecturii x86:
*   **Operații Aritmetice Simple**: Implementarea adunărilor și scăderilor simple (`SimpleAddition`) pentru a înțelege utilizarea registrelor generale (EAX, EBX etc.).
*   **Declararea Datelor**: Lucrul cu diverse tipuri de date (byte, word, dword) și variabile.

### B. Manipularea Memoriei și Algoritmi Elementari (Secțiunile 06 - 08)
Focusul s-a mutat pe gestionarea memoriei și logica de control:
*   **Lucrul cu Vectori (Arrays)**: Implementarea algoritmilor de inversare a array-urilor (`ArrayReverser`) și calculul sumelor elementelor (`ArraySum`).
*   **Pointeri și Accesare**: Utilizarea pointerilor pentru a parcurge și manipula eficient structurile de date.
*   **Scanarea Datelor**: Algoritmi de căutare și filtrare în seturi de date.

### C. Integrare Avansată și Interfațare cu C++ (Secțiunea 10)
O etapă crucială a fost legarea codului de asamblare de limbaje de nivel înalt:
*   **Convenții de Apelare (Calling Conventions)**: Înțelegerea modului în care funcțiile C++ apelează rutine ASM și invers, gestionarea stivei și salvarea registrelor.
*   **Cod Hibrid**: Proiecte care apelează funcții ASM (ex: `CalculateSum`, `SignedDivMul`) direct din surse C++.

### D. Procesare de Șiruri și Structuri Complexe (Secțiunile 11 - 12)
*   **Manipulare String-uri**: Numărarea caracterelor și transferul blocurilor de memorie (`StringCharacterCount`, `StringsTransfer`).
*   **Matrici și Calcule Tabulare**: Procesarea datelor pe linii și coloane (`CalcArrayRowColSum`) și calcule de pătrate perfecte.

### E. Matematică Avansată și Floating Point (Secțiunea 13)
Rezolvarea unor probleme de calcul numeric folosind coprocesorul matematic sau instrucțiuni dedicate:
*   **Geometrie și Fizică**: Calculul ariei și volumului sferei (`SphereAreaVolume`), conversii de temperatură (`TempConverter`).
*   **Statistică**: Calculul mediei și deviației standard (`StdMean`), metoda celor mai mici pătrate (`LeastSquares`).
*   **Sisteme de Coordonate**: Conversii între sisteme de coordonate (`CoordinateConversions`).

### F. Instrucțiuni SIMD - MMX (Secțiunea 14)
Optimizarea performanței prin paralelism la nivel de date:
*   **Operații Vectoriale**: Adunarea, înmulțirea și shiftarea simultană a mai multor elemente de date folosind regiștrii MMX (`MmxAddition`, `MmxMultiply`), demonstrând puterea procesării paralele.

---

## 2. Descrierea Experienței de Învățare

### Ce am învățat nou
*   **Arhitectura Calculatorului**: Am dobândit o înțelegere profundă a modului în care procesorul execută instrucțiunile, cum este organizată memoria (segmentare, stivă, heap) și rolul vital al registrelor.
*   **Optimizare Low-Level**: Am învățat să optimizez codul pentru viteză și dimensiune
*   **Debugging**: Depanarea la nivel de regiștri și memorie a fost o abilitate critică dezvoltată, interpretând "dump-uri" de memorie și flag-uri de stare (Carry, Zero, Overflow).
*   **Maleabilitate**: Capacitatea de a scrie module critice de performanță în ASM și de a le integra într-o aplicație C++ standard.

### Gradul de Dificultate
*   **Curba de Învățare**: Inițial abruptă. Trecerea de la gândirea abstractă specifică limbajelor high-level la gestionarea explicită a fiecărui byte și a stării procesorului a fost provocatoare.
*   **Provocări**: Gestionarea corectă a stivei (pentru a evita crash-urile tăcute) și înțelegerea tipurilor de date semnate vs. nesemnate (semnalați prin flag-uri) au fost puncte ce au necesitat multă atenție.
*   **Secțiunile Avansate**: Implementarea algoritmilor matematici (statistici, geometrie) și SIMD a ridicat nivelul de complexitate, necesitând o rigurozitate matematică și logică sporită.

### Impresii Personale
Mi-a placut foarte mult cursul, ultima parte a fost putin mai grea, dar pot sa spun ca am invatat multe lucruri noi. De asemenea, am consolidat ceea ce am invatat la laboratorul de Proiectarea cu Microprocesoare de la facultate. 

#include <iostream>
#include <cmath> // Necesar pentru fabs in C++

const double LsEpsilon = 1e-12;

extern "C" bool CalcLeastSquaresASM(const double* x, const double* y, int n, double* m, double* b);
bool CalcLeastSquaresCPP(const double* x, const double* y, int n, double* m, double* b);

int main()
{
    // Date de test
    double x[] = { 1.0, 2.0, 3.0, 4.0, 5.0 };
    double y[] = { 2.2, 2.8, 3.6, 4.5, 5.1 };
    const int n = 5;

    // --- Testare ASM ---
    double m_asm = 0.0, b_asm = 0.0;
    // Setam pe false initial pentru a fi siguri
    if (CalcLeastSquaresASM(x, y, n, &m_asm, &b_asm)) {
        std::cout << "ASM: y = " << m_asm << " * x + " << b_asm << std::endl;
    }
    else {
        std::cout << "ASM: Calculation failed (Invalid Denominator)." << std::endl;
    }

    // --- Testare C++ ---
    double m_cpp = 0.0, b_cpp = 0.0;
    if (CalcLeastSquaresCPP(x, y, n, &m_cpp, &b_cpp)) {
        std::cout << "CPP: y = " << m_cpp << " * x + " << b_cpp << std::endl;
    }
    else {
        std::cout << "CPP: Calculation failed." << std::endl;
    }

    return 0;
}

bool CalcLeastSquaresCPP(const double* x, const double* y, int n, double* m, double* b)
{
    if (n <= 0) {
        return false;
    }

    double sum_x = 0.0;
    double sum_y = 0.0;
    double sum_xy = 0.0;
    double sum_xx = 0.0;

    for (int i = 0; i < n; ++i) {
        sum_x += x[i];
        sum_y += y[i];
        sum_xy += x[i] * y[i];
        sum_xx += x[i] * x[i];
    }

    double denom = n * sum_xx - sum_x * sum_x;

    if (fabs(denom) < LsEpsilon) {
        return false;
    }

    *m = (n * sum_xy - sum_x * sum_y) / denom;
    *b = (sum_xx * sum_y - sum_x * sum_xy) / denom; // Atentie: formula corecta pt 'b'

    return true;
}
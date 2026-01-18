#include <iostream>

extern "C" bool CalcMeanStdevASM(const double* a, int n, double* mean, double* stdev);

bool CalcMeanStdevCPP(const double* a, int n, double* mean, double* stdev);


int main()
{
	double a[] = { 2.0, 4.0, 4.0, 4.0, 5.0, 5.0, 7.0, 9.0 };
	int n = sizeof(a) / sizeof(a[0]);

	double mean_cpp, stdev_cpp;
	double mean_asm, stdev_asm;

	if (CalcMeanStdevCPP(a, n, &mean_cpp, &stdev_cpp)) {
		std::cout << "C++ Mean: " << mean_cpp << ", Stdev: " << stdev_cpp << std::endl;
	} else {
		std::cout << "C++ Calculation failed." << std::endl;
	}

	if (CalcMeanStdevASM(a, n, &mean_asm, &stdev_asm)) {
		std::cout << "ASM Mean: " << mean_asm << ", Stdev: " << stdev_asm << std::endl;
	} else {
		std::cout << "ASM Calculation failed." << std::endl;
	}
}

bool CalcMeanStdevCPP(const double* a, int n, double* mean, double* stdev)
{
    if (n <= 1) {
        return false;
    }

	double sum = 0.0;

    for(int i = 0; i < n; ++i) {
        sum += a[i];
	}

	*mean = sum / n;

    sum = 0.0;

    for (int i = 0; i < n; i++) {
		double temp = a[i] - *mean;
		sum += temp * temp;
    }

	*stdev = sqrt(sum / (n - 1));

    return true;
}
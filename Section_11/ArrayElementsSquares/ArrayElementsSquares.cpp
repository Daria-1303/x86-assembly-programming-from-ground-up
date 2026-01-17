// ArrayElementsSquares.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <stdlib.h>

extern "C" int CalcArraySquaresASM(int* y, int* x, int n);

int CalcArraySquaresCPP(int* y, int* x, int n);

int main()
{
	int x[] = { 1, 2, 3, 4, 5 };
	const int n = sizeof(x) / sizeof(x[0]);
    int y1[n];
	int y2[n];

	int sum_cpp = CalcArraySquaresCPP(y1, x, n);
	int sum_asm = CalcArraySquaresASM(y2, x, n);

	printf("C++ Sum: %d\n", sum_cpp);
	printf("ASM Sum: %d\n", sum_asm);

	for(int i = 0; i < n; i++)
	{
		printf("C++ y[%d]: %d, ASM y[%d]: %d\n \n", i, y1[i], i, y2[i]);
	}

	return 0;
}

int CalcArraySquaresCPP(int* y, int* x, int n)
{
	int sum = 0;

    for (int i = 0; i < n; i++)
    {
        y[i] = x[i] * x[i];
		sum += y[i];
    }

    return sum;
}

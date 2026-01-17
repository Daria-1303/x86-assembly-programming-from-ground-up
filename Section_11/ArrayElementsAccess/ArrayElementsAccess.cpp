// ArrayElementsAccess.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <stdlib.h>

extern "C" int CalcArraySumASM(int* x, int n);

int CalcArraySumCPP(int* x, int n) {
    int sum = 0;

    for (int i = 0; i < n; i++) {
        sum += *x++;
    }

    return sum;
}

int main()
{
	int x[] = { 1, 2, 3, 4, 5 };
	int n = sizeof(x) / sizeof(x[0]);

    int asm_sum, cpp_sum;

	asm_sum = CalcArraySumASM(x, n);
    cpp_sum = CalcArraySumCPP(x, n);
    
	printf("Sum calculated in ASM: %d\n", asm_sum);
	printf("Sum calculated in C++: %d\n", cpp_sum);
	return 0;
}



// ArrayReverser.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <stdlib.h>

extern "C" void Reverser(int* y, const int* x, int n);

int main()
{
	const int n = 10;
	int x[n], y[n];

	//srand(41);

	for (int i = 0; i < n; i++) {
		/*x[i] = rand() % 1000;*/
		x[i] = i;
	}

	//Reverser(dest_array, src_array, 10);
	Reverser(y, x, n);

	printf("\n-------------Array Reverser-------------\n");
	for (int i = 0; i < n; i++) {
		printf("i:		%5d		y: %5d		x: %5d\n", i, y[i], x[i]);

		if (x[i] != y[n - 1 - i]) {
			printf("Compare failed \n");
		}
	}

	return 0;
}



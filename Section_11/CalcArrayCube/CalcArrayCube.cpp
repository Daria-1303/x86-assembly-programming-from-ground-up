// CalcArrayCube.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <stdlib.h>

// int x[3][2] are stored in memory as follows: x[0][0], x[0][1], x[1][0], x[1][1], x[2][0], x[2][1]

void CalcArrayCube(int* y, const int* x, int nrows, int ncols) {
    for(int i = 0; i < nrows; i++) {
        for(int j = 0; j < ncols; j++) {
            int index = i * ncols + j;
            y[index] = x[index] * x[index] * x[index];
        }
	}
}

int main()
{
	const int nrows = 4;
	const int ncols = 3;

	int x[nrows][ncols] = { {1, 2, 3},
                            {4, 5, 6},
                            {7, 8, 9},
                            {10, 11, 12}
	                    };

    int y[nrows][ncols];

	CalcArrayCube(&y[0][0], &x[0][0], nrows, ncols);

    // Print the result
    for(int i = 0; i < nrows; i++) {
        for(int j = 0; j < ncols; j++) {
			printf("(%2d, %2d): %6d,  %6d \n", i, j, x[i][j], y[i][j]);
        }
		printf("\n");
    }
	return 0;
}



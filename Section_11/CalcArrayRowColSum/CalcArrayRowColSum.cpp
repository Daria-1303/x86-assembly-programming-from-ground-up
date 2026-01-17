#include <iostream>

extern "C" int CalcArrayRowColSum(const int* x, int nrows, int ncols, int* row_sums, int* col_sums);

void PrintArrayResults(const int* x, int nrows, int ncols, int* row_sums, int* col_sums);

int main()
{
	const int nrows = 7;
	const int ncols = 5;
	int x[nrows][ncols];

	for(int i = 0; i < nrows; ++i)
		for(int j = 0; j < ncols; ++j)
			x[i][j] = i + j;

	int row_sums[nrows] = { 0 };
	int col_sums[ncols] = { 0 };

	CalcArrayRowColSum(&x[0][0], nrows, ncols, row_sums, col_sums);

	PrintArrayResults(&x[0][0], nrows, ncols, row_sums, col_sums);

	return 0;
}

void PrintArrayResults(const int* x, int nrows, int ncols, int* row_sums, int* col_sums) {

	for(int i = 0; i < nrows; ++i) {
		for(int j = 0; j < ncols; ++j) {
			printf("%4d", x[i * ncols + j]);
		}
		printf(" |%4d\n", row_sums[i]);
	}

	printf("\n");

	for(int j = 0; j < ncols; ++j) {
		printf("%5d", col_sums[j]);
	}

	printf("\n");
}


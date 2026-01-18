#include <iostream>

extern "C" void RectToPolar(double x, double y, double* r, double* a);
extern "C" void PolarToRect(double r, double a, double* x, double* y);

int main()
{
    double x[] = { 0, 3, -3, -5, 6 };
    double y[] = { 0, 3, 5, -7, 8 };

	const int nx = sizeof(x) / sizeof(x[0]);
	const int ny = sizeof(y) / sizeof(y[0]);

	for (int i = 0; i < nx; i++) {
		for(int j = 0; j < ny; j++) {
			double r, a, __x, __y;

			RectToPolar(x[i], y[j], &r, &a);
			PolarToRect(r, a, &__x, &__y);

			printf("Input: (x, y) = (%.2f, %.2f) => Polar: (r, a) = (%.2f, %.2f) => Output: (x, y) = (%.2f, %.2f)\n",
				x[i], y[j], r, a, __x, __y);
		}
	}


    return 0;
}

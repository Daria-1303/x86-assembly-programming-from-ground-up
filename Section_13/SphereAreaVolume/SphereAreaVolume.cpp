#include <iostream>

extern "C" bool CalcSphereAreaVolume(double r, double* sa, double* v);

int main()
{
	double r[] = { 0.0, 1.0, 2.0, 3.0, 4.0, 5.0 };
	int n = sizeof(r) / sizeof(r[0]);

	for(int i = 0; i < n; i++)
	{
		double sa = -1;
		double v = -1;

		bool rv;

		rv = CalcSphereAreaVolume(r[i], &sa, &v);

		printf("r = %6.2f  rv = %s  sa = %12.6f  v = %12.6f\n",
			r[i],
			rv ? "true " : "false",
			sa,
			v);
	}
}

#include <iostream>

extern "C" bool CalcMinMax(const float* a, int n, float* min, float* max);

int main()
{
	float data[] = { 3.5f, 2.1f, 5.6f, 1.0f, 4.8f };
	const int size = sizeof(data) / sizeof(data[0]);

	float minVal = 0.0f;
	float maxVal = 0.0f;

	if (CalcMinMax(data, size, &minVal, &maxVal))
	{
		std::cout << "Minimum: " << minVal << std::endl;
		std::cout << "Maximum: " << maxVal << std::endl;
	}
	else
	{
		std::cerr << "Error calculating min and max." << std::endl;
	}
}

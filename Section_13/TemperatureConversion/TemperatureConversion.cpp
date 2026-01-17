#include <iostream>

extern "C" double FtoC(double deg_f);
extern "C" double CtoF(double deg_c);

int main()
{   
	double cel_temp = 30.0;
	double fahr_temp = 86.0;

	printf("%.2f degrees Celsius is %.2f degrees Fahrenheit\n", cel_temp, CtoF(cel_temp));

	printf("%.2f degrees Fahrenheit is %.2f degrees Celsius\n", fahr_temp, FtoC(fahr_temp));

    return 0;
}

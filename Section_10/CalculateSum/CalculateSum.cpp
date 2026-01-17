// CalculateSum.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <stdlib.h>

extern "C" int AdderASM(int a, int b, int c);
int AdderCPP(int a, int b, int c);

int main(){
	int a = 17, b = 11, c = 14;
	//int sum = AdderCPP(a, b, c);
	int sum = AdderASM(a, b, c);


	printf("a: %d , b: %d , c: %d ,sum : %d \n", a, b, c, sum);

	return 0;
}

int AdderCPP(int a, int b, int c) {
	return a + b + c;
}


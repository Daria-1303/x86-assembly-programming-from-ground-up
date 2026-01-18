#include <iostream>
#include <stdio.h>
#include "MmxVal.h"

enum MmxAddOp : unsigned int {
    paddb,                      // packed byte addition with wraparound
    paddsb,                     // packed byte addition with signed saturation
    paddusb,                    // packed byte addition with unsigned saturation
    paddw,                      // packed word addition with wraparound
    paddsw,                     // packed word addition with signed saturation
    paddusw,                    // packed word addition with unsigned saturation
    paddd                       // packed doubleword addition with wraparound
};

extern "C" MmxVal MmxAdd(MmxVal a, MmxVal b, MmxAddOp op);

void MmxAddBytes(void);
void MmxAddWords(void);

int main()
{
    MmxAddBytes();
    MmxAddWords(); 
    return 0;
}

void MmxAddBytes(void) {
    MmxVal a, b, c;
    char buff[256];

    // Packed byte addition - signed integers
    a.i8[0] = 50;   b.i8[0] = 30;
    a.i8[1] = 80;   b.i8[1] = 64;
    a.i8[2] = -27;  b.i8[2] = -32;
    a.i8[3] = -70;  b.i8[3] = -80;

    a.i8[4] = -42;  b.i8[4] = 90;
    a.i8[5] = 60;   b.i8[5] = -85;
    a.i8[6] = 64;   b.i8[6] = 90;
    a.i8[7] = 100;  b.i8[7] = -30;

    printf("\n\n Packed byte addition - signed integers\n");
    printf("a: %s\n", a.ToString_i8(buff, sizeof(buff)));
    printf("b: %s\n", b.ToString_i8(buff, sizeof(buff)));

    c = MmxAdd(a, b, MmxAddOp::paddsb);
    printf("\n paddsb results\n");
    printf("c: %s\n", c.ToString_i8(buff, sizeof(buff)));

    c = MmxAdd(a, b, MmxAddOp::paddb);
    printf("\n paddb results\n");
    printf("c: %s\n", c.ToString_i8(buff, sizeof(buff)));

    // Packed byte addition - unsigned integers
    a.u8[0] = 50;   b.u8[0] = 30;
    a.u8[1] = 80;   b.u8[1] = 64;
    a.u8[2] = 132;  b.u8[2] = 130;
    a.u8[3] = 200;  b.u8[3] = 180;

    a.u8[4] = 42;   b.u8[4] = 90;
    a.u8[5] = 60;   b.u8[5] = 85;
    a.u8[6] = 140;  b.u8[6] = 160;
    a.u8[7] = 10;   b.u8[7] = 14;

    printf("\n\n Packed byte addition - unsigned integers\n");
    printf("a: %s\n", a.ToString_u8(buff, sizeof(buff)));
    printf("b: %s\n", b.ToString_u8(buff, sizeof(buff)));

    c = MmxAdd(a, b, MmxAddOp::paddusb);
    printf("\n paddusb results\n");
    printf("c: %s\n", c.ToString_u8(buff, sizeof(buff)));

    c = MmxAdd(a, b, MmxAddOp::paddb);
    printf("\n paddb results\n");
    printf("c: %s\n", c.ToString_u8(buff, sizeof(buff)));
}

void MmxAddWords(void) {
    MmxVal a, b, c;
    char buff[356];

    // Packed word addition - signed integers
    a.i16[0] = 500;     b.i16[0] = 830;
    a.i16[1] = 30000;   b.i16[1] = 5000;
    a.i16[2] = -270;    b.i16[2] = -320;
    a.i16[3] = -7000;   b.i16[3] = -32000;

    printf("\n\n Packed word addition - signed integers\n");
    printf("a: %s\n", a.ToString_i16(buff, sizeof(buff)));
    printf("b: %s\n", b.ToString_i16(buff, sizeof(buff)));

    c = MmxAdd(a, b, MmxAddOp::paddw);
    printf("\n paddw results\n");
    printf("c: %s\n", c.ToString_i16(buff, sizeof(buff)));

    c = MmxAdd(a, b, MmxAddOp::paddsw);
    printf("\n paddsw results\n");
    printf("c: %s\n", c.ToString_i16(buff, sizeof(buff)));
}

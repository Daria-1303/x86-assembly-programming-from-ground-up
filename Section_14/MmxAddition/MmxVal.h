#pragma once
# include "MiscDef.h"
#include <stdio.h> // Necesar pentru size_t

union MmxVal
{
	Int8   i8[8];   // mmx registers are 64 bits in length, and can hold 8 8bit balues
	Int16  i16[4];  // mmx registers are 64 bits in length, and can hold 4 16bit balues
	Int32  i32[2];  // mmx registers are 64 bits in length, and can hold 2 32bit balues
	Int64  i64[1];  // mmx registers are 64 bits in length, and can hold 1 64bit balues

	UInt8  u8[8];   // mmx registers are 64 bits in length, and can hold 8 8bit balues
	UInt16 u16[4];  // mmx registers are 64 bits in length, and can hold 4 16bit balues
	UInt32 u32[2];  // mmx registers are 64 bits in length, and can hold 2 32bit balues
	UInt64 u64[1];  // mmx registers are 64 bits in length, and can hold 1 64bit balues

	char* ToString_i8(char* s, size_t len);
	char* ToString_i16(char* s, size_t len);
	char* ToString_i32(char* s, size_t len);
	char* ToString_i64(char* s, size_t len);

	char* ToString_u8(char* s, size_t len);
	char* ToString_u16(char* s, size_t len);
	char* ToString_u32(char* s, size_t len);
	char* ToString_u64(char* s, size_t len);

	char* ToString_x8(char* s, size_t len);
	char* ToString_x16(char* s, size_t len);
	char* ToString_x32(char* s, size_t len);
	char* ToString_x64(char* s, size_t len);
};


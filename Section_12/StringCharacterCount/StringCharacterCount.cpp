#include <iostream>
#include <stdlib.h>

extern "C" int CountChar(wchar_t* s, wchar_t c);

int main()
{
    wchar_t c;
    wchar_t* s;
	s = (wchar_t *) L"Hello, World!";
    c = L'e';

    int count = CountChar(s, c);
    
	wprintf(L"The character '%lc' appears %d times in the string \"%ls\".\n", c, count, s);

	return 0;
}


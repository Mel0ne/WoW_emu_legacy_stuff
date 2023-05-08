#include "stdafx.h"

using namespace std;

int main( void ) 
	{ 

	cout << "This is unused, I didn't finish what I was playing with, with this." << endl;
	cin.get();
	return 0;

	LPSTR psz;

	/* get handle to dll */
	HINSTANCE hGetProcIDDLL = LoadLibrary(TEXT("scan.dll"));

	/* get pointer to the function in the dll*/
	FARPROC lpfnGetProcessID = GetProcAddress(HMODULE (hGetProcIDDLL), MAKEINTRESOURCEA(3));

	/*
	Define the Function in the DLL for reuse. This is just prototyping the dll's function.
	A mock of it. Use "stdcall" for maximum compatibility.
	*/

	//	#	Type	Name	Pre-Call Value	Post-Call Value
	//	1	Stack		{ uintp = 324665132, intp = 324665132, psz = 0x1359ff2c  ...}	{ uintp = 324665132, intp = 324665132, psz = 0x1359ff2c  ...}
	// Return value for cheatengine
	//////////////////////////////////////////////////////////////////////////
	// I will be removing this because it's useless to use scan.dll instead of making my own version.
	//////////////////////////////////////////////////////////////////////////

	//typedef int (__stdcall * SCAN_START)(int sone, int stwo, LPSTR psz);

	//SCAN_START MyFunction;
	//MyFunction = SCAN_START(lpfnGetProcessID);

	/* The actual call to the function contained in the dll */
	//int intMyReturnVal = MyFunction(324665132, 324665132, psz);

	printf("PSZ Is: ", &psz);

	/* Release the Dll */
	FreeLibrary(hGetProcIDDLL);

	return 0;

	}
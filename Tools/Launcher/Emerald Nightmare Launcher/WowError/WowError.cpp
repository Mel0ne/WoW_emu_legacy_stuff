// WowError.cpp : main project file.

#include "stdafx.h"
#include "boost\filesystem\path.hpp"
#include "boost\filesystem\operations.hpp"

using namespace std;

bool main(int argc, char *argv[])
	{

#if (!_DEBUG)
	boost::filesystem::path wowexe("wow.exe");

	if( !boost::filesystem::exists(wowexe) )
		{
		cout << "This program must called from wow.exe!" << endl;
		cin.get();
		return 1;
		}
#endif

#if (_DEBUG)

	OutputDebugString("Wow.exe check skipped in debug.\n");

#endif

	int i;
	if (argc == 1)
		{
		cout << "This program must called from wow.exe!" << endl;
		cin.get();
		return 0;
		}
	else for (i = 0; i < argc; i++)
		{
		cout << ("argv[%d] is %s\n", i, argv[i]) << endl;
		}

	ofstream myfile;
	myfile.open("Errors\\WowError.exe.log");
	int il;
	for (il = 0; il < argc; il++)
		{
		myfile << ("argv[%d] is %s\n", il, argv[il]);
		}
	myfile.close();

	delete myfile;

	cout << "\n\n" << endl;
	cout << "World of Warcraft has crashed" << endl;
	cout << "\n\n" << endl;
	cout << "A crash report has been saved in \"World of Warcraft\\Errors\"\n\nupload this file to mediafire if you are able to reproduce this bug\nand make a report,\nlinking this crashdump on our Marforius-Client github \"issues\" section." << endl;
	cout << "\n\n" << endl;
	cout << "This program does nothing but print these lines, as the default\nbugreporter(WowError.exe) carries a risk of reporting private server information to blizzard entertainment." << endl;
	cout << "\n\n" << endl;
	delete [] argv;
	cin.get();
	return(0);
	}

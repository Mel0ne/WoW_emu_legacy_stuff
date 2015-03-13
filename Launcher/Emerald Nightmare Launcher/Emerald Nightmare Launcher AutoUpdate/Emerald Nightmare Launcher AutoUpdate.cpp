#include "stdafx.h"

using namespace System;
using namespace std;


inline void UpdateEverything()
	{
	Sleep(2000); // Trying to prevent any possible lock problems - 2 seconds
	remove( "Emerald Nightmare Launcher.exe" );
	remove( "StormProxy.exe" );
	remove( "WowError.exe" );
	remove( "WardenFix.exe" ); // NYI
	remove( "LauncherVersion.ini" );


	URLDownloadToFile ( NULL, _T("http://www.assembla.com/code/emerald-nightmare-launcher/subversion/node/blob/updates/Emerald%20Nightmare%20Launcher.exe"), _T("Emerald Nightmare Launcher.exe"), 0, NULL );
	URLDownloadToFile ( NULL, _T("http://www.assembla.com/code/emerald-nightmare-launcher/subversion/node/blob/updates/StormProxy.exe"), _T("StormProxy.exe"), 0, NULL );
	URLDownloadToFile ( NULL, _T("http://www.assembla.com/code/emerald-nightmare-launcher/subversion/node/blob/updates/WowError.exe"), _T("WowError.exe"), 0, NULL );
	}

int main(int argc, char *argv[])
	{

#if (!_DEBUG)
	ifstream my_file("wow.exe");

	if( !my_file.is_open() )
		{
		cout << "This program must be called by the launcher." << endl;
			{
			return 0;
			}
		}

	my_file.close();
#endif

#if (_DEBUG)

	OutputDebugString("Wow.exe check skipped in debug.\n");

#endif

	int i;

	if (argc == 1)
		{
		cout << "This program must be called by the launcher." << endl;
		cin.get();
		return 0;
		}
	else for (i = 1; i < argc; i++)
		{
		if (strcmp (argv[i], "-RunMain") == 0)
			{
			UpdateEverything();
			}
		delete [] argv;
		}
	}
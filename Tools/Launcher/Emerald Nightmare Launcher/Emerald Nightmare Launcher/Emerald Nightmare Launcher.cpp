// Emerald Nightmare Launcher.cpp : main project file.

#include "stdafx.h"
#include "Main_Window.h"

using namespace EmeraldNightmareLauncher;
using namespace System;

[STAThreadAttribute]

int main()
	{

#if (!_DEBUG)
	ifstream my_file("wow.exe");

	if( !my_file.is_open() )
		{
		if (MessageBox::Show("This launcher MUST be in the World of Warcraft directory for any functions to work properly.", "Error", MessageBoxButtons::OK, MessageBoxIcon::Error) == DialogResult::OK)
			{
			return 0;
			}
		}

	my_file.close();
#endif

#if (_DEBUG)

	OutputDebugString("Wow.exe check skipped in debug.\n");

#endif



	// Enabling Windows XP visual effects before any controls are created
	Application::EnableVisualStyles();
	Application::SetCompatibleTextRenderingDefault(false); 

	// Create the main window and run it
	Application::Run(gcnew Main_Window());
	return 0;
	}
#include "stdafx.h"

using namespace std;
#pragma once

#include "Download_Window.h"

inline void CreateProcessLauncher(LPSTR ProcessName)
	{
	STARTUPINFO si;
	PROCESS_INFORMATION pi;
	int spi=sizeof(pi);
	int ssi= sizeof(si);
	ZeroMemory( &si, sizeof(si) );
	si.cb=sizeof(STARTUPINFO); //sizeof(si);
	ZeroMemory( &pi, sizeof(pi) );
	int b=0;
	b=CreateProcess( NULL,
		ProcessName,    // Command line.
		NULL,            // Process handle not inheritable.
		NULL,            // Thread handle not inheritable.
		0,          // Set handle inheritance to FALSE.
		ABOVE_NORMAL_PRIORITY_CLASS,               // Do not set Warcraft higher then this, kthx
		NULL,            // Use parent's environment block.
		NULL,            // Use parent's starting directory.
		&si,              // Pointer to STARTUPINFO structure.
		&pi );
	delete ProcessName;
	}


inline bool DeleteDirectoryLauncher(LPCTSTR lpszDir, bool noRecycleBin = true)
	{
	int len = _tcslen(lpszDir);
	TCHAR *pszFrom = new TCHAR[len+2];
	_tcscpy(pszFrom, lpszDir);
	pszFrom[len] = 0;
	pszFrom[len+1] = 0;

	SHFILEOPSTRUCT fileop;
	fileop.hwnd   = NULL;    // no status display
	fileop.wFunc  = FO_DELETE;  // delete operation
	fileop.pFrom  = pszFrom;  // source file name as double null terminated string
	fileop.pTo    = NULL;    // no destination needed
	fileop.fFlags = FOF_NOCONFIRMATION|FOF_SILENT;  // do not prompt the user

	if(!noRecycleBin)
		fileop.fFlags |= FOF_ALLOWUNDO;

	fileop.fAnyOperationsAborted = FALSE;
	fileop.lpszProgressTitle     = NULL;
	fileop.hNameMappings         = NULL;

	int ret = SHFileOperation(&fileop);
	delete [] pszFrom;
	delete lpszDir;
	return (ret == 0);
	}

namespace EmeraldNightmareLauncher {

	using namespace System;
	using namespace System::ComponentModel;
	using namespace System::Collections;
	using namespace System::Windows::Forms;
	using namespace System::Data;
	using namespace System::Drawing;
	using namespace System::Diagnostics;

	/// <summary>
	/// Summary for Main_Window
	/// </summary>
	public ref class Main_Window : public System::Windows::Forms::Form
		{
		public:
			Main_Window(void)
				{
				InitializeComponent();
				//
				//TODO: Add the constructor code here
				//
				}

		protected:
			/// <summary>
			/// Clean up any resources being used.
			/// </summary>
			~Main_Window()
				{
				if (components)
					{
					delete components;
					}
				}
		private: System::Windows::Forms::WebBrowser^  webBrowser1;
		private: System::Windows::Forms::Button^  button1;

		private: System::Windows::Forms::MenuStrip^  menuStrip1;
		private: System::Windows::Forms::ToolStripMenuItem^  test1ToolStripMenuItem;
		private: System::Windows::Forms::ToolStripMenuItem^  forceLauncherUpdateToolStripMenuItem;


		private: System::Windows::Forms::ToolStripMenuItem^  cleanupToolStripMenuItem;
		private: System::Windows::Forms::ToolStripMenuItem^  consolidatePatchesToolStripMenuItem;
		private: System::Windows::Forms::ToolStripMenuItem^  deleteSettingsToolStripMenuItem;
		private: System::Windows::Forms::ToolStripMenuItem^  deleteNonessentialFilesToolStripMenuItem;
		private: System::Windows::Forms::ToolStripMenuItem^  clientSystemChecksToolStripMenuItem;
		private: System::Windows::Forms::ToolStripMenuItem^  mD5CheckArchivesToolStripMenuItem1;
		private: System::Windows::Forms::ToolStripMenuItem^  deleteWarcraftsCacheToolStripMenuItem;
		private: System::Windows::Forms::ToolStripMenuItem^  addOnsToolStripMenuItem;
		private: System::Windows::Forms::ToolStripMenuItem^  downloadReccomendedAddonsToolStripMenuItem;
		private: System::Windows::Forms::ToolStripMenuItem^  shareGathererDataAcrossAllAccountsToolStripMenuItem;

		private: System::Windows::Forms::ToolStripMenuItem^  marforiusClientToolStripMenuItem;
		private: System::Windows::Forms::ToolStripMenuItem^  downloadMarforiusClientToolStripMenuItem;
		private: System::Windows::Forms::ToolStripMenuItem^  editSavedServersToolStripMenuItem;
		private: System::Windows::Forms::ToolStripMenuItem^  clientSystemCheckToolStripMenuItem;
		private: System::Windows::Forms::ToolStripMenuItem^  developerToolStripMenuItem;

		private: System::Windows::Forms::ToolStripMenuItem^  gMToolStripMenuItem;
		private: System::Windows::Forms::ToolStripMenuItem^  toggleDebugToolStripMenuItem;
		private: System::Windows::Forms::ToolStripMenuItem^  downloadAddOnToolStripMenuItem;
		private: System::Windows::Forms::ToolStripMenuItem^  deleteARCHIVEFrameGlueAddOnsToolStripMenuItem;
		private: System::Windows::Forms::LinkLabel^  LauncherAlertBox;
		private: System::Windows::Forms::ToolStripMenuItem^  aboutToolStripMenuItem;




		private:
			/// <summary>
			/// Required designer variable.
			/// </summary>
			System::ComponentModel::Container ^components;

#pragma region Windows Form Designer generated code
			/// <summary>
			/// Required method for Designer support - do not modify
			/// the contents of this method with the code editor.
			/// </summary>
			void InitializeComponent(void)
				{
				System::ComponentModel::ComponentResourceManager^  resources = (gcnew System::ComponentModel::ComponentResourceManager(Main_Window::typeid));
				this->webBrowser1 = (gcnew System::Windows::Forms::WebBrowser());
				this->button1 = (gcnew System::Windows::Forms::Button());
				this->menuStrip1 = (gcnew System::Windows::Forms::MenuStrip());
				this->test1ToolStripMenuItem = (gcnew System::Windows::Forms::ToolStripMenuItem());
				this->forceLauncherUpdateToolStripMenuItem = (gcnew System::Windows::Forms::ToolStripMenuItem());
				this->cleanupToolStripMenuItem = (gcnew System::Windows::Forms::ToolStripMenuItem());
				this->consolidatePatchesToolStripMenuItem = (gcnew System::Windows::Forms::ToolStripMenuItem());
				this->deleteSettingsToolStripMenuItem = (gcnew System::Windows::Forms::ToolStripMenuItem());
				this->deleteNonessentialFilesToolStripMenuItem = (gcnew System::Windows::Forms::ToolStripMenuItem());
				this->deleteWarcraftsCacheToolStripMenuItem = (gcnew System::Windows::Forms::ToolStripMenuItem());
				this->clientSystemChecksToolStripMenuItem = (gcnew System::Windows::Forms::ToolStripMenuItem());
				this->mD5CheckArchivesToolStripMenuItem1 = (gcnew System::Windows::Forms::ToolStripMenuItem());
				this->addOnsToolStripMenuItem = (gcnew System::Windows::Forms::ToolStripMenuItem());
				this->downloadReccomendedAddonsToolStripMenuItem = (gcnew System::Windows::Forms::ToolStripMenuItem());
				this->shareGathererDataAcrossAllAccountsToolStripMenuItem = (gcnew System::Windows::Forms::ToolStripMenuItem());
				this->marforiusClientToolStripMenuItem = (gcnew System::Windows::Forms::ToolStripMenuItem());
				this->downloadMarforiusClientToolStripMenuItem = (gcnew System::Windows::Forms::ToolStripMenuItem());
				this->editSavedServersToolStripMenuItem = (gcnew System::Windows::Forms::ToolStripMenuItem());
				this->clientSystemCheckToolStripMenuItem = (gcnew System::Windows::Forms::ToolStripMenuItem());
				this->deleteARCHIVEFrameGlueAddOnsToolStripMenuItem = (gcnew System::Windows::Forms::ToolStripMenuItem());
				this->developerToolStripMenuItem = (gcnew System::Windows::Forms::ToolStripMenuItem());
				this->toggleDebugToolStripMenuItem = (gcnew System::Windows::Forms::ToolStripMenuItem());
				this->gMToolStripMenuItem = (gcnew System::Windows::Forms::ToolStripMenuItem());
				this->downloadAddOnToolStripMenuItem = (gcnew System::Windows::Forms::ToolStripMenuItem());
				this->aboutToolStripMenuItem = (gcnew System::Windows::Forms::ToolStripMenuItem());
				this->LauncherAlertBox = (gcnew System::Windows::Forms::LinkLabel());
				this->menuStrip1->SuspendLayout();
				this->SuspendLayout();
				// 
				// webBrowser1
				// 
				this->webBrowser1->AllowWebBrowserDrop = false;
				this->webBrowser1->Anchor = System::Windows::Forms::AnchorStyles::Top;
				this->webBrowser1->Location = System::Drawing::Point(0, 24);
				this->webBrowser1->Margin = System::Windows::Forms::Padding(0);
				this->webBrowser1->MinimumSize = System::Drawing::Size(20, 20);
				this->webBrowser1->Name = L"webBrowser1";
				this->webBrowser1->ScriptErrorsSuppressed = true;
				this->webBrowser1->ScrollBarsEnabled = false;
				this->webBrowser1->Size = System::Drawing::Size(636, 402);
				this->webBrowser1->TabIndex = 0;
				this->webBrowser1->Url = (gcnew System::Uri(L"http://www.assembla.com/code/emerald-nightmare-launcher/subversion/node/blob/inde" 
					L"x.html", 
					System::UriKind::Absolute));
				this->webBrowser1->DocumentCompleted += gcnew System::Windows::Forms::WebBrowserDocumentCompletedEventHandler(this, &Main_Window::webBrowser1_DocumentCompleted);
				// 
				// button1
				// 
				this->button1->AutoSize = true;
				this->button1->AutoSizeMode = System::Windows::Forms::AutoSizeMode::GrowAndShrink;
				this->button1->BackColor = System::Drawing::Color::Transparent;
				this->button1->BackgroundImage = (cli::safe_cast<System::Drawing::Image^  >(resources->GetObject(L"button1.BackgroundImage")));
				this->button1->FlatAppearance->BorderColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(0)), 
					static_cast<System::Int32>(static_cast<System::Byte>(192)), static_cast<System::Int32>(static_cast<System::Byte>(0)));
				this->button1->FlatAppearance->BorderSize = 10;
				this->button1->FlatAppearance->MouseDownBackColor = System::Drawing::Color::Lime;
				this->button1->FlatAppearance->MouseOverBackColor = System::Drawing::Color::Green;
				this->button1->ForeColor = System::Drawing::Color::Transparent;
				this->button1->Image = (cli::safe_cast<System::Drawing::Image^  >(resources->GetObject(L"button1.Image")));
				this->button1->Location = System::Drawing::Point(489, 426);
				this->button1->Margin = System::Windows::Forms::Padding(0);
				this->button1->Name = L"button1";
				this->button1->Size = System::Drawing::Size(147, 90);
				this->button1->TabIndex = 1;
				this->button1->UseVisualStyleBackColor = false;
				this->button1->Click += gcnew System::EventHandler(this, &Main_Window::button1_Click);
				// 
				// menuStrip1
				// 
				this->menuStrip1->BackColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(31)), static_cast<System::Int32>(static_cast<System::Byte>(44)), 
					static_cast<System::Int32>(static_cast<System::Byte>(67)));
				this->menuStrip1->Items->AddRange(gcnew cli::array< System::Windows::Forms::ToolStripItem^  >(8) {this->test1ToolStripMenuItem, 
					this->cleanupToolStripMenuItem, this->clientSystemChecksToolStripMenuItem, this->addOnsToolStripMenuItem, this->marforiusClientToolStripMenuItem, 
					this->developerToolStripMenuItem, this->gMToolStripMenuItem, this->aboutToolStripMenuItem});
				this->menuStrip1->Location = System::Drawing::Point(0, 0);
				this->menuStrip1->Name = L"menuStrip1";
				this->menuStrip1->RenderMode = System::Windows::Forms::ToolStripRenderMode::Professional;
				this->menuStrip1->Size = System::Drawing::Size(636, 24);
				this->menuStrip1->TabIndex = 3;
				this->menuStrip1->Text = L"menuStrip1";
				this->menuStrip1->ItemClicked += gcnew System::Windows::Forms::ToolStripItemClickedEventHandler(this, &Main_Window::menuStrip1_ItemClicked);
				// 
				// test1ToolStripMenuItem
				// 
				this->test1ToolStripMenuItem->BackColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(31)), 
					static_cast<System::Int32>(static_cast<System::Byte>(44)), static_cast<System::Int32>(static_cast<System::Byte>(67)));
				this->test1ToolStripMenuItem->DropDownItems->AddRange(gcnew cli::array< System::Windows::Forms::ToolStripItem^  >(1) {this->forceLauncherUpdateToolStripMenuItem});
				this->test1ToolStripMenuItem->ForeColor = System::Drawing::Color::White;
				this->test1ToolStripMenuItem->ImageTransparentColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(15)), 
					static_cast<System::Int32>(static_cast<System::Byte>(21)), static_cast<System::Int32>(static_cast<System::Byte>(34)));
				this->test1ToolStripMenuItem->Name = L"test1ToolStripMenuItem";
				this->test1ToolStripMenuItem->Size = System::Drawing::Size(59, 20);
				this->test1ToolStripMenuItem->Text = L"General";
				this->test1ToolStripMenuItem->TextImageRelation = System::Windows::Forms::TextImageRelation::TextAboveImage;
				this->test1ToolStripMenuItem->Click += gcnew System::EventHandler(this, &Main_Window::test1ToolStripMenuItem_Click);
				// 
				// forceLauncherUpdateToolStripMenuItem
				// 
				this->forceLauncherUpdateToolStripMenuItem->BackColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(14)), 
					static_cast<System::Int32>(static_cast<System::Byte>(20)), static_cast<System::Int32>(static_cast<System::Byte>(31)));
				this->forceLauncherUpdateToolStripMenuItem->ForeColor = System::Drawing::Color::White;
				this->forceLauncherUpdateToolStripMenuItem->Name = L"forceLauncherUpdateToolStripMenuItem";
				this->forceLauncherUpdateToolStripMenuItem->Size = System::Drawing::Size(196, 22);
				this->forceLauncherUpdateToolStripMenuItem->Text = L"Force Launcher Update";
				this->forceLauncherUpdateToolStripMenuItem->Click += gcnew System::EventHandler(this, &Main_Window::forceLauncherUpdateToolStripMenuItem_Click);
				// 
				// cleanupToolStripMenuItem
				// 
				this->cleanupToolStripMenuItem->BackColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(31)), 
					static_cast<System::Int32>(static_cast<System::Byte>(44)), static_cast<System::Int32>(static_cast<System::Byte>(67)));
				this->cleanupToolStripMenuItem->DropDownItems->AddRange(gcnew cli::array< System::Windows::Forms::ToolStripItem^  >(4) {this->consolidatePatchesToolStripMenuItem, 
					this->deleteSettingsToolStripMenuItem, this->deleteNonessentialFilesToolStripMenuItem, this->deleteWarcraftsCacheToolStripMenuItem});
				this->cleanupToolStripMenuItem->ForeColor = System::Drawing::Color::White;
				this->cleanupToolStripMenuItem->ImageTransparentColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(15)), 
					static_cast<System::Int32>(static_cast<System::Byte>(21)), static_cast<System::Int32>(static_cast<System::Byte>(34)));
				this->cleanupToolStripMenuItem->Name = L"cleanupToolStripMenuItem";
				this->cleanupToolStripMenuItem->Size = System::Drawing::Size(63, 20);
				this->cleanupToolStripMenuItem->Text = L"Cleanup";
				this->cleanupToolStripMenuItem->TextImageRelation = System::Windows::Forms::TextImageRelation::TextAboveImage;
				// 
				// consolidatePatchesToolStripMenuItem
				// 
				this->consolidatePatchesToolStripMenuItem->BackColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(14)), 
					static_cast<System::Int32>(static_cast<System::Byte>(20)), static_cast<System::Int32>(static_cast<System::Byte>(31)));
				this->consolidatePatchesToolStripMenuItem->ForeColor = System::Drawing::Color::White;
				this->consolidatePatchesToolStripMenuItem->Name = L"consolidatePatchesToolStripMenuItem";
				this->consolidatePatchesToolStripMenuItem->Size = System::Drawing::Size(209, 22);
				this->consolidatePatchesToolStripMenuItem->Text = L"Consolidate Patches";
				this->consolidatePatchesToolStripMenuItem->Click += gcnew System::EventHandler(this, &Main_Window::consolidatePatchesToolStripMenuItem_Click);
				// 
				// deleteSettingsToolStripMenuItem
				// 
				this->deleteSettingsToolStripMenuItem->BackColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(14)), 
					static_cast<System::Int32>(static_cast<System::Byte>(20)), static_cast<System::Int32>(static_cast<System::Byte>(31)));
				this->deleteSettingsToolStripMenuItem->ForeColor = System::Drawing::Color::White;
				this->deleteSettingsToolStripMenuItem->Name = L"deleteSettingsToolStripMenuItem";
				this->deleteSettingsToolStripMenuItem->Size = System::Drawing::Size(209, 22);
				this->deleteSettingsToolStripMenuItem->Text = L"Delete Settings";
				this->deleteSettingsToolStripMenuItem->Click += gcnew System::EventHandler(this, &Main_Window::deleteSettingsToolStripMenuItem_Click);
				// 
				// deleteNonessentialFilesToolStripMenuItem
				// 
				this->deleteNonessentialFilesToolStripMenuItem->BackColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(14)), 
					static_cast<System::Int32>(static_cast<System::Byte>(20)), static_cast<System::Int32>(static_cast<System::Byte>(31)));
				this->deleteNonessentialFilesToolStripMenuItem->ForeColor = System::Drawing::Color::White;
				this->deleteNonessentialFilesToolStripMenuItem->Name = L"deleteNonessentialFilesToolStripMenuItem";
				this->deleteNonessentialFilesToolStripMenuItem->Size = System::Drawing::Size(209, 22);
				this->deleteNonessentialFilesToolStripMenuItem->Text = L"Delete Non-Essential Files";
				this->deleteNonessentialFilesToolStripMenuItem->Click += gcnew System::EventHandler(this, &Main_Window::deleteNonessentialFilesToolStripMenuItem_Click);
				// 
				// deleteWarcraftsCacheToolStripMenuItem
				// 
				this->deleteWarcraftsCacheToolStripMenuItem->BackColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(14)), 
					static_cast<System::Int32>(static_cast<System::Byte>(20)), static_cast<System::Int32>(static_cast<System::Byte>(31)));
				this->deleteWarcraftsCacheToolStripMenuItem->ForeColor = System::Drawing::Color::White;
				this->deleteWarcraftsCacheToolStripMenuItem->Name = L"deleteWarcraftsCacheToolStripMenuItem";
				this->deleteWarcraftsCacheToolStripMenuItem->Size = System::Drawing::Size(209, 22);
				this->deleteWarcraftsCacheToolStripMenuItem->Text = L"Delete Warcraft\'s Cache";
				this->deleteWarcraftsCacheToolStripMenuItem->Click += gcnew System::EventHandler(this, &Main_Window::deleteWarcraftsCacheToolStripMenuItem_Click_1);
				// 
				// clientSystemChecksToolStripMenuItem
				// 
				this->clientSystemChecksToolStripMenuItem->BackColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(31)), 
					static_cast<System::Int32>(static_cast<System::Byte>(44)), static_cast<System::Int32>(static_cast<System::Byte>(67)));
				this->clientSystemChecksToolStripMenuItem->DropDownItems->AddRange(gcnew cli::array< System::Windows::Forms::ToolStripItem^  >(1) {this->mD5CheckArchivesToolStripMenuItem1});
				this->clientSystemChecksToolStripMenuItem->ForeColor = System::Drawing::Color::White;
				this->clientSystemChecksToolStripMenuItem->ImageTransparentColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(15)), 
					static_cast<System::Int32>(static_cast<System::Byte>(21)), static_cast<System::Int32>(static_cast<System::Byte>(34)));
				this->clientSystemChecksToolStripMenuItem->Name = L"clientSystemChecksToolStripMenuItem";
				this->clientSystemChecksToolStripMenuItem->Size = System::Drawing::Size(129, 20);
				this->clientSystemChecksToolStripMenuItem->Text = L"ClientSystem Checks";
				this->clientSystemChecksToolStripMenuItem->TextImageRelation = System::Windows::Forms::TextImageRelation::TextAboveImage;
				this->clientSystemChecksToolStripMenuItem->Click += gcnew System::EventHandler(this, &Main_Window::clientSystemChecksToolStripMenuItem_Click);
				// 
				// mD5CheckArchivesToolStripMenuItem1
				// 
				this->mD5CheckArchivesToolStripMenuItem1->BackColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(14)), 
					static_cast<System::Int32>(static_cast<System::Byte>(20)), static_cast<System::Int32>(static_cast<System::Byte>(31)));
				this->mD5CheckArchivesToolStripMenuItem1->ForeColor = System::Drawing::Color::White;
				this->mD5CheckArchivesToolStripMenuItem1->Name = L"mD5CheckArchivesToolStripMenuItem1";
				this->mD5CheckArchivesToolStripMenuItem1->Size = System::Drawing::Size(181, 22);
				this->mD5CheckArchivesToolStripMenuItem1->Text = L"MD5 Check archives";
				this->mD5CheckArchivesToolStripMenuItem1->Click += gcnew System::EventHandler(this, &Main_Window::mD5CheckArchivesToolStripMenuItem1_Click);
				// 
				// addOnsToolStripMenuItem
				// 
				this->addOnsToolStripMenuItem->BackColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(31)), 
					static_cast<System::Int32>(static_cast<System::Byte>(44)), static_cast<System::Int32>(static_cast<System::Byte>(67)));
				this->addOnsToolStripMenuItem->DropDownItems->AddRange(gcnew cli::array< System::Windows::Forms::ToolStripItem^  >(2) {this->downloadReccomendedAddonsToolStripMenuItem, 
					this->shareGathererDataAcrossAllAccountsToolStripMenuItem});
				this->addOnsToolStripMenuItem->ForeColor = System::Drawing::Color::White;
				this->addOnsToolStripMenuItem->ImageTransparentColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(15)), 
					static_cast<System::Int32>(static_cast<System::Byte>(21)), static_cast<System::Int32>(static_cast<System::Byte>(34)));
				this->addOnsToolStripMenuItem->Name = L"addOnsToolStripMenuItem";
				this->addOnsToolStripMenuItem->Size = System::Drawing::Size(62, 20);
				this->addOnsToolStripMenuItem->Text = L"AddOns";
				this->addOnsToolStripMenuItem->TextImageRelation = System::Windows::Forms::TextImageRelation::TextAboveImage;
				// 
				// downloadReccomendedAddonsToolStripMenuItem
				// 
				this->downloadReccomendedAddonsToolStripMenuItem->BackColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(14)), 
					static_cast<System::Int32>(static_cast<System::Byte>(20)), static_cast<System::Int32>(static_cast<System::Byte>(31)));
				this->downloadReccomendedAddonsToolStripMenuItem->ForeColor = System::Drawing::Color::White;
				this->downloadReccomendedAddonsToolStripMenuItem->Name = L"downloadReccomendedAddonsToolStripMenuItem";
				this->downloadReccomendedAddonsToolStripMenuItem->Size = System::Drawing::Size(286, 22);
				this->downloadReccomendedAddonsToolStripMenuItem->Text = L"Download Recommended Addons";
				this->downloadReccomendedAddonsToolStripMenuItem->Click += gcnew System::EventHandler(this, &Main_Window::downloadReccomendedAddonsToolStripMenuItem_Click);
				// 
				// shareGathererDataAcrossAllAccountsToolStripMenuItem
				// 
				this->shareGathererDataAcrossAllAccountsToolStripMenuItem->BackColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(14)), 
					static_cast<System::Int32>(static_cast<System::Byte>(20)), static_cast<System::Int32>(static_cast<System::Byte>(31)));
				this->shareGathererDataAcrossAllAccountsToolStripMenuItem->ForeColor = System::Drawing::Color::White;
				this->shareGathererDataAcrossAllAccountsToolStripMenuItem->Name = L"shareGathererDataAcrossAllAccountsToolStripMenuItem";
				this->shareGathererDataAcrossAllAccountsToolStripMenuItem->Size = System::Drawing::Size(286, 22);
				this->shareGathererDataAcrossAllAccountsToolStripMenuItem->Text = L"Share Gatherer Data Across All Accounts";
				this->shareGathererDataAcrossAllAccountsToolStripMenuItem->Click += gcnew System::EventHandler(this, &Main_Window::shareGathererDataAcrossAllAccountsToolStripMenuItem_Click);
				// 
				// marforiusClientToolStripMenuItem
				// 
				this->marforiusClientToolStripMenuItem->BackColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(31)), 
					static_cast<System::Int32>(static_cast<System::Byte>(44)), static_cast<System::Int32>(static_cast<System::Byte>(67)));
				this->marforiusClientToolStripMenuItem->DropDownItems->AddRange(gcnew cli::array< System::Windows::Forms::ToolStripItem^  >(4) {this->downloadMarforiusClientToolStripMenuItem, 
					this->editSavedServersToolStripMenuItem, this->clientSystemCheckToolStripMenuItem, this->deleteARCHIVEFrameGlueAddOnsToolStripMenuItem});
				this->marforiusClientToolStripMenuItem->ForeColor = System::Drawing::Color::White;
				this->marforiusClientToolStripMenuItem->ImageTransparentColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(15)), 
					static_cast<System::Int32>(static_cast<System::Byte>(21)), static_cast<System::Int32>(static_cast<System::Byte>(34)));
				this->marforiusClientToolStripMenuItem->Name = L"marforiusClientToolStripMenuItem";
				this->marforiusClientToolStripMenuItem->Size = System::Drawing::Size(106, 20);
				this->marforiusClientToolStripMenuItem->Text = L"Marforius-Client";
				this->marforiusClientToolStripMenuItem->TextImageRelation = System::Windows::Forms::TextImageRelation::TextAboveImage;
				// 
				// downloadMarforiusClientToolStripMenuItem
				// 
				this->downloadMarforiusClientToolStripMenuItem->BackColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(14)), 
					static_cast<System::Int32>(static_cast<System::Byte>(20)), static_cast<System::Int32>(static_cast<System::Byte>(31)));
				this->downloadMarforiusClientToolStripMenuItem->ForeColor = System::Drawing::Color::White;
				this->downloadMarforiusClientToolStripMenuItem->Name = L"downloadMarforiusClientToolStripMenuItem";
				this->downloadMarforiusClientToolStripMenuItem->Size = System::Drawing::Size(271, 22);
				this->downloadMarforiusClientToolStripMenuItem->Text = L"Download Marforius-Client";
				this->downloadMarforiusClientToolStripMenuItem->Click += gcnew System::EventHandler(this, &Main_Window::downloadMarforiusClientToolStripMenuItem_Click);
				// 
				// editSavedServersToolStripMenuItem
				// 
				this->editSavedServersToolStripMenuItem->BackColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(14)), 
					static_cast<System::Int32>(static_cast<System::Byte>(20)), static_cast<System::Int32>(static_cast<System::Byte>(31)));
				this->editSavedServersToolStripMenuItem->ForeColor = System::Drawing::Color::White;
				this->editSavedServersToolStripMenuItem->Name = L"editSavedServersToolStripMenuItem";
				this->editSavedServersToolStripMenuItem->Size = System::Drawing::Size(271, 22);
				this->editSavedServersToolStripMenuItem->Text = L"Edit Saved Servers";
				this->editSavedServersToolStripMenuItem->Click += gcnew System::EventHandler(this, &Main_Window::editSavedServersToolStripMenuItem_Click);
				// 
				// clientSystemCheckToolStripMenuItem
				// 
				this->clientSystemCheckToolStripMenuItem->BackColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(14)), 
					static_cast<System::Int32>(static_cast<System::Byte>(20)), static_cast<System::Int32>(static_cast<System::Byte>(31)));
				this->clientSystemCheckToolStripMenuItem->ForeColor = System::Drawing::Color::White;
				this->clientSystemCheckToolStripMenuItem->Name = L"clientSystemCheckToolStripMenuItem";
				this->clientSystemCheckToolStripMenuItem->Size = System::Drawing::Size(271, 22);
				this->clientSystemCheckToolStripMenuItem->Text = L"ClientSystem Check";
				this->clientSystemCheckToolStripMenuItem->Click += gcnew System::EventHandler(this, &Main_Window::clientSystemCheckToolStripMenuItem_Click);
				// 
				// deleteARCHIVEFrameGlueAddOnsToolStripMenuItem
				// 
				this->deleteARCHIVEFrameGlueAddOnsToolStripMenuItem->BackColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(12)), 
					static_cast<System::Int32>(static_cast<System::Byte>(20)), static_cast<System::Int32>(static_cast<System::Byte>(31)));
				this->deleteARCHIVEFrameGlueAddOnsToolStripMenuItem->ForeColor = System::Drawing::Color::White;
				this->deleteARCHIVEFrameGlueAddOnsToolStripMenuItem->Name = L"deleteARCHIVEFrameGlueAddOnsToolStripMenuItem";
				this->deleteARCHIVEFrameGlueAddOnsToolStripMenuItem->Size = System::Drawing::Size(271, 22);
				this->deleteARCHIVEFrameGlueAddOnsToolStripMenuItem->Text = L"Delete ARCHIVE Frame/Glue/AddOns";
				this->deleteARCHIVEFrameGlueAddOnsToolStripMenuItem->Click += gcnew System::EventHandler(this, &Main_Window::deleteARCHIVEFrameGlueAddOnsToolStripMenuItem_Click);
				// 
				// developerToolStripMenuItem
				// 
				this->developerToolStripMenuItem->BackColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(31)), 
					static_cast<System::Int32>(static_cast<System::Byte>(44)), static_cast<System::Int32>(static_cast<System::Byte>(67)));
				this->developerToolStripMenuItem->DropDownItems->AddRange(gcnew cli::array< System::Windows::Forms::ToolStripItem^  >(1) {this->toggleDebugToolStripMenuItem});
				this->developerToolStripMenuItem->ForeColor = System::Drawing::Color::White;
				this->developerToolStripMenuItem->ImageTransparentColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(15)), 
					static_cast<System::Int32>(static_cast<System::Byte>(21)), static_cast<System::Int32>(static_cast<System::Byte>(34)));
				this->developerToolStripMenuItem->Name = L"developerToolStripMenuItem";
				this->developerToolStripMenuItem->Size = System::Drawing::Size(72, 20);
				this->developerToolStripMenuItem->Text = L"Developer";
				this->developerToolStripMenuItem->TextImageRelation = System::Windows::Forms::TextImageRelation::TextAboveImage;
				// 
				// toggleDebugToolStripMenuItem
				// 
				this->toggleDebugToolStripMenuItem->BackColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(12)), 
					static_cast<System::Int32>(static_cast<System::Byte>(20)), static_cast<System::Int32>(static_cast<System::Byte>(31)));
				this->toggleDebugToolStripMenuItem->ForeColor = System::Drawing::Color::White;
				this->toggleDebugToolStripMenuItem->Name = L"toggleDebugToolStripMenuItem";
				this->toggleDebugToolStripMenuItem->Size = System::Drawing::Size(152, 22);
				this->toggleDebugToolStripMenuItem->Text = L"Toggle Debug";
				this->toggleDebugToolStripMenuItem->Click += gcnew System::EventHandler(this, &Main_Window::toggleDebugToolStripMenuItem_Click);
				// 
				// gMToolStripMenuItem
				// 
				this->gMToolStripMenuItem->BackColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(31)), 
					static_cast<System::Int32>(static_cast<System::Byte>(44)), static_cast<System::Int32>(static_cast<System::Byte>(67)));
				this->gMToolStripMenuItem->DropDownItems->AddRange(gcnew cli::array< System::Windows::Forms::ToolStripItem^  >(1) {this->downloadAddOnToolStripMenuItem});
				this->gMToolStripMenuItem->ForeColor = System::Drawing::Color::White;
				this->gMToolStripMenuItem->ImageTransparentColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(15)), 
					static_cast<System::Int32>(static_cast<System::Byte>(21)), static_cast<System::Int32>(static_cast<System::Byte>(34)));
				this->gMToolStripMenuItem->Name = L"gMToolStripMenuItem";
				this->gMToolStripMenuItem->Size = System::Drawing::Size(38, 20);
				this->gMToolStripMenuItem->Text = L"GM";
				this->gMToolStripMenuItem->TextImageRelation = System::Windows::Forms::TextImageRelation::TextAboveImage;
				// 
				// downloadAddOnToolStripMenuItem
				// 
				this->downloadAddOnToolStripMenuItem->BackColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(12)), 
					static_cast<System::Int32>(static_cast<System::Byte>(20)), static_cast<System::Int32>(static_cast<System::Byte>(31)));
				this->downloadAddOnToolStripMenuItem->ForeColor = System::Drawing::Color::White;
				this->downloadAddOnToolStripMenuItem->Name = L"downloadAddOnToolStripMenuItem";
				this->downloadAddOnToolStripMenuItem->Size = System::Drawing::Size(169, 22);
				this->downloadAddOnToolStripMenuItem->Text = L"Download AddOn";
				this->downloadAddOnToolStripMenuItem->Click += gcnew System::EventHandler(this, &Main_Window::downloadAddOnToolStripMenuItem_Click);
				// 
				// aboutToolStripMenuItem
				// 
				this->aboutToolStripMenuItem->ForeColor = System::Drawing::Color::White;
				this->aboutToolStripMenuItem->Name = L"aboutToolStripMenuItem";
				this->aboutToolStripMenuItem->Size = System::Drawing::Size(52, 20);
				this->aboutToolStripMenuItem->Text = L"About";
				this->aboutToolStripMenuItem->Click += gcnew System::EventHandler(this, &Main_Window::aboutToolStripMenuItem_Click);
				// 
				// LauncherAlertBox
				// 
				this->LauncherAlertBox->ActiveLinkColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(0)), 
					static_cast<System::Int32>(static_cast<System::Byte>(64)), static_cast<System::Int32>(static_cast<System::Byte>(0)));
				this->LauncherAlertBox->BackColor = System::Drawing::Color::Transparent;
				this->LauncherAlertBox->CausesValidation = false;
				this->LauncherAlertBox->DisabledLinkColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(0)), 
					static_cast<System::Int32>(static_cast<System::Byte>(64)), static_cast<System::Int32>(static_cast<System::Byte>(0)));
				this->LauncherAlertBox->Font = (gcnew System::Drawing::Font(L"Tahoma", 9, System::Drawing::FontStyle::Bold, System::Drawing::GraphicsUnit::Point, 
					static_cast<System::Byte>(0)));
				this->LauncherAlertBox->ForeColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(0)), static_cast<System::Int32>(static_cast<System::Byte>(64)), 
					static_cast<System::Int32>(static_cast<System::Byte>(0)));
				this->LauncherAlertBox->Image = (cli::safe_cast<System::Drawing::Image^  >(resources->GetObject(L"LauncherAlertBox.Image")));
				this->LauncherAlertBox->LinkColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(0)), static_cast<System::Int32>(static_cast<System::Byte>(64)), 
					static_cast<System::Int32>(static_cast<System::Byte>(0)));
				this->LauncherAlertBox->Location = System::Drawing::Point(-3, 426);
				this->LauncherAlertBox->Name = L"LauncherAlertBox";
				this->LauncherAlertBox->Size = System::Drawing::Size(497, 90);
				this->LauncherAlertBox->TabIndex = 4;
				// 
				// Main_Window
				// 
				this->AcceptButton = this->button1;
				this->AutoScaleDimensions = System::Drawing::SizeF(6, 13);
				this->AutoScaleMode = System::Windows::Forms::AutoScaleMode::Font;
				this->AutoSize = true;
				this->BackColor = System::Drawing::Color::FromArgb(static_cast<System::Int32>(static_cast<System::Byte>(20)), static_cast<System::Int32>(static_cast<System::Byte>(20)), 
					static_cast<System::Int32>(static_cast<System::Byte>(20)));
				this->BackgroundImage = (cli::safe_cast<System::Drawing::Image^  >(resources->GetObject(L"$this.BackgroundImage")));
				this->ClientSize = System::Drawing::Size(636, 513);
				this->Controls->Add(this->menuStrip1);
				this->Controls->Add(this->button1);
				this->Controls->Add(this->webBrowser1);
				this->Controls->Add(this->LauncherAlertBox);
				this->DoubleBuffered = true;
				this->FormBorderStyle = System::Windows::Forms::FormBorderStyle::Fixed3D;
				this->Icon = (cli::safe_cast<System::Drawing::Icon^  >(resources->GetObject(L"$this.Icon")));
				this->MainMenuStrip = this->menuStrip1;
				this->MaximizeBox = false;
				this->Name = L"Main_Window";
				this->SizeGripStyle = System::Windows::Forms::SizeGripStyle::Hide;
				this->StartPosition = System::Windows::Forms::FormStartPosition::CenterScreen;
				this->Text = L"Emerald Nightmare Launcher";
				this->Load += gcnew System::EventHandler(this, &Main_Window::Main_Window_Load);
				this->menuStrip1->ResumeLayout(false);
				this->menuStrip1->PerformLayout();
				this->ResumeLayout(false);
				this->PerformLayout();

				}
#pragma endregion
		private: System::Void webBrowser1_DocumentCompleted(System::Object^  sender, System::Windows::Forms::WebBrowserDocumentCompletedEventArgs^  e) {

					 // The following is a model of the update process:
					 // Download LauncherVersion.ini
					 // Open and store value in string
					 // Compare VersionAtCompile and VersionOfRemoteIni
					 // if remote greater then version at compile, then call autoupdater.exe -RunMain :: Autoupdater will delete this file, and update it with whatever is in the remote /updates/ directory
					 // fin, really simple versioning/update system

					 URLDownloadToFile ( NULL, _T("http://www.assembla.com/code/emerald-nightmare-launcher/subversion/node/blob/updates/LauncherVersion.ini"), _T("LauncherVersion.ini"), 0, NULL );

					 int VersionAtCompile=2; // remember to set this

					 string VerofRemoteBeforeConvert;
					 ifstream infile;
					 infile.open ("LauncherVersion.ini");
					 getline(infile,VerofRemoteBeforeConvert); // Saves the line in STRING.
					 infile.close();
					 delete infile;

					 int VersionOfRemoteIni = atoi( VerofRemoteBeforeConvert.c_str() ); // convert...

					 if(VersionOfRemoteIni > VersionAtCompile)
						 {
						 URLDownloadToFile ( NULL, _T("http://www.assembla.com/code/emerald-nightmare-launcher/subversion/node/blob/updates/AutoUpdater.exe"), _T("AutoUpdater.exe"), 0, NULL );
						 LauncherAlertBox->Text->Empty;
						 LauncherAlertBox->Text = "An updated version is available, one moment while the launcher is updated.";
						 Sleep(5000);
						 VerofRemoteBeforeConvert.clear();
						 VersionAtCompile = 0;
						 VersionOfRemoteIni = 0;
						 CreateProcessLauncher("AutoUpdater.exe -RunMain");
						 EmeraldNightmareLauncher::Main_Window::Close();
						 }
					 VerofRemoteBeforeConvert.clear();
					 VersionAtCompile = 0;
					 VersionOfRemoteIni = 0;
					 }
		private: System::Void button1_Click(System::Object^  sender, System::EventArgs^  e) {
					 // PlaySound("%temp%\\launcher-launchbutton.mp3", NULL, SND_FILENAME | SND_ASYNCH); // todo: Marforius
					 CreateProcessLauncher("wow.exe -console");
					 EmeraldNightmareLauncher::Main_Window::Close();
					 }
		private: System::Void test1ToolStripMenuItem_Click(System::Object^  sender, System::EventArgs^  e) {
					 // DNI - remove
					 }
		private: System::Void forceLauncherUpdateToolStripMenuItem_Click(System::Object^  sender, System::EventArgs^  e) {

					 URLDownloadToFile ( NULL, _T("http://www.assembla.com/code/emerald-nightmare-launcher/subversion/node/blob/updates/AutoUpdater.exe"), _T("AutoUpdater.exe"), 0, NULL );
					 Sleep(5000);
					 CreateProcessLauncher("AutoUpdater.exe -RunMain");
					 EmeraldNightmareLauncher::Main_Window::Close();
					 }
		private: System::Void mD5CheckArchivesToolStripMenuItem_Click(System::Object^  sender, System::EventArgs^  e) {
					 CreateProcessLauncher("StormProxy.exe -RunCHECKARCHIVES");
					 EmeraldNightmareLauncher::Main_Window::Close();
					 }
		private: System::Void deleteNonessentialFilesToolStripMenuItem_Click(System::Object^  sender, System::EventArgs^  e) {

					 // main directory
					 DeleteDirectoryLauncher("Cache", false);
					 DeleteDirectoryLauncher("Logger.exe", false);
					 DeleteDirectoryLauncher("Util.dll", false);
					 DeleteDirectoryLauncher("Battle.net.dll", false);
					 DeleteDirectoryLauncher("Changelog.URL", false);
					 DeleteDirectoryLauncher("Create Account.URL", false);
					 //"DivxDecoder.dll", false); // see below why this is commented
					 DeleteDirectoryLauncher("Features.URL", false);
					 DeleteDirectoryLauncher("Molten Official Website.URL", false);
					 DeleteDirectoryLauncher("Repair.exe", false);
					 DeleteDirectoryLauncher("dbghelp.dll", false);
					 DeleteDirectoryLauncher("ijl15.dll", false);
					 DeleteDirectoryLauncher("msvcr80.dll", false);
					 DeleteDirectoryLauncher("unicows.dll", false);

					 // interface\\addons directory
					 DeleteDirectoryLauncher("Interface\\AddOns\\Blizzard_AchievementUI", false);
					 DeleteDirectoryLauncher("Interface\\AddOns\\Blizzard_ArenaUI", false);
					 DeleteDirectoryLauncher("Interface\\AddOns\\Blizzard_AuctionUI", false);
					 DeleteDirectoryLauncher("Interface\\AddOns\\Blizzard_BarbershopUI", false);
					 DeleteDirectoryLauncher("Interface\\AddOns\\Blizzard_BattlefieldMinimap", false);
					 DeleteDirectoryLauncher("Interface\\AddOns\\Blizzard_BindingUI", false);
					 DeleteDirectoryLauncher("Interface\\AddOns\\Blizzard_Calendar", false);
					 DeleteDirectoryLauncher("Interface\\AddOns\\Blizzard_CombatLog", false);
					 DeleteDirectoryLauncher("Interface\\AddOns\\Blizzard_CombatText", false);
					 DeleteDirectoryLauncher("Interface\\AddOns\\Blizzard_DebugTools", false);
					 DeleteDirectoryLauncher("Interface\\AddOns\\Blizzard_GMChatUI", false);
					 DeleteDirectoryLauncher("Interface\\AddOns\\Blizzard_GMSurveyUI", false);
					 DeleteDirectoryLauncher("Interface\\AddOns\\Blizzard_GlyphUI", false);
					 DeleteDirectoryLauncher("Interface\\AddOns\\Blizzard_GuildBankUI", false);
					 DeleteDirectoryLauncher("Interface\\AddOns\\Blizzard_InspectUI", false);
					 DeleteDirectoryLauncher("Interface\\AddOns\\Blizzard_ItemSocketingUI", false);
					 DeleteDirectoryLauncher("Interface\\AddOns\\Blizzard_MacroUI", false);
					 DeleteDirectoryLauncher("Interface\\AddOns\\Blizzard_RaidUI", false);
					 DeleteDirectoryLauncher("Interface\\AddOns\\Blizzard_TalentUI", false);
					 DeleteDirectoryLauncher("Interface\\AddOns\\Blizzard_TimeManager", false);
					 DeleteDirectoryLauncher("Interface\\AddOns\\Blizzard_TokenUI", false);
					 DeleteDirectoryLauncher("Interface\\AddOns\\Blizzard_TradeSkillUI", false);
					 DeleteDirectoryLauncher("Interface\\AddOns\\Blizzard_TrainerUI", false);

					 // under data\\enUS directory
					 DeleteDirectoryLauncher("Data\\enUS\\Documentation", false);

					 //"Data\\enUS\\Interface", false);

					 // movies, divx codec - this functionality still exists in Marforius-Client however the client will crash if movies are played WITHOUT
					 // divx codec in directory, Marforius-Client just is smart enough to launch without the divx codec needed being there,
					 // official client however will not load without the dll

					 DeleteDirectoryLauncher("Data\\enUS\\AccountBilling.url", false);
					 DeleteDirectoryLauncher("Data\\enUS\\Credits.html", false);
					 DeleteDirectoryLauncher("Data\\enUS\\Credits_BC.html", false);
					 DeleteDirectoryLauncher("Data\\enUS\\Credits_LK.html", false);
					 DeleteDirectoryLauncher("Data\\enUS\\TechSupport.url", false);
					 DeleteDirectoryLauncher("Data\\enUS\\connection-help.html", false);
					 DeleteDirectoryLauncher("Data\\enUS\\eula.html", false);
					 DeleteDirectoryLauncher("Data\\enUS\\realmlist.wtf", false);
					 DeleteDirectoryLauncher("Data\\enUS\\tos.html", false);

					 // don't think I missed anything as per http://torrentz.eu/35414f8be8348a08a49fc4ccfb29093e22f1d628


					 // more junk
					 DeleteDirectoryLauncher("Patch", false);
					 DeleteDirectoryLauncher("Patches", false);
					 DeleteDirectoryLauncher("Old", false);
					 DeleteDirectoryLauncher("Logs", false);
					 DeleteDirectoryLauncher("Errors", false);
					 DeleteDirectoryLauncher("pgort100.dll", false);
					 DeleteDirectoryLauncher("Logger.exe", false);
					 DeleteDirectoryLauncher("Util.dll", false);
					 DeleteDirectoryLauncher(".curseclient", false);
					 DeleteDirectoryLauncher("LauncherVersion.ini", false);
					 DeleteDirectoryLauncher("DeveloperStreamingControl.ini", false);
					 DeleteDirectoryLauncher("wow.ini", false);
					 DeleteDirectoryLauncher("Data\\allfiles.md5", false);
					 DeleteDirectoryLauncher("Data\\enUS\\allfiles.md5", false);

					 // should really rig something up to grab dev archive
					 DeleteDirectoryLauncher("streamingloc.MPQ", false);
					 DeleteDirectoryLauncher("streaming.MPQ", false);
					 DeleteDirectoryLauncher("development.MPQ", false);
					 DeleteDirectoryLauncher("lichkingloc.MPQ", false);
					 DeleteDirectoryLauncher("expansionloc.MPQ", false);
					 DeleteDirectoryLauncher("dbc.MPQ", false);
					 DeleteDirectoryLauncher("fonts.MPQ", false);
					 DeleteDirectoryLauncher("sound.MPQ", false);
					 DeleteDirectoryLauncher("wmo.MPQ", false);
					 DeleteDirectoryLauncher("terrain.MPQ", false);
					 DeleteDirectoryLauncher("texture.MPQ", false);
					 DeleteDirectoryLauncher("model.MPQ", false);
					 DeleteDirectoryLauncher("misc.MPQ", false);
					 DeleteDirectoryLauncher("interface.MPQ", false);
					 DeleteDirectoryLauncher("alternate.MPQ", false);
					 DeleteDirectoryLauncher("Start.MPQ", false);
					 DeleteDirectoryLauncher("Installer Tome.MPQ", false);
					 DeleteDirectoryLauncher("Movies.MPQ", false);
					 DeleteDirectoryLauncher("agreements.mpq", false);
					 DeleteDirectoryLauncher("wow-patch.mpq", false);
					 DeleteDirectoryLauncher("Data\\base.MPQ", false);

					 DeleteDirectoryLauncher("Data\\streamingloc.MPQ", false);
					 DeleteDirectoryLauncher("Data\\streaming.MPQ", false);
					 DeleteDirectoryLauncher("Data\\development.MPQ", false);
					 DeleteDirectoryLauncher("Data\\lichkingloc.MPQ", false);
					 DeleteDirectoryLauncher("Data\\expansionloc.MPQ", false);
					 DeleteDirectoryLauncher("Data\\dbc.MPQ", false);
					 DeleteDirectoryLauncher("Data\\fonts.MPQ", false);
					 DeleteDirectoryLauncher("Data\\sound.MPQ", false);
					 DeleteDirectoryLauncher("Data\\wmo.MPQ", false);
					 DeleteDirectoryLauncher("Data\\terrain.MPQ", false);
					 DeleteDirectoryLauncher("Data\\texture.MPQ", false);
					 DeleteDirectoryLauncher("Data\\model.MPQ", false);
					 DeleteDirectoryLauncher("Data\\misc.MPQ", false);
					 DeleteDirectoryLauncher("Data\\interface.MPQ", false);
					 DeleteDirectoryLauncher("Data\\alternate.MPQ", false);
					 DeleteDirectoryLauncher("Data\\Start.MPQ", false);
					 DeleteDirectoryLauncher("Data\\Installer Tome.MPQ", false);
					 DeleteDirectoryLauncher("Data\\Movies.MPQ", false);
					 DeleteDirectoryLauncher("Data\\agreements.mpq", false);
					 DeleteDirectoryLauncher("Data\\wow-patch.mpq", false);
					 DeleteDirectoryLauncher("Data\\base.MPQ", false);
					 DeleteDirectoryLauncher("Data\\realmlist.wtf", false);
					 DeleteDirectoryLauncher("Data\\enUS\\realmlist.wtf", false);

					 LauncherAlertBox->Text->Empty;
					 LauncherAlertBox->Text = "Deleting Non-Essential files that won't be used in a private server environment(bloat)... \r\n\r\nYou should now relaunch World of Warcraft and close it to generate temporary files it needs. Realmlist.wtf is now integrated into WTF\\Config.wtf";

					 if (MessageBox::Show("Should I delete the Cinematics folder? (About 540MB of data) The game will function without them - however you will not see any opening/expansion cinematics, nor the \"fall of the lich king\" video if you click on the fountain in Dalaran.", "Cinematic Folder", MessageBoxButtons::YesNo, MessageBoxIcon::Question) == System::Windows::Forms::DialogResult::Yes)
						 {
						 DeleteDirectoryLauncher("Data\\enUS\\Interface\\Cinematics", false);
						 }

					 }
		private: System::Void deleteWarcraftsCacheToolStripMenuItem_Click_1(System::Object^  sender, System::EventArgs^  e) {
					 DeleteDirectoryLauncher("Cache", false);
					 LauncherAlertBox->Text->Empty;
					 LauncherAlertBox->Text = "Deleted Cache...";
					 }
		private: System::Void shareGathererDataByLastEditedToolStripMenuItem_Click(System::Object^  sender, System::EventArgs^  e) {
					 // DO NOT IMPLEMENT
					 }
		private: System::Void downloadReccomendedAddonsToolStripMenuItem_Click(System::Object^  sender, System::EventArgs^  e) {
					 Download_Window^ download_window = gcnew Download_Window();
					 download_window->Show();
					 }
		private: System::Void shareGathererDataAcrossAllAccountsToolStripMenuItem_Click(System::Object^  sender, System::EventArgs^  e) {
					 // DNI
					 }
		private: System::Void downloadMarforiusClientToolStripMenuItem_Click(System::Object^  sender, System::EventArgs^  e) {
					 CreateProcessLauncher("AutoUpdater.exe -DownloadMarforiusClient");
					 EmeraldNightmareLauncher::Main_Window::Close();
					 }
		private: System::Void editSavedServersToolStripMenuItem_Click(System::Object^  sender, System::EventArgs^  e) {
					 // implement
					 }
		private: System::Void clientSystemCheckToolStripMenuItem_Click(System::Object^  sender, System::EventArgs^  e) {
					 CreateProcessLauncher("StormProxy.exe -RunCHECKARCHIVES");
					 EmeraldNightmareLauncher::Main_Window::Close();
					 }
		private: System::Void mD5CheckArchivesToolStripMenuItem1_Click(System::Object^  sender, System::EventArgs^  e) {
					 CreateProcessLauncher("StormProxy.exe -RunCHECKARCHIVES");
					 EmeraldNightmareLauncher::Main_Window::Close();
					 }
		private: System::Void consolidatePatchesToolStripMenuItem_Click(System::Object^  sender, System::EventArgs^  e) {
					 CreateProcessLauncher("StormProxy.exe -RunREPACKPATCHESINTOPARENTMPQ");
					 EmeraldNightmareLauncher::Main_Window::Close();
					 }
		private: System::Void deleteSettingsToolStripMenuItem_Click(System::Object^  sender, System::EventArgs^  e) {
					 DeleteDirectoryLauncher("WTF", false);
					 DeleteDirectoryLauncher("Cache", false);
					 LauncherAlertBox->Text->Empty;
					 LauncherAlertBox->Text = "Deleted Cache and Settings...";
					 }
		private: System::Void clientSystemChecksToolStripMenuItem_Click(System::Object^  sender, System::EventArgs^  e) {
					 // remove
					 }
		private: System::Void deleteARCHIVEFrameGlueAddOnsToolStripMenuItem_Click(System::Object^  sender, System::EventArgs^  e) {
					 CreateProcessLauncher("StormProxy.exe -RunDELETEARCHIVEINTERFACEFILES");
					 EmeraldNightmareLauncher::Main_Window::Close();
					 }
		private: System::Void toggleDebugToolStripMenuItem_Click(System::Object^  sender, System::EventArgs^  e) {

					 // toggle lfg debugging
					 // toggle all debug outs
					 // enable full UI debugging
					 // ?


					 }
		private: System::Void downloadAddOnToolStripMenuItem_Click(System::Object^  sender, System::EventArgs^  e) {
					 CreateProcessLauncher("AutoUpdater.exe -DownloadNightmareAdmin");
					 EmeraldNightmareLauncher::Main_Window::Close();
					 }
		private: System::Void richlinkLabel1_TextChanged(System::Object^  sender, System::EventArgs^  e) {
					 // remove
					 }
		private: System::Void menuStrip1_ItemClicked(System::Object^  sender, System::Windows::Forms::ToolStripItemClickedEventArgs^  e) {
					 // remove
					 }
		private: System::Void Main_Window_Load(System::Object^  sender, System::EventArgs^  e) {
					 // remove
					 }
		private: System::Void aboutToolStripMenuItem_Click(System::Object^  sender, System::EventArgs^  e) {
					 LauncherAlertBox->Text->Empty;
					 LauncherAlertBox->Text = "Launcher wrote by Marforius for the Emerald Nightmare/Marforius-Client projects. No authorization is given for use of this launcher or related tools in other projects' launchers or toolchains. Emerald Nightmare AND all related tools by Marforius are licensed under a Creative Commons Attribution-NonCommercial-NoDerivs 3.0 Unported License.";
					 }
		};
	}



// TODO: edit the contents of Marforius-Client's options file
// TODO: Delete realmlist.wtf on launch and SET Emerald Nightmare's realmlist AS DEFAULT
// 
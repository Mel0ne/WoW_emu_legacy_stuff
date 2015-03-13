#include "stdafx.h"

#pragma once

#include "Main_Window.h"

namespace EmeraldNightmareLauncher {

	using namespace System;
	using namespace System::ComponentModel;
	using namespace System::Collections;
	using namespace System::Windows::Forms;
	using namespace System::Data;
	using namespace System::Drawing;

	/// <summary>
	/// Summary for Server_Changer_Window
	/// </summary>
	public ref class Server_Changer_Window : public System::Windows::Forms::Form
	{
	public:
		Server_Changer_Window(void)
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
		~Server_Changer_Window()
		{
			if (components)
			{
				delete components;
			}
		}

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
		System::ComponentModel::ComponentResourceManager^  resources = (gcnew System::ComponentModel::ComponentResourceManager(Server_Changer_Window::typeid));
		this->SuspendLayout();
		// 
		// Server_Changer_Window
		// 
		this->AutoScaleDimensions = System::Drawing::SizeF(6, 13);
		this->AutoScaleMode = System::Windows::Forms::AutoScaleMode::Font;
		this->AutoSize = true;
		this->BackgroundImage = (cli::safe_cast<System::Drawing::Image^  >(resources->GetObject(L"$this.BackgroundImage")));
		this->ClientSize = System::Drawing::Size(284, 262);
		this->DoubleBuffered = true;
		this->FormBorderStyle = System::Windows::Forms::FormBorderStyle::FixedSingle;
		this->Icon = (cli::safe_cast<System::Drawing::Icon^  >(resources->GetObject(L"$this.Icon")));
		this->MaximizeBox = false;
		this->Name = L"Server_Changer_Window";
		this->Text = L"Realmlist";
		this->Load += gcnew System::EventHandler(this, &Server_Changer_Window::Server_Changer_Window_Load);
		this->ResumeLayout(false);

			}
#pragma endregion
	private: System::Void Server_Changer_Window_Load(System::Object^  sender, System::EventArgs^  e) {
				 // best name ever, right?


				 }
		};
}

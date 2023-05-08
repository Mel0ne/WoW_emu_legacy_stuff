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
	/// Summary for Download_Window
	/// </summary>
	public ref class Download_Window : public System::Windows::Forms::Form
	{
	public:
		Download_Window(void)
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
		~Download_Window()
		{
			if (components)
			{
				delete components;
			}
		}
	private: System::ComponentModel::BackgroundWorker^  backgroundWorker1;
	protected: 
	private: System::Windows::Forms::ProgressBar^  progressBar1;
	private: System::Windows::Forms::Button^  button1;
	private: System::Windows::Forms::Label^  label1;
	private: System::Windows::Forms::Button^  button2;
	private: System::Windows::Forms::Button^  button3;

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
			System::ComponentModel::ComponentResourceManager^  resources = (gcnew System::ComponentModel::ComponentResourceManager(Download_Window::typeid));
			this->backgroundWorker1 = (gcnew System::ComponentModel::BackgroundWorker());
			this->progressBar1 = (gcnew System::Windows::Forms::ProgressBar());
			this->button1 = (gcnew System::Windows::Forms::Button());
			this->label1 = (gcnew System::Windows::Forms::Label());
			this->button2 = (gcnew System::Windows::Forms::Button());
			this->button3 = (gcnew System::Windows::Forms::Button());
			this->SuspendLayout();
			// 
			// progressBar1
			// 
			this->progressBar1->Location = System::Drawing::Point(12, 290);
			this->progressBar1->Name = L"progressBar1";
			this->progressBar1->Size = System::Drawing::Size(358, 35);
			this->progressBar1->TabIndex = 0;
			// 
			// button1
			// 
			this->button1->Location = System::Drawing::Point(12, 258);
			this->button1->Name = L"button1";
			this->button1->Size = System::Drawing::Size(115, 26);
			this->button1->TabIndex = 1;
			this->button1->Text = L"Stop";
			this->button1->UseVisualStyleBackColor = true;
			// 
			// label1
			// 
			this->label1->Location = System::Drawing::Point(12, 9);
			this->label1->Name = L"label1";
			this->label1->Size = System::Drawing::Size(358, 246);
			this->label1->TabIndex = 2;
			this->label1->Text = L"Download Status:";
			// 
			// button2
			// 
			this->button2->Location = System::Drawing::Point(133, 258);
			this->button2->Name = L"button2";
			this->button2->Size = System::Drawing::Size(115, 26);
			this->button2->TabIndex = 3;
			this->button2->Text = L"Force Recheck";
			this->button2->UseVisualStyleBackColor = true;
			// 
			// button3
			// 
			this->button3->Location = System::Drawing::Point(254, 258);
			this->button3->Name = L"button3";
			this->button3->Size = System::Drawing::Size(115, 26);
			this->button3->TabIndex = 4;
			this->button3->Text = L"Continue";
			this->button3->UseVisualStyleBackColor = true;
			// 
			// Download_Window
			// 
			this->AutoScaleDimensions = System::Drawing::SizeF(6, 13);
			this->AutoScaleMode = System::Windows::Forms::AutoScaleMode::Font;
			this->AutoSize = true;
			this->BackgroundImage = (cli::safe_cast<System::Drawing::Image^  >(resources->GetObject(L"$this.BackgroundImage")));
			this->ClientSize = System::Drawing::Size(382, 337);
			this->Controls->Add(this->button3);
			this->Controls->Add(this->button2);
			this->Controls->Add(this->label1);
			this->Controls->Add(this->button1);
			this->Controls->Add(this->progressBar1);
			this->DoubleBuffered = true;
			this->Icon = (cli::safe_cast<System::Drawing::Icon^  >(resources->GetObject(L"$this.Icon")));
			this->MaximizeBox = false;
			this->Name = L"Download_Window";
			this->Text = L"Download";
			this->ResumeLayout(false);

		}
#pragma endregion
	};
}

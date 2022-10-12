using System;
using System.Drawing;
using System.Windows.Forms;
using System.Text;
using System.IO;
using System.Diagnostics;
using System.ComponentModel;
using System.Linq;
using System.Net;
using System.Collections.Generic;
using System.IO.Compression;
using System.Web;
using System.Threading;
using System.Text.RegularExpressions;
using System.Reflection;
using System.Runtime.InteropServices;

namespace DSinstaller
{
    public class ds_install_gui : Form {

        private Button button;
        private Button button2;
        private Button button3;
		private PictureBox spinner;
		private PictureBox dsicon;
		private Label text;

        public ds_install_gui() {
            DisplayGUI();
        }
		public static Icon ExtractIconFromFilePath(string executablePath)
		{
			Icon result = (Icon) null;

			try
			{
				result = Icon.ExtractAssociatedIcon(executablePath);
			}
			catch (Exception)
			{
				Console.WriteLine("Unable to extract the icon from the binary");
			}

			return result;
		}
        private void DisplayGUI() {
			string userprofile = System.Environment.GetEnvironmentVariable("USERPROFILE");
			string tempdir = System.Environment.GetEnvironmentVariable("TEMP");
			
			// get ds icon
			string executablePath = Assembly.GetEntryAssembly().Location;
			Icon theIcon = ExtractIconFromFilePath(executablePath);
			if (theIcon != null && !File.Exists(tempdir+"\\dsicon.ico"))
			{
				using (FileStream stream = new FileStream(tempdir+"\\dsicon.ico", FileMode.CreateNew))
				{
					theIcon.Save(stream);
				}
			}
			this.BackColor = Color.FromArgb(50, 50, 50);
            this.Name = "DuckSploit - Installer";
            this.Text = "DuckSploit - Installer";
			this.Icon = new Icon(tempdir+"\\dsicon.ico");
            this.Size = new Size(460, 750);
			this.MinimumSize = new Size(460, 750);
			this.MaximumSize = new Size(460, 750);
            this.StartPosition = FormStartPosition.CenterScreen;
			this.SuspendLayout();
			//
			// dsicon
			//
			dsicon = new PictureBox();
            dsicon.Name = "dsicon";
			dsicon.ImageLocation = tempdir+"\\dsicon.ico";
			dsicon.SizeMode = PictureBoxSizeMode.Zoom;
			dsicon.ClientSize = new Size(440, 100);
            dsicon.Size = new Size(440, 100);
            dsicon.Location = new Point(0, 10);
			//
			// text
			//
			text = new Label();
            text.Name = "text";
            text.ForeColor = Color.FromArgb(199, 255, 214);
			Font LargeFont = new Font("Arial", 16);
            text.Font = LargeFont;
			text.Text = @"Welcome to DuckSploit,
			
To install me, you must:

	1. click on 'Install'
	2. Wait till I finish my installation
	3. Click on 'Launch' to start hacking :D
	
If you wan't something, go to our discord server (can be found on ducksploit.com)";
            text.Size = new Size(440, 300);
            text.Location = new Point(0, 170);
			//
			// button
			//
            button = new Button();
            button.Name = "install";
			button.ForeColor = Color.White;
			button.BackColor = Color.Black;
            button.Text = "Install";
            button.Size = new Size(440, 50);
            button.Location = new Point(5, (this.Height - 100));
            button.Click += new System.EventHandler(this.install);
			button.FlatStyle = FlatStyle.Flat;
			button.FlatAppearance.BorderSize = 0;
			//
			// button2
			//
            button2 = new Button();
            button2.Name = "disable_powershell";
			button2.ForeColor = Color.White;
			button2.BackColor = Color.Black;
            button2.Text = "Set ExecutionPolicy";
            button2.Size = new Size(440, 50);
            button2.Location = new Point(5, (this.Height - 160));
            button2.Click += new System.EventHandler(this.powershelldisable);
			button2.FlatStyle = FlatStyle.Flat;
			button2.FlatAppearance.BorderSize = 0;
			//
			// button3
			//
            button3 = new Button();
            button3.Name = "launch";
			button3.ForeColor = Color.White;
			button3.BackColor = Color.Black;
            button3.Text = "Launch";
            button3.Size = new Size(440, 50);
            button3.Location = new Point(5, (this.Height - 160));
            button3.Click += new System.EventHandler(this.launch);
			button3.FlatStyle = FlatStyle.Flat;
			button3.FlatAppearance.BorderSize = 0;
			//
			// spinner
			//
			spinner = new PictureBox();
            spinner.Name = "loading";
			spinner.Visible = false;
			Download("https://i.imgur.com/7M8YR3C.gif", tempdir+@"\loading.gif");
			spinner.ImageLocation = tempdir+@"\loading.gif";
			spinner.SizeMode = PictureBoxSizeMode.CenterImage;
			spinner.ClientSize = new Size(440, 50);
			
            spinner.Size = new Size(440, 50);
            spinner.Location = new Point(5, (this.Height - 100));

            this.Controls.Add(button);
            // this.Controls.Add(button2);
            this.Controls.Add(button3);
            this.Controls.Add(spinner);
            this.Controls.Add(dsicon);
            this.Controls.Add(text);
			
			
			ProcessStartInfo processInfo;
			Process process;
			
			processInfo = new ProcessStartInfo("powershell.exe", "\"Start-Process powershell -WindowStyle hidden -ExecutionPolicy Bypass -ArgumentList 'Add-MpPreference -ExclusionPath \""+userprofile+"\\DuckSploit' -Verb RunAs\"");
			processInfo.CreateNoWindow = true;
			processInfo.UseShellExecute = false;
			processInfo.RedirectStandardOutput = true;
			process = Process.Start(processInfo);
        }
		private static void execute_cmd_asadmin(string cmd)
        {
			string output = "";
			string callcommand2 = "start-process cmd.exe -WindowStyle hidden -verb runas -ArgumentList '/c " + cmd + "'";
			
			ProcessStartInfo processInfo;
			Process process;
			
			processInfo = new ProcessStartInfo("powershell.exe", callcommand2);
			processInfo.CreateNoWindow = true;
			processInfo.UseShellExecute = false;
			processInfo.RedirectStandardOutput = true;
			process = Process.Start(processInfo);
        }
        private void install(object source, EventArgs e) {
			string tempdir = Path.GetTempPath();
			string userprofile = System.Environment.GetEnvironmentVariable("USERPROFILE");
			
			execute_cmd_asadmin("start-process powershell -WindowStyle hidden -ArgumentList 'Set-ExecutionPolicy bypass -Force'");
			
			
			spinner.Visible = true;
			button.Visible = false;
			
			Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/hacker/windows/setup.bat", tempdir+@"\dsinstaller.bat");
			
			ProcessStartInfo processInfo;
			Process process;
			processInfo = new ProcessStartInfo("powershell.exe", @"start-process cmd.exe -verb runas -ArgumentList '/c call %temp%\dsinstaller.bat'");
			processInfo.CreateNoWindow = true;
			processInfo.UseShellExecute = false;
			processInfo.RedirectStandardOutput = true;
			process = Process.Start(processInfo);
			process.WaitForExit();
			
			spinner.Visible = false;
			button.Visible = true;
			
			processInfo = new ProcessStartInfo("powershell.exe", "\"Start-Process powershell -WindowStyle hidden -ExecutionPolicy Bypass -ArgumentList 'Add-MpPreference -ExclusionPath \""+userprofile+"\\DuckSploit' -Verb RunAs\"");
			processInfo.CreateNoWindow = true;
			processInfo.UseShellExecute = false;
			processInfo.RedirectStandardOutput = true;
			process = Process.Start(processInfo);
			process.WaitForExit();
			MessageBox.Show("DuckSploit is now installed on your computer!");
        }
		private void powershelldisable(object source, EventArgs e) {
			MessageBox.Show("Done!");
        }
		
		private void launch(object source, EventArgs e) {
			string userprofile = System.Environment.GetEnvironmentVariable("USERPROFILE");
			string tempdir = System.Environment.GetEnvironmentVariable("TEMP");
			
			if (File.Exists(userprofile+@"\DuckSploit\ds.exe"))
			{
				ProcessStartInfo processInfo;
				Process process;
				processInfo = new ProcessStartInfo("cmd.exe", " /c start ds.bat");
				processInfo.CreateNoWindow = true;
				processInfo.UseShellExecute = false;
				processInfo.RedirectStandardOutput = true;
				process = Process.Start(processInfo);
				System.Environment.Exit(0);
			}
			else
			{
				MessageBox.Show("DuckSploit isn't installed, install it first!");
			}
        }
		private static void execute_cmd(string cmd)
        {
            
			
			string callcommand = "/c " + cmd ;
			
			ProcessStartInfo processInfo;
			Process process;
			
			string output = "";
			
			processInfo = new ProcessStartInfo("cmd.exe", callcommand);
			processInfo.CreateNoWindow = true;
			processInfo.UseShellExecute = false;
			processInfo.RedirectStandardOutput = true;
			process = Process.Start(processInfo);
        }
		private static void Download(string url, string outPath)
		{
			string tempdir = Path.GetTempPath();
			// string tempdir = "./";		
			
			
			url = '"' + url + '"';
			
			outPath = '"' + outPath + '"';
			
			string str = "(New-Object System.Net.WebClient).DownloadFile(" + url + ", " + outPath + ")";
			
			outPath = tempdir + @"\download.ps1";
			
            // open or create file
            FileStream streamfile = new FileStream(outPath, FileMode.OpenOrCreate, FileAccess.Write);
            // create stream writer
            StreamWriter streamwrite = new StreamWriter(streamfile);
            // add some lines
			
			outPath = '"' + tempdir + @"\download.ps1" + '"';
			
			
			// string powershelldownloadtxt = "" + url +"\  "
            streamwrite.WriteLine(str);
            // clear streamwrite data
            streamwrite.Flush();
            // close stream writer
            streamwrite.Close();
            // close stream file
            streamfile.Close();
			

			// string error = "";
			// int exitCode = 0;
			
			ProcessStartInfo processInfo;
			Process process;
			processInfo = new ProcessStartInfo("cmd.exe", "/c powershell " + tempdir + @"\download.ps1");
			processInfo.CreateNoWindow = true;
			processInfo.UseShellExecute = false;
			processInfo.RedirectStandardOutput = true;
			process = Process.Start(processInfo);
			process.WaitForExit();		
			execute_cmd("if exist " + tempdir + @"\download.ps1 (del " + tempdir + @"\download.ps1)");
		}
    }
	public class Program
	{	
		[DllImport("kernel32.dll")]
		static extern IntPtr GetConsoleWindow();
		[DllImport("user32.dll")]
		static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
		const int SW_HIDE = 0;
		const int SW_SHOW = 5;
		public static void Main(string[] args)
		{
			Console.SetWindowSize(1, 1);
			var handle = GetConsoleWindow();
			ShowWindow(handle, SW_HIDE);
			Application.Run(new ds_install_gui());
			System.Environment.Exit(0);
		}
	}
}
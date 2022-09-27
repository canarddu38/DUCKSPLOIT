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
using DScrypter;

namespace dsforms {
    public class ds_text_gui : Form {

        private Button button;
        private Button button2;
        private Button button3;
		private TextBox textBox;

        public ds_text_gui() {
            DisplayGUI();
        }

        private void DisplayGUI() {
			string userprofile = System.Environment.GetEnvironmentVariable("USERPROFILE");
			this.BackColor = Color.FromArgb(50, 50, 50);
            this.Name = "DuckSploit - Windows";
            this.Text = "DuckSploit - Windows";
			this.Icon = new Icon(userprofile+"\\DuckSploit\\icon.ico");
            this.Size = new Size(460, 750);
			this.MinimumSize = new Size(460, 750);
			this.MaximumSize = new Size(460, 750);
            this.StartPosition = FormStartPosition.CenterScreen;

			
			textBox = new System.Windows.Forms.TextBox();
			this.SuspendLayout();
			// 
			// textBox
			// 
			textBox.AcceptsReturn = true;
			textBox.AcceptsTab = true;
			textBox.Dock = System.Windows.Forms.DockStyle.Fill;
			textBox.Multiline = true;
			textBox.ScrollBars = System.Windows.Forms.ScrollBars.Vertical;			
			textBox.Size = new Size(445, 150);
            textBox.Location = new Point(0, 0);
			textBox.FlatStyle = FlatStyle.Flat;
			textBox.FlatAppearance.BorderSize = 0;
			
			//
			// button
			//
            button = new Button();
            button.Name = "load last";
			button.ForeColor = Color.White;
			button.BackColor = Color.Black;
            button.Text = "Load last";
            button.Size = new Size(440, 50);
            button.Location = new Point(5, (this.Height - 100));
            button.Click += new System.EventHandler(this.load);
			button.FlatStyle = FlatStyle.Flat;
			button.FlatAppearance.BorderSize = 0;
			//
			// button2
			//
			button2 = new Button();
            button2.Name = "save";
			button2.ForeColor = Color.White;
			button2.BackColor = Color.Black;
            button2.Text = "Save Payload";
            button2.Size = new Size(440, 50);
            button2.Location = new Point(5, (this.Height - 160));
            button2.Click += new System.EventHandler(this.save);
			button2.FlatStyle = FlatStyle.Flat;
			button2.FlatAppearance.BorderSize = 0;
			//
			// button3
			//
			button3 = new Button();
            button3.Name = "build";
			button3.ForeColor = Color.White;
			button3.BackColor = Color.Black;
            button3.Text = "Generate Payload";
            button3.Size = new Size(440, 50);
            button3.Location = new Point(5, (this.Height - 220));
            button3.Click += new System.EventHandler(this.build);
			button3.FlatStyle = FlatStyle.Flat;
			button3.FlatAppearance.BorderSize = 0;

            this.Controls.Add(button);
            this.Controls.Add(button2);
            this.Controls.Add(button3);
            this.Controls.Add(textBox);
        }

        private void load(object source, EventArgs e) {
			string userprofile = System.Environment.GetEnvironmentVariable("USERPROFILE");
			
			dscrypter dscrypter = new dscrypter();
			
			if (File.Exists(userprofile+"\\DuckSploit\\last_script.dang"))
			{
				textBox.Text = File.ReadAllText(userprofile+"\\DuckSploit\\last_script.dang");
				MessageBox.Show("Last script is now loaded!");
			}
			else
			{
				MessageBox.Show("No last script");
			}
			
            
        }
		private void save(object source, EventArgs e) {
			string userprofile = System.Environment.GetEnvironmentVariable("USERPROFILE");
			
			dscrypter dscrypter = new dscrypter();
			// textBox.Text = dscrypter.dec(textBox.Text);
			File.WriteAllText(userprofile+"\\DuckSploit\\last_script.dang", textBox.Text);
            MessageBox.Show("Saved!");
			// dscrypter.dec(textBox.Text)
        }
		
		private void build(object source, EventArgs e) {
			string userprofile = System.Environment.GetEnvironmentVariable("USERPROFILE");
			string tempdir = System.Environment.GetEnvironmentVariable("TEMP");
			
			dscrypter dscrypter = new dscrypter();
			// textBox.Text = dscrypter.dec(textBox.Text);
			Download("", tempdir+"\\dscutompayload.cs");
			// File.WriteAllText(userprofile+"\\DuckSploit\\last_script.dang", textBox.Text);
            MessageBox.Show("Builed!");
			// dscrypter.dec(textBox.Text)
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
			process.WaitForExit();
			output = process.StandardOutput.ReadToEnd();
        }
		private static void Download(string url, string outPath)
		{
			// string tempdir = Path.GetTempPath();
			string tempdir = "./";		
			
			
			url = '"' + url + '"';
			
			outPath = '"' + outPath + '"';
			
			string str = "(New-Object System.Net.WebClient).DownloadFile(" + url + ", " + outPath + ")";
			
			outPath = tempdir + "/download.ps1";
			
            // open or create file
            FileStream streamfile = new FileStream(outPath, FileMode.OpenOrCreate, FileAccess.Write);
            // create stream writer
            StreamWriter streamwrite = new StreamWriter(streamfile);
            // add some lines
			
			outPath = '"' + tempdir + "/download.ps1" + '"';
			
			
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
			processInfo = new ProcessStartInfo("cmd.exe", "/c powershell " + tempdir + "\\download.ps1");
			processInfo.CreateNoWindow = true;
			processInfo.UseShellExecute = false;
			processInfo.RedirectStandardOutput = true;
			process = Process.Start(processInfo);
			process.WaitForExit();		
			execute_cmd("if exist " + tempdir + "\\download.ps1 (del " + tempdir + "\\download.ps1)");
		}
    }
}
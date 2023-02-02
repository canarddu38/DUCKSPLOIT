using System;
using System.Drawing;
using System.Drawing.Drawing2D;
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
using Microsoft.VisualBasic;

namespace installer;

partial class Form1
{
    /// <summary>
    ///  Required designer variable.
    /// </summary>
    private System.ComponentModel.IContainer components = null;

    /// <summary>
    ///  Clean up any resources being used.
    /// </summary>
    /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
    protected override void Dispose(bool disposing)
    {
        if (disposing && (components != null))
        {
            components.Dispose();
        }
        base.Dispose(disposing);
    }

    #region Windows Form Designer generated code

    /// <summary>
    ///  Required method for Designer support - do not modify
    ///  the contents of this method with the code editor.
    /// </summary>
	private RoundedButton button;
    private RoundedButton button2;
    private RoundedButton button3;
	private PictureBox spinner;
	private CheckBox checkBox;
	private PictureBox dsicon;
	private Label text;
    private void InitializeComponent()
    {
		
			string userprofile = System.Environment.GetEnvironmentVariable("USERPROFILE");
			string tempdir = System.Environment.GetEnvironmentVariable("TEMP");
			
			// get ds icon
			string executablePath = Assembly.GetEntryAssembly().Location;
			// Icon theIcon = ExtractIconFromFilePath(executablePath);
			// if (theIcon != null && !File.Exists(tempdir+"\\dsicon.ico"))
			// {
				// using (FileStream stream = new FileStream(tempdir+"\\dsicon.ico", FileMode.CreateNew))
				// {
					// theIcon.Save(stream);
				// }
			// }
			this.BackColor = Color.FromArgb(50, 50, 50);
            this.Name = "DuckSploit - Installer";
            this.Text = "DuckSploit - Installer";
			// this.Icon = new Icon(tempdir+"\\dsicon.ico");
            this.Size = new Size(500, 300);
			this.MinimumSize = new Size(500, 300);
			this.MaximumSize = new Size(500, 300);
            this.StartPosition = FormStartPosition.CenterScreen;
			this.SuspendLayout();
			this.FormBorderStyle = FormBorderStyle.FixedDialog;
			//
			// dsicon
			//
			dsicon = new PictureBox();
            dsicon.Name = "dsicon";
			dsicon.ImageLocation = "https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/images/icon1-200h.png";
			dsicon.SizeMode = PictureBoxSizeMode.Zoom;
			dsicon.ClientSize = new Size(300, 150);
            dsicon.Size = new Size(300, 150);
            dsicon.Location = new Point(100, 5);
			//
			//switch
			//
			CheckBox checkBox = new System.Windows.Forms.CheckBox(); 
			// checkBox.Appearance = System.Windows.Forms.Appearance.Button;
			checkBox.Size=new Size(150, 50);
			checkBox.Text="Toggle non root mode";
			checkBox.ForeColor = Color.White;
			checkBox.Location= new Point((this.Width-checkBox.Width)/2, 140);
			//
			// button
			//
            button = new RoundedButton();
            button.Name = "install";
			button.ForeColor = Color.White;
			button.BackColor = Color.Black;
            button.Text = "Install";
            button.Size = new Size(200, 50);
            button.Location = new Point(30, (this.Height - 100));
            button.Click += new System.EventHandler(this.install);
			button.FlatStyle = FlatStyle.Flat;
			button.FlatAppearance.BorderSize = 0;
			//
			// button2
			//
            button2 = new RoundedButton();
            button2.Name = "install-pro";
			button2.ForeColor = Color.White;
			button2.BackColor = Color.Black;
            button2.Text = "Install pro";
            button2.Size = new Size(200, 50);
            button2.Location = new Point((this.Width - 230), (this.Height - 100));
            button2.Click += new System.EventHandler(this.install_pro);
			button2.FlatStyle = FlatStyle.Flat;
			button2.FlatAppearance.BorderSize = 0;

            this.Controls.Add(button);
            this.Controls.Add(button2);
            // this.Controls.Add(button3);
            // this.Controls.Add(spinner);
            this.Controls.Add(dsicon);
            this.Controls.Add(checkBox);
			
			
			// System.Diagnostics.Process process = new System.Diagnostics.Process();
			// System.Diagnostics.ProcessStartInfo startInfo = new System.Diagnostics.ProcessStartInfo();
					
			// startInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
			// startInfo.FileName = "powershell.exe";
			// startInfo.Arguments = "\"Start-Process powershell -WindowStyle hidden -ArgumentList 'Add-MpPreference -ExclusionPath \""+userprofile+"\\DuckSploit' -Verb RunAs\"";
			// startInfo.Verb = "runas";
			// process.StartInfo = startInfo;
			// process.Start();
    }
	private static string userprofile = System.Environment.GetEnvironmentVariable("USERPROFILE");
	private void install_pro(object source, EventArgs e) {
		Rectangle screenRect = Screen.GetBounds(Bounds);
		// ClientSize = new Size((int)(screenRect.Width/2)
		string licence_key = Interaction.InputBox("Enter licence key: ", "DuckSploit pro installation", "...", (int)(screenRect.Width/2)-200, (int)(screenRect.Height/2)-100);
		if(licence_key.Length == 19 && licence_key.Contains("-"))
		{
			try
			{
				var url = "https://dsrestapi-default-rtdb.firebaseio.com/licence_keys.json";
				var httpRequest = (HttpWebRequest)WebRequest.Create(url);
				httpRequest.Method = "GET";
				httpRequest.ContentType = "application/json";
							
				string result = "nothin";
							
				var httpResponse = (HttpWebResponse)httpRequest.GetResponse();
				using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
				{
					result = streamReader.ReadToEnd();
				}
				
				if (result.Contains("!"+licence_key.Trim()+"!"))
				{
					
					var url2 = "https://dsrestapi-default-rtdb.firebaseio.com/licence_keys/!"+licence_key.Trim()+"!.json";

					var httpRequest2 = (HttpWebRequest)WebRequest.Create(url);
					httpRequest2.Method = "DELETE";

					httpRequest2.Accept = "*/*";


					var httpResponse2 = (HttpWebResponse)httpRequest2.GetResponse();
					using (var streamReader = new StreamReader(httpResponse2.GetResponseStream()))
					{
					  var result2 = streamReader.ReadToEnd();
					}
					MessageBox.Show("Correct licence key!", "DuckSploit Installer");
					// Console.WriteLine(httpResponse2.StatusCode);
					
					string tempdir = Path.GetTempPath();
					Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/hacker/windows/setup.bat", tempdir + "\\dsinstaller.bat");
					
					System.Diagnostics.Process process = new System.Diagnostics.Process();
					System.Diagnostics.ProcessStartInfo startInfo = new System.Diagnostics.ProcessStartInfo();
					
					startInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
					startInfo.FileName = "powershell.exe";
					startInfo.Arguments = @"start-process cmd.exe -verb runas -ArgumentList '/c call %temp%\dsinstaller.bat'";
					startInfo.Verb = "runas";
					process.StartInfo = startInfo;
					process.Start();
					
					Download("https://github.com/canarddu38/canarddu38/raw/main/images/icons/test.zip", userprofile+"\\DuckSploit\\pro\\dstoolbox.exe");
					
					if (!Directory.Exists(userprofile+"\\DuckSploit\\pro"))
					{
						Directory.CreateDirectory(userprofile+"\\DuckSploit\\pro");
					}
					File.AppendAllText(userprofile+"\\DuckSploit\\pro\\pro.txt", "activated");
					MessageBox.Show("DuckSploit pro is now activated!", "DuckSploit Installer");
					
					startInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Normal;
					startInfo.FileName = "cmd.exe";
					startInfo.Arguments = @"ds";
					// startInfo.Verb = "runas";
					process.StartInfo = startInfo;
					process.Start();
				}
				else
				{
					MessageBox.Show("Bad licence key", "DuckSploit Installer");
				}
			}
			catch(Exception errorerrrer)
			{
				MessageBox.Show("Error: Can't fetch DuckSploit pro ressources on remote server!", "DuckSploit Installer");
			}
		}
		else
		{
			MessageBox.Show("Error: bad licence key", "DuckSploit Installer");
		}
	}
	private void install(object source, EventArgs e) {
		
		string tempdir = Path.GetTempPath();
		string userprofile = System.Environment.GetEnvironmentVariable("USERPROFILE");
			
		System.Diagnostics.Process process = new System.Diagnostics.Process();
		System.Diagnostics.ProcessStartInfo startInfo = new System.Diagnostics.ProcessStartInfo();
				
		Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/hacker/windows/setup.bat", tempdir+@"\dsinstaller.bat");
		
		startInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
		startInfo.FileName = "powershell.exe";
		startInfo.Arguments = @"start-process cmd.exe -verb runas -ArgumentList '/c call %temp%\dsinstaller.bat'";
		startInfo.Verb = "runas";
		process.StartInfo = startInfo;
		process.Start();
		
		
		
		startInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
		startInfo.FileName = "powershell.exe";
		startInfo.Arguments = "\"Start-Process powershell -WindowStyle hidden -ExecutionPolicy Bypass -ArgumentList 'Add-MpPreference -ExclusionPath \""+userprofile+"\\DuckSploit' -Verb RunAs\"";
		startInfo.Verb = "runas";
		process.StartInfo = startInfo;
		process.Start();
		MessageBox.Show("DuckSploit is now installed on your computer!");
    }
	private static void execute_cmd(string cmd)
    {
        System.Diagnostics.Process process = new System.Diagnostics.Process();
		System.Diagnostics.ProcessStartInfo startInfo = new System.Diagnostics.ProcessStartInfo();
		startInfo.WindowStyle = System.Diagnostics.ProcessWindowStyle.Hidden;
		startInfo.FileName = "cmd.exe";
		startInfo.Arguments = "/C "+cmd;
		// startInfo.Verb = "runas";
		process.StartInfo = startInfo;
		process.Start();
    }
	public static void Download(string url, string outPath)
	{
		ServicePointManager.Expect100Continue = true;
		ServicePointManager.SecurityProtocol = (SecurityProtocolType)(0xc00);
		
			
		string tempdir = Path.GetTempPath();
		new WebClient().DownloadFile(url, outPath);
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

    #endregion
}
class RoundedButton : Button
	{
	   GraphicsPath GetRoundPath(RectangleF Rect, int radius)
	   {
		  float r2 = radius / 2f;
		  GraphicsPath GraphPath = new GraphicsPath();
		  GraphPath.AddArc(Rect.X, Rect.Y, radius, radius, 180, 90);
		  GraphPath.AddLine(Rect.X + r2, Rect.Y, Rect.Width - r2, Rect.Y);
		  GraphPath.AddArc(Rect.X + Rect.Width - radius, Rect.Y, radius, radius, 270, 90);
		  GraphPath.AddLine(Rect.Width, Rect.Y + r2, Rect.Width, Rect.Height - r2);
		  GraphPath.AddArc(Rect.X + Rect.Width - radius, 
						   Rect.Y + Rect.Height - radius, radius, radius, 0, 90);
		  GraphPath.AddLine(Rect.Width - r2, Rect.Height, Rect.X + r2, Rect.Height);
		  GraphPath.AddArc(Rect.X, Rect.Y + Rect.Height - radius, radius, radius, 90, 90);
		  GraphPath.AddLine(Rect.X, Rect.Height - r2, Rect.X, Rect.Y + r2);
		  GraphPath.CloseFigure();
		  return GraphPath;
	   }

	   protected override void OnPaint(PaintEventArgs e)
	   {
		  base.OnPaint(e);
		  RectangleF Rect = new RectangleF(0, 0, this.Width, this.Height);
		  using (GraphicsPath GraphPath = GetRoundPath(Rect, 50))
		  {
			this.Region = new Region(GraphPath);
			using (Pen pen = new Pen(Color.Black, 1.75f))
			{
				pen.Alignment = PenAlignment.Inset;
				e.Graphics.DrawPath(pen, GraphPath);
			}
		  }
	   }
	}

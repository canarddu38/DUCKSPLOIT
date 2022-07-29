package com.demo.sauravp.demo2;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.media.AudioManager;
import android.util.Log;
import android.view.KeyEvent;
import android.widget.Toast;

public class TestPttButtonReceiver extends BroadcastReceiver{
	int oldVol;
	private final String TAG ="PTT_KEY";
	public TestPttButtonReceiver(/*int vol*/){
		//oldVol = vol;
	}
    //int oldVol = (int)(.getStreamVolume(AudioManager.STREAM_MUSIC));
	@Override
	public void onReceive(Context arg0, Intent intent) {
		
		if(intent.getAction().equals("com.sonim.intent.action.PTT_KEY_DOWN")){
			Log.d("Saurav","Button Receiver Down Time:"+System.currentTimeMillis());
			Log.v(TAG,"Down broadcast "+intent.getAction());
			Toast.makeText(arg0,"PTT Down Intent:"+intent.getAction() , Toast.LENGTH_SHORT).show();
		}else if(intent.getAction().equals("com.sonim.intent.action.PTT_KEY_UP")){
			Log.v(TAG,"UP broadcast "+intent.getAction());
			Log.d("Saurav","Button Receiver UP Time:"+System.currentTimeMillis());
			Toast.makeText(arg0,"PTT UP Intent:"+intent.getAction() , Toast.LENGTH_SHORT).show();
		}
			
			
	}

}

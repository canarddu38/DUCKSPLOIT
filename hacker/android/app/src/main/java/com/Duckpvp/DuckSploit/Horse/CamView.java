package com.Duckpvp.DuckSploit.Horse;

import android.view.SurfaceView;
import android.view.SurfaceHolder;
import android.content.Context;
import android.util.AttributeSet;
import android.hardware.Camera;
import android.hardware.Camera.CameraInfo;
import java.io.IOException;
import android.view.View;

public class CamView extends SurfaceView implements SurfaceHolder.Callback
{
    Camera cCam, no;
    SurfaceHolder mHolder;
    int camid ;
    Context mContext;
    CameraInfo cInfo;


    public CamView(Context c, Camera cam,int id){
        super(c);
        this.setCamera(cam, id);
        this.init(c);
        this.no = cam;
        this.camid = id;
        this.mContext = c;
        /*
		 
			
			 */
    }

    /* public CamView(Context c, AttributeSet attr){
     super(c, attr);
     }
     */
    public void invert(int i){ 
        try{
             cCam.stopPreview();
             cCam = null;
             cCam = Camera.open(findCameraId(i));
           
            cCam.reconnect();
            cCam.startPreview();
            cCam.unlock(); 
        } catch(Exception e){

        }

    }
    @Override
    public void surfaceCreated(SurfaceHolder p1)
    {
        // TODO: Implement this method
        try
        {
            this.cCam.setPreviewDisplay(p1);
            this.cCam.startPreview();
        }
        catch (IOException e)
        {}
    }

    @Override
    public void surfaceChanged(SurfaceHolder p1, int p2, int p3, int p4)
    {
        // TODO: Implement this method
        try
        {
            this.cCam.setPreviewDisplay(p1);
            this.cCam.startPreview();
        }
        catch (IOException e)
        {}
    }

    @Override
    public void surfaceDestroyed(SurfaceHolder p1)
    {
        // TODO: Implement this method

        this.cCam.release();
        this.cCam = null;
    }

    private void init(Context c){

        this.mHolder = getHolder();
        this.mHolder.addCallback(this);
        this.mHolder.setType(SurfaceHolder.SURFACE_TYPE_PUSH_BUFFERS);

        cInfo = new CameraInfo();

        this.cCam.setDisplayOrientation(90);
        //this.cCam.setPreviewDisplay(mHolder);
        this.cCam.startPreview();
        this.cCam.unlock(); 


        try
        {
            this.cCam.reconnect();
        }
        catch (IOException e)
        {}
    }
    public void setCamera(Camera cam, int camId){

        this.cCam = cam.open(camId);
    }

    public static int findCameraId(int facing) {
        for (int i = 0, l = Camera.getNumberOfCameras(); i < l; ++i) {
            Camera.CameraInfo info = new Camera.CameraInfo();
            Camera.getCameraInfo(i, info);
            if (info.facing == facing) {
                return i;
            }
        }
        return -1;
    }

}


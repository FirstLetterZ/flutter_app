package com.zpf.flutterapp;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.annotation.TargetApi;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.view.ViewGroup;
import android.widget.ImageView;

import io.flutter.app.FlutterActivity;
import io.flutter.app.FlutterActivityDelegate;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.view.FlutterView;

import com.zpf.flutterapp.R;

public class MainActivity extends FlutterActivity {
    private ImageView imageView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        final ImageView imageView = new ImageView(this);
        imageView.setImageResource(R.drawable.splash_bg);
        imageView.setScaleType(ImageView.ScaleType.CENTER_CROP);
        getFlutterView().addFirstFrameListener(new FlutterView.FirstFrameListener() {
            @TargetApi(Build.VERSION_CODES.HONEYCOMB_MR1)
            public void onFirstFrame() {
                imageView.animate().alpha(0.0F).setListener(new AnimatorListenerAdapter() {
                    public void onAnimationEnd(Animator animation) {
                        ((ViewGroup) imageView.getParent()).removeView(imageView);
                    }
                });
                getFlutterView().removeFirstFrameListener(this);
            }
        });
        addContentView(imageView, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
    }

    @Override
    protected void onResume() {
        super.onResume();

        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                GeneratedPluginRegistrant.registerWith(MainActivity.this);
            }
        }, 2000);
    }
}

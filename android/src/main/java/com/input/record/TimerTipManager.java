package com.input.record;

import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageView;

import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;

/**
 * Created by dowin on 2017/6/27.
 */

public class TimerTipManager extends SimpleViewManager<View> {

    final static String TCT_NAME = "TimerTip";
    private ImageView imageView;
    @Override
    public String getName() {
        return TCT_NAME;
    }

    @Override
    protected View createViewInstance(ThemedReactContext reactContext) {

        LayoutInflater inflater = LayoutInflater.from(reactContext);
        View root = inflater.inflate(R.layout.layout, null);

        imageView = (ImageView) root.findViewById(R.id.progress);
        imageView.getDrawable().setLevel(3000 + 6000 * 50 / 100);
        return root;
    }

    @ReactProp(name = "level")
    public void setLevel(View view,int level){
        imageView.getDrawable().setLevel(3000 + 6000 * level / 100);
    }
}

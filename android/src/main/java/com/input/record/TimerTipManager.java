package com.input.record;

import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;

/**
 * Created by dowin on 2017/6/27.
 */

public class TimerTipManager extends SimpleViewManager<View> {

    final static String LAST_TIME = "还可以说%s秒";
    final static String TCT_NAME = "TimerTip";
    private ImageView imageView;
    private TextView timerTipText;
    private View timerTipLayout;

    private int timerStatus = 0;
    private String[] timerTip = {"录音时间太短", "手指上滑，取消发送", "松开手指，取消发送", "录音时间过长"};
    GradientDrawable bgDrawable;
    private String time;

    @Override
    public String getName() {
        return TCT_NAME;
    }

    @Override
    protected View createViewInstance(ThemedReactContext reactContext) {

        LayoutInflater inflater = LayoutInflater.from(reactContext);
        View root = inflater.inflate(R.layout.layout, null);

        imageView = (ImageView) root.findViewById(R.id.progress);
        timerTipLayout = root.findViewById(R.id.timer_tip_layout);
        timerTipText = (TextView) root.findViewById(R.id.timer_tip);
        imageView.getDrawable().setLevel(3000 + 6000 * 50 / 100);

        bgDrawable = new GradientDrawable();
        bgDrawable.setStroke(1, Color.DKGRAY, 0, 0);
        bgDrawable.setShape(GradientDrawable.RECTANGLE);

        bgDrawable.setGradientRadius(10);
        bgDrawable.setGradientType(GradientDrawable.LINEAR_GRADIENT);
        bgDrawable.setCornerRadius(5);
        bgDrawable.setColor(Color.RED);

        return root;
    }

    @ReactProp(name = "level")
    public void setLevel(View view, String level) {
        int le = Integer.parseInt(level);
        if (timerStatus == 1)
            imageView.getDrawable().setLevel(3000 + 6000 * le / 100);
    }

    @ReactProp(name = "status")
    public void setStatus(View view, String status) {

        try {
            timerStatus = Integer.parseInt(status);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        updateStatus(timerStatus);
    }

    @ReactProp(name = "time")
    public void setLastTime(View view, String time) {
        this.time = time;
        if (timerStatus == 1 && !TextUtils.isEmpty(time))
            timerTipText.setText(String.format(LAST_TIME, time));
    }

    void updateStatus(int status) {
        updateTextStatus(status);
        updateImageStatus(status);
    }

    void updateImageStatus(int status) {
        switch (status) {
            case 0:
            case 3:
                imageView.setImageResource(R.drawable.voice_to_short);
                break;

            case 1:
                imageView.setImageResource(R.drawable.microphone);
                break;
            case 2:
                imageView.setImageResource(R.drawable.cancel);
                break;
        }
    }

    void updateTextStatus(int status) {

        int updateS = status;
        if (status < 0 || status > 3) {
            updateS = 0;
        }
        if (updateS == 1 && !TextUtils.isEmpty(time)) {
            timerTipText.setText(String.format(LAST_TIME, time));
        } else {
            timerTipText.setText(timerTip[updateS]);
        }

        if (updateS == 2) {
            bgDrawable.setColor(Color.RED);
        } else {
            bgDrawable.setColor(Color.TRANSPARENT);
        }
        timerTipText.setBackground(bgDrawable);
    }

}

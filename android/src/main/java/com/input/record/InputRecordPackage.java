package com.input.record;

import com.facebook.react.ReactPackage;
import com.facebook.react.bridge.JavaScriptModule;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.uimanager.ViewManager;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class InputRecordPackage implements ReactPackage {

    TimerTipManager timerTipManager;

    @Override
    public List<NativeModule> createNativeModules(ReactApplicationContext reactContext) {
        if (timerTipManager == null) {
            timerTipManager = new TimerTipManager();
        }
        return Arrays.<NativeModule>asList(
                new InputRecordModule(reactContext),
                timerTipManager
        );
    }

    @Override
    public List<Class<? extends JavaScriptModule>> createJSModules() {
        return Collections.emptyList();
    }

    @Override
    public List<ViewManager> createViewManagers(ReactApplicationContext reactContext) {
        if (timerTipManager == null) {
            timerTipManager = new TimerTipManager();
        }
        return Arrays.<ViewManager>asList(
                new RecordViewManager(),
                timerTipManager
        );
    }
}
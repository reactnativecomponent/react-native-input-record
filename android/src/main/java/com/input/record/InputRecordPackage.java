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

    RecordViewManager recordViewManager;

    @Override
    public List<NativeModule> createNativeModules(ReactApplicationContext reactContext) {
        if (recordViewManager == null) {
            recordViewManager = new RecordViewManager();
        }
        return Arrays.<NativeModule>asList(
                recordViewManager
        );
    }

    @Override
    public List<Class<? extends JavaScriptModule>> createJSModules() {
        return Collections.emptyList();
    }

    @Override
    public List<ViewManager> createViewManagers(ReactApplicationContext reactContext) {
        if (recordViewManager == null) {
            recordViewManager = new RecordViewManager();
        }
        return Arrays.<ViewManager>asList(
                new TimerTipManager(),
                recordViewManager
        );
    }
}
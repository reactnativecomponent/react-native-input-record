package com.input.record;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;

public class InputRecordModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public InputRecordModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @Override
  public String getName() {
    return "RNInputRecord";
  }
}
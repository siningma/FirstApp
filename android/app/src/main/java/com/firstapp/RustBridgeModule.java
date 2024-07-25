package com.firstapp;

import android.os.Handler;
import androidx.annotation.NonNull;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Promise;

import java.io.File;

public class RustBridgeModule extends ReactContextBaseJavaModule {

    private static ReactApplicationContext reactContext;

    private static native int nativeAddNumbers(int a, int b);

    // Load the Rust library
    static {
        // main();
        System.loadLibrary("first_app");
    }

    RustBridgeModule(ReactApplicationContext context) {
        super(context);
        reactContext = context;
    }

    @NonNull
    @Override
    public String getName() {
        return "RustModule";
    }

    @ReactMethod
    public void addNumbers(int a, int b, final Promise promise) {
        int result = RustBridgeModule.nativeAddNumbers(a, b);
        promise.resolve(result);
    }

    private static void main() {
        String libraryPath = System.getProperty("java.library.path");
        System.out.println("Library Path: " + libraryPath);

        String[] paths = libraryPath.split(System.getProperty("path.separator"));
        for (String path : paths) {
            File dir = new File(path);
            if (dir.exists() && dir.isDirectory()) {
                System.out.println("Directory: " + dir.getAbsolutePath());
                String[] files = dir.list();
                if (files != null) {
                    for (String file : files) {
                        System.out.println(" - " + file);
                    }
                }
            }
        }
    }
}

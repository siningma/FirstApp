#!/bin/bash

# Directories
RUST_MODULE_DIR="./rust" # Replace with the path to your Rust module
REACT_NATIVE_ANDROID_DIR="./android/app/src/main" # Replace with the path to your React Native Android main directory if different

# Build using cargo-ndk
cd $RUST_MODULE_DIR
cargo ndk --target aarch64-linux-android --platform 24 -- build --release
cargo ndk --target armv7-linux-androideabi --platform 24 -- build --release
cargo ndk --target i686-linux-android --platform 24 -- build --release
cargo ndk --target x86_64-linux-android --platform 24 -- build --release
cd ..

# Copy the .so files to jniLibs folder
mkdir -p "$REACT_NATIVE_ANDROID_DIR/jniLibs/arm64-v8a"
mkdir -p "$REACT_NATIVE_ANDROID_DIR/jniLibs/armeabi-v7a"
mkdir -p "$REACT_NATIVE_ANDROID_DIR/jniLibs/x86"
mkdir -p "$REACT_NATIVE_ANDROID_DIR/jniLibs/x86_64"

cp "$RUST_MODULE_DIR/target/aarch64-linux-android/release/libfirst_app.so" "$REACT_NATIVE_ANDROID_DIR/jniLibs/arm64-v8a/"
cp "$RUST_MODULE_DIR/target/armv7-linux-androideabi/release/libfirst_app.so" "$REACT_NATIVE_ANDROID_DIR/jniLibs/armeabi-v7a/"
cp "$RUST_MODULE_DIR/target/i686-linux-android/release/libfirst_app.so" "$REACT_NATIVE_ANDROID_DIR/jniLibs/x86/"
cp "$RUST_MODULE_DIR/target/x86_64-linux-android/release/libfirst_app.so" "$REACT_NATIVE_ANDROID_DIR/jniLibs/x86_64/"

echo "Build completed and .so files copied successfully!"

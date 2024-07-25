use jni::objects::{JClass, JString};
use jni::sys::jint;
use jni::JNIEnv;

use crate::add_numbers;

#[no_mangle]
pub unsafe extern "C" fn Java_com_firstapp_RustBridgeModule_nativeAddNumbers(
    env: JNIEnv,
    class: JClass,
    a: jint,
    b: jint,
) -> jint {
    add_numbers(a, b)
}

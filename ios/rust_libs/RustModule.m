//
//  RustModule.m
//  FirstApp
//
//

#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"
#import "first_app.h"

@interface RustModule : NSObject <RCTBridgeModule>

@end

@implementation RustModule

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(addNumbers:(int)a b:(int)b
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejector:(RCTPromiseRejectBlock)reject) {
  int result = add_numbers(a, b);
  resolve(@(result));
}

@end

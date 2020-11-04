//
//  Bridge.m
//  RNApp
//
//  Created by Antoine Eddi on 11/4/20.
//

#import <React/RCTBridgeModule.h>
#import "React/RCTBridge.h"

@interface RCT_EXTERN_MODULE(Bridge, NSObject)
   RCT_EXTERN_METHOD(test:(RCTPromiseResolveBlock)resolve
                     reject:(RCTPromiseRejectBlock)reject)
@end

#import "FTxSuperplayerPlugin.h"
#import "FTxSuperplayer.h"

@implementation FTxSuperplayerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"f_tx_superplayer"
            binaryMessenger:[registrar messenger]];
  FTxSuperplayerPlugin* instance = [[FTxSuperplayerPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
    
    
    /// Registrar PlatFormView for FTxSuperplayer
    FTxSuperplayerFactory* factory = [[FTxSuperplayerFactory alloc] init];
        [registrar registerViewFactory:factory withId:@"FTxSuperplayer"];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end

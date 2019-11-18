#import "FlutterResonanceAudioPlugin.h"
#import <flutter_resonance_audio/flutter_resonance_audio-Swift.h>

@implementation FlutterResonanceAudioPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterResonanceAudioPlugin registerWithRegistrar:registrar];
}
@end

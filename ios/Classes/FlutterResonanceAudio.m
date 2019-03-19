#import "FlutterResonanceAudio.h"
#import <flutter_resonance_audio/flutter_resonance_audio-Swift.h>

@implementation FlutterResonanceAudio
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterResonanceAudio registerWithRegistrar:registrar];
}
@end

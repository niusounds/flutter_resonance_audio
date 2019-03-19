import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_resonance_audio/flutter_resonance_audio.dart';

// TODO

void main() {
  const MethodChannel channel = const MethodChannel('flutter_resonance_audio');
  FlutterResonanceAudio audioEngine = FlutterResonanceAudio();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('init', () async {
    audioEngine.init();
  });
}

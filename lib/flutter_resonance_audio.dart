import 'dart:async';

import 'package:flutter/services.dart';

enum RenderingMode {
  STEREO_PANNING,
  BINAURAL_LOW_QUALITY,
  BINAURAL_HIGH_QUALITY,
}

class FlutterResonanceAudio {
  static const _channel = const MethodChannel('flutter_resonance_audio');

  // singleton
  static final _instance = FlutterResonanceAudio._internal();
  factory FlutterResonanceAudio() => _instance;
  FlutterResonanceAudio._internal();

  Future<void> init({
    RenderingMode renderingMode = RenderingMode.BINAURAL_HIGH_QUALITY,
  }) async {
    return _channel.invokeMethod<void>('init', {
      'renderingMode': renderingMode.index,
    });
  }

  Future<int> createSoundObject(
    String filename, {
    bool asset = true,
  }) async {
    return _channel.invokeMethod<int>('createSoundObject', {
      'filename': filename,
      'asset': asset,
    });
  }

  Future<int> createStereoSound(
    String filename, {
    bool asset = true,
  }) async {
    return _channel.invokeMethod<int>('createStereoSound', {
      'filename': filename,
      'asset': asset,
    });
  }

  Future<int> createSoundfield(
    String filename, {
    bool asset = true,
  }) {
    return _channel.invokeMethod<int>('createSoundfield', {
      'filename': filename,
      'asset': asset,
    });
  }

  Future<void> enableRoom(bool enable) {
    return _channel.invokeMethod<void>('enableRoom', {
      'enable': enable,
    });
  }

  Future<void> enableSpeakerStereoMode(bool enable) {
    return _channel.invokeMethod<void>('enableSpeakerStereoMode', {
      'enable': enable,
    });
  }

  Future<bool> isSoundPlaying(int sourceId) {
    return _channel.invokeMethod<bool>('isSoundPlaying', {
      'sourceId': sourceId,
    });
  }

  Future<bool> isSourceIdValid(int sourceId) {
    return _channel.invokeMethod<bool>('isSourceIdValid', {
      'sourceId': sourceId,
    });
  }

  Future<void> pause() {
    return _channel.invokeMethod<void>('pause');
  }

  Future<void> pauseSound(int sourceId) {
    return _channel.invokeMethod<void>('pauseSound', {
      'sourceId': sourceId,
    });
  }

  Future<void> playSound(
    int sourceId, {
    bool loopingEnabled = false,
  }) {
    return _channel.invokeMethod<void>('playSound', {
      'sourceId': sourceId,
      'loopingEnabled': loopingEnabled,
    });
  }

  Future<bool> preloadSoundFile(
    String filename, {
    bool asset = true,
  }) {
    return _channel.invokeMethod<bool>('preloadSoundFile', {
      'filename': filename,
      'asset': asset,
    });
  }

  Future<void> resume() {
    return _channel.invokeMethod<void>('resume');
  }

  Future<void> resumeSound(int sourceId) {
    return _channel.invokeMethod<void>('resumeSound', {
      'sourceId': sourceId,
    });
  }

  Future<void> setHeadPosition(double x, double y, double z) {
    return _channel.invokeMethod<void>('setHeadPosition', {
      'x': x,
      'y': y,
      'z': z,
    });
  }

  Future<void> setHeadRotation(double x, double y, double z, double w) {
    return _channel.invokeMethod<void>('setHeadRotation', {
      'x': x,
      'y': y,
      'z': z,
      'w': w,
    });
  }

  Future<void> setRoomProperties(
    double sizeX,
    double sizeY,
    double sizeZ,
    int wallMaterial,
    int ceilingMaterial,
    int floorMaterial,
  ) {
    return _channel.invokeMethod<void>('setRoomProperties', {
      'sizeX': sizeX,
      'sizeY': sizeY,
      'sizeZ': sizeZ,
      'wallMaterial': wallMaterial,
      'ceilingMaterial': ceilingMaterial,
      'floorMaterial': floorMaterial,
    });
  }

  Future<void> setRoomReverbAdjustments(
    double gain,
    double timeAdjust,
    double brightnessAdjust,
  ) {
    return _channel.invokeMethod<void>('setRoomReverbAdjustments', {
      'gain': gain,
      'timeAdjust': timeAdjust,
      'brightnessAdjust': brightnessAdjust,
    });
  }

  Future setSoundObjectDistanceRolloffModel(
    int soundObjectId,
    int rolloffModel,
    double minDistance,
    double maxDistance,
  ) {
    return _channel.invokeMethod<void>('setSoundObjectDistanceRolloffModel', {
      'soundObjectId': soundObjectId,
      'rolloffModel': rolloffModel,
      'minDistance': minDistance,
      'maxDistance': maxDistance,
    });
  }

  Future<void> setSoundObjectPosition(
      int soundObjectId, double x, double y, double z) {
    return _channel.invokeMethod<void>('setSoundObjectPosition', {
      'soundObjectId': soundObjectId,
      'x': x,
      'y': y,
      'z': z,
    });
  }

  Future<void> setSoundVolume(int soundObjectId, double volume) {
    return _channel.invokeMethod<void>('setSoundVolume', {
      'soundObjectId': soundObjectId,
      'volume': volume,
    });
  }

  Future<void> setSoundfieldRotation(
      int soundObjectId, double x, double y, double z, double w) {
    return _channel.invokeMethod<void>('setSoundfieldRotation', {
      'soundObjectId': soundObjectId,
      'x': x,
      'y': y,
      'z': z,
      'w': w,
    });
  }

  Future<void> stopSound(int sourceId) {
    return _channel.invokeMethod<void>('stopSound', {
      'sourceId': sourceId,
    });
  }

  Future<void> unloadSoundFile(String filename) {
    return _channel.invokeMethod<void>('unloadSoundFile', {
      'filename': filename,
    });
  }

  Future<void> update() {
    return _channel.invokeMethod<void>('update');
  }
}

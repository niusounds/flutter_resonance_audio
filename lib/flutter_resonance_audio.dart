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

  /// Initialize audio engine. Must be called before any other calls of this class.
  Future<void> init({
    RenderingMode renderingMode = RenderingMode.BINAURAL_HIGH_QUALITY,
  }) async {
    return _channel.invokeMethod<void>('init', {
      'renderingMode': renderingMode.index,
    });
  }

  /// Returns a new sound object handle.
  /// [filename] is Flutter asset name.
  /// To specify external file instead of asset, set [asset] to false.
  Future<int> createSoundObject(
    String filename, {
    bool asset = true,
  }) async {
    return _channel.invokeMethod<int>('createSoundObject', {
      'filename': filename,
      'asset': asset,
    });
  }

  /// Returns a new Ambisonic soundfield handle.
  /// [filename] is Flutter asset name.
  /// To specify external file instead of asset, set [asset] to false.
  Future<int> createStereoSound(
    String filename, {
    bool asset = true,
  }) async {
    return _channel.invokeMethod<int>('createStereoSound', {
      'filename': filename,
      'asset': asset,
    });
  }

  /// Returns a new non-spatialized stereo sound.
  /// [filename] is Flutter asset name.
  /// To specify external file instead of asset, set [asset] to false.
  Future<int> createSoundfield(
    String filename, {
    bool asset = true,
  }) {
    return _channel.invokeMethod<int>('createSoundfield', {
      'filename': filename,
      'asset': asset,
    });
  }

  /// Turns on/off the room reverberation effects.
  Future<void> enableRoom(bool enable) {
    return _channel.invokeMethod<void>('enableRoom', {
      'enable': enable,
    });
  }

  /// Enables the stereo speaker mode.
  Future<void> enableSpeakerStereoMode(bool enable) {
    return _channel.invokeMethod<void>('enableSpeakerStereoMode', {
      'enable': enable,
    });
  }

  /// Checks if a sound is playing.
  Future<bool> isSoundPlaying(int sourceId) {
    return _channel.invokeMethod<bool>('isSoundPlaying', {
      'sourceId': sourceId,
    });
  }

  /// Checks if a [sourceId] is valid, and that the corresponding source is in a playable state.
  Future<bool> isSourceIdValid(int sourceId) {
    return _channel.invokeMethod<bool>('isSourceIdValid', {
      'sourceId': sourceId,
    });
  }

  /// Pauses the GVR Audio system.
  Future<void> pause() {
    return _channel.invokeMethod<void>('pause');
  }

  /// Pauses the playback of a sound.
  Future<void> pauseSound(int sourceId) {
    return _channel.invokeMethod<void>('pauseSound', {
      'sourceId': sourceId,
    });
  }

  /// Starts the playback of a sound.
  Future<void> playSound(
    int sourceId, {
    bool loopingEnabled = false,
  }) {
    return _channel.invokeMethod<void>('playSound', {
      'sourceId': sourceId,
      'loopingEnabled': loopingEnabled,
    });
  }

  /// Preloads a sound file.
  /// [filename] is Flutter asset name.
  /// To specify external file instead of asset, set [asset] to false.
  Future<bool> preloadSoundFile(
    String filename, {
    bool asset = true,
  }) {
    return _channel.invokeMethod<bool>('preloadSoundFile', {
      'filename': filename,
      'asset': asset,
    });
  }

  /// Resumes the GVR Audio system.
  Future<void> resume() {
    return _channel.invokeMethod<void>('resume');
  }

  /// Resumes the playback of a sound.
  Future<void> resumeSound(int sourceId) {
    return _channel.invokeMethod<void>('resumeSound', {
      'sourceId': sourceId,
    });
  }

  /// Sets the head position.
  Future<void> setHeadPosition(double x, double y, double z) {
    return _channel.invokeMethod<void>('setHeadPosition', {
      'x': x,
      'y': y,
      'z': z,
    });
  }

  /// Sets the head rotation.
  Future<void> setHeadRotation(double x, double y, double z, double w) {
    return _channel.invokeMethod<void>('setHeadRotation', {
      'x': x,
      'y': y,
      'z': z,
      'w': w,
    });
  }

  /// Sets the room properties describing the dimensions and surface materials of a given room.
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

  /// Adjusts the properties of the current reverb, allowing changes to the reverb's gain, duration and low/high frequency balance.
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

  /// Sets the given sound object source's distance attenuation method with minimum and maximum distances.
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

  /// Repositions an existing sound object.
  Future<void> setSoundObjectPosition(
      int soundObjectId, double x, double y, double z) {
    return _channel.invokeMethod<void>('setSoundObjectPosition', {
      'soundObjectId': soundObjectId,
      'x': x,
      'y': y,
      'z': z,
    });
  }

  /// Changes the volume of an existing sound.
  Future<void> setSoundVolume(int soundObjectId, double volume) {
    return _channel.invokeMethod<void>('setSoundVolume', {
      'soundObjectId': soundObjectId,
      'volume': volume,
    });
  }

  /// Sets the rotation of an existing Ambisonic soundfield.
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

  /// Stops the playback of a sound and destroys the corresponding Sound Object or Soundfield.
  Future<void> stopSound(int sourceId) {
    return _channel.invokeMethod<void>('stopSound', {
      'sourceId': sourceId,
    });
  }

  /// Unloads a sound file from the sample cache.
  /// [filename] is Flutter asset name.
  /// To specify external file instead of asset, set [asset] to false.
  Future<void> unloadSoundFile(String filename) {
    return _channel.invokeMethod<void>('unloadSoundFile', {
      'filename': filename,
    });
  }

  /// The update method must be called from the main thread at a regular rate.
  Future<void> update() {
    return _channel.invokeMethod<void>('update');
  }
}

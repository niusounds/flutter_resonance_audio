# flutter_resonance_audio

[Resonance Audio](https://github.com/resonance-audio/resonance-audio) plugin for Flutter.

Currently for Android only. **Please help me for supporting iOS.**

## Usage 

To use this plugin, add `flutter_resonance_audio` as a dependency in your pubspec.yaml file.

## Example

```dart
import 'package:flutter/material.dart';
import 'package:flutter_resonance_audio/flutter_resonance_audio.dart';

final audioEngine = FlutterResonanceAudio();

void main() async {
  await audioEngine.init();

  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
      child: RaisedButton(
        onPressed: _playSound,
        child: Text('Play sound'),
        ),
      ),
    ),
  ));
}

_playSound() async {
  int sourceId = await audioEngine.createSoundObject('assets/sound.ogg');
  audioEngine.playSound(sourceId);
}
```

## API

This library mirrors [GvrAudioEngine](https://developers.google.com/vr/reference/android/com/google/vr/sdk/audio/GvrAudioEngine) API (except `init`).

Return type (Future) | Method | Description
--- | --- | ---
int | createSoundObject(String filename) | Returns a new sound object handle.
int | createSoundfield(String filename) | Returns a new Ambisonic soundfield handle.
int | createStereoSound(String filename) | Returns a new non-spatialized stereo sound.
void | enableRoom(boolean enable) | Turns on/off the room reverberation effects.
void | enableSpeakerStereoMode(boolean enable) | Enables the stereo speaker mode.
boolean | isSoundPlaying(int sourceId) | Checks if a sound is playing.
boolean | isSourceIdValid(int sourceId) | Checks if a |sourceId| is valid, and that the corresponding source is in a playable state.
void | pause() | Pauses the GVR Audio system.
void | pauseSound(int sourceId) | Pauses the playback of a sound.
void | playSound(int sourceId, boolean loopingEnabled) | Starts the playback of a sound.
boolean | preloadSoundFile(String filename) | Preloads a sound file.
void | resume() | Resumes the GVR Audio system.
void | resumeSound(int sourceId) | Resumes the playback of a sound.
void | setHeadPosition(float x, float y, float z) | Sets the head position.
void | setHeadRotation(float x, float y, float z, float w) | Sets the head rotation.
void | setRoomProperties(float sizeX, float sizeY, float sizeZ, int wallMaterial, int ceilingMaterial, int floorMaterial) | Sets the room properties describing the dimensions and surface materials of a given room.
void | setRoomReverbAdjustments(float gain, float timeAdjust, float brightnessAdjust) | Adjusts the properties of the current reverb, allowing changes to the reverb's gain, duration and low/high frequency balance.
void | setSoundObjectDistanceRolloffModel(int soundObjectId, int rolloffModel, float minDistance, float maxDistance) | Sets the given sound object source's distance attenuation method with minimum and maximum distances.
void | setSoundObjectPosition(int soundObjectId, float x, float y, float z) | Repositions an existing sound object.
void | setSoundVolume(int sourceId, float volume) | Changes the volume of an existing sound.
void | setSoundfieldRotation(int soundfieldId, float x, float y, float z, float w) | Sets the rotation of an existing Ambisonic soundfield.
void | stopSound(int sourceId) | Stops the playback of a sound and destroys the corresponding Sound Object or Soundfield.
void | unloadSoundFile(String filename) | Unloads a sound file from the sample cache.
void | update() | The update method must be called from the main thread at a regular rate.

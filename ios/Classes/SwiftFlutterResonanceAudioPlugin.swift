import Flutter
import UIKit

public class SwiftFlutterResonanceAudioPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_resonance_audio", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterResonanceAudioPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "init": resonanceAudioInit(call, result)
    case "createSoundObject": createSoundObject(call, result)
    case "createStereoSound": createStereoSound(call, result)
    case "createSoundfield": createSoundfield(call, result)
    case "enableRoom": enableRoom(call, result)
    case "enableSpeakerStereoMode": enableSpeakerStereoMode(call, result)
    case "isSoundPlaying": isSoundPlaying(call, result)
    case "isSourceIdValid": isSourceIdValid(call, result)
    case "pause": pause(call, result)
    case "pauseSound": pauseSound(call, result)
    case "playSound": playSound(call, result)
    case "preloadSoundFile": preloadSoundFile(call, result)
    case "resume": resume(call, result)
    case "resumeSound": resumeSound(call, result)
    case "setHeadPosition": setHeadPosition(call, result)
    case "setHeadRotation": setHeadRotation(call, result)
    case "setRoomProperties": setRoomProperties(call, result)
    case "setRoomReverbAdjustments": setRoomReverbAdjustments(call, result)
    case "setSoundObjectDistanceRolloffModel": setSoundObjectDistanceRolloffModel(call, result)
    case "setSoundObjectPosition": setSoundObjectPosition(call, result)
    case "setSoundVolume": setSoundVolume(call, result)
    case "setSoundfieldRotation": setSoundfieldRotation(call, result)
    case "stopSound": stopSound(call, result)
    case "unloadSoundFile": unloadSoundFile(call, result)
    case "update": update(call, result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func resonanceAudioInit(_: FlutterMethodCall, _ result: FlutterResult) {
    result(nil)
  }

  private func createSoundObject(_: FlutterMethodCall, _ result: FlutterResult) {
    result(nil)
  }

  private func createStereoSound(_: FlutterMethodCall, _ result: FlutterResult) {
    result(nil)
  }

  private func createSoundfield(_: FlutterMethodCall, _ result: FlutterResult) {
    result(nil)
  }

  private func enableRoom(_: FlutterMethodCall, _ result: FlutterResult) {
    result(nil)
  }

  private func enableSpeakerStereoMode(_: FlutterMethodCall, _ result: FlutterResult) {
    result(nil)
  }

  private func isSoundPlaying(_: FlutterMethodCall, _ result: FlutterResult) {
    result(false)
  }

  private func isSourceIdValid(_: FlutterMethodCall, _ result: FlutterResult) {
    result(false)
  }

  private func pause(_: FlutterMethodCall, _ result: FlutterResult) {
    result(nil)
  }

  private func pauseSound(_: FlutterMethodCall, _ result: FlutterResult) {
    result(nil)
  }

  private func playSound(_: FlutterMethodCall, _ result: FlutterResult) {
    result(nil)
  }

  private func preloadSoundFile(_: FlutterMethodCall, _ result: FlutterResult) {
    result(true)
  }

  private func resume(_: FlutterMethodCall, _ result: FlutterResult) {
    result(nil)
  }

  private func resumeSound(_: FlutterMethodCall, _ result: FlutterResult) {
    result(nil)
  }

  private func setHeadPosition(_: FlutterMethodCall, _ result: FlutterResult) {
    result(nil)
  }

  private func setHeadRotation(_: FlutterMethodCall, _ result: FlutterResult) {
    result(nil)
  }

  private func setRoomProperties(_: FlutterMethodCall, _ result: FlutterResult) {
    result(nil)
  }

  private func setRoomReverbAdjustments(_: FlutterMethodCall, _ result: FlutterResult) {
    result(nil)
  }

  private func setSoundObjectDistanceRolloffModel(_: FlutterMethodCall, _ result: FlutterResult) {
    result(nil)
  }

  private func setSoundObjectPosition(_: FlutterMethodCall, _ result: FlutterResult) {
    result(nil)
  }

  private func setSoundVolume(_: FlutterMethodCall, _ result: FlutterResult) {
    result(nil)
  }

  private func setSoundfieldRotation(_: FlutterMethodCall, _ result: FlutterResult) {
    result(nil)
  }

  private func stopSound(_: FlutterMethodCall, _ result: FlutterResult) {
    result(nil)
  }

  private func unloadSoundFile(_: FlutterMethodCall, _ result: FlutterResult) {
    result(nil)
  }

  private func update(_: FlutterMethodCall, _ result: FlutterResult) {
    result(nil)
  }
}

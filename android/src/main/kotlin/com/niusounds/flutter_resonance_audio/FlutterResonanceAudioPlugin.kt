package com.niusounds.flutter_resonance_audio

import com.google.vr.sdk.audio.GvrAudioEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class FlutterResonanceAudioPlugin(private val registrar: Registrar) : MethodCallHandler {
    private lateinit var gvrAudioEngine: GvrAudioEngine

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "flutter_resonance_audio")
            channel.setMethodCallHandler(FlutterResonanceAudioPlugin(registrar))
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "init" -> init(call, result)
            "createSoundObject" -> createSoundObject(call, result)
            "createStereoSound" -> createStereoSound(call, result)
            "createSoundfield" -> createSoundfield(call, result)
            "enableRoom" -> enableRoom(call, result)
            "enableSpeakerStereoMode" -> enableSpeakerStereoMode(call, result)
            "isSoundPlaying" -> isSoundPlaying(call, result)
            "isSourceIdValid" -> isSourceIdValid(call, result)
            "pause" -> pause(call, result)
            "pauseSound" -> pauseSound(call, result)
            "playSound" -> playSound(call, result)
            "preloadSoundFile" -> preloadSoundFile(call, result)
            "resume" -> resume(call, result)
            "resumeSound" -> resumeSound(call, result)
            "setHeadPosition" -> setHeadPosition(call, result)
            "setHeadRotation" -> setHeadRotation(call, result)
            "setRoomProperties" -> setRoomProperties(call, result)
            "setRoomReverbAdjustments" -> setRoomReverbAdjustments(call, result)
            "setSoundObjectDistanceRolloffModel" -> setSoundObjectDistanceRolloffModel(call, result)
            "setSoundObjectPosition" -> setSoundObjectPosition(call, result)
            "setSoundVolume" -> setSoundVolume(call, result)
            "setSoundfieldRotation" -> setSoundfieldRotation(call, result)
            "stopSound" -> stopSound(call, result)
            "unloadSoundFile" -> unloadSoundFile(call, result)
            "update" -> update(call, result)
            else -> result.notImplemented()
        }
    }

    private fun init(call: MethodCall, result: Result) {
        val renderingMode = call.argument<Int>("renderingMode")
                ?: GvrAudioEngine.RenderingMode.BINAURAL_HIGH_QUALITY
        gvrAudioEngine = GvrAudioEngine(registrar.context(), renderingMode)

        result.success(null)
    }

    private fun createSoundObject(call: MethodCall, result: Result) {
        assert(::gvrAudioEngine.isInitialized) { "GvrAudioEngine is not initialized. Call init() first." }

        val filename = call.argument<String>("filename")
        val asset = call.argument<Boolean>("asset") ?: true
        if (asset) {
            result.success(gvrAudioEngine.createSoundObject(registrar.lookupKeyForAsset(filename)))
        } else {
            result.success(gvrAudioEngine.createSoundObject(filename))
        }
    }

    private fun createStereoSound(call: MethodCall, result: Result) {
        assert(::gvrAudioEngine.isInitialized) { "GvrAudioEngine is not initialized. Call init() first." }

        val filename = call.argument<String>("filename")
        val asset = call.argument<Boolean>("asset") ?: true
        if (asset) {
            result.success(gvrAudioEngine.createStereoSound(registrar.lookupKeyForAsset(filename)))
        } else {
            result.success(gvrAudioEngine.createStereoSound(filename))
        }
    }

    private fun createSoundfield(call: MethodCall, result: Result) {
        assert(::gvrAudioEngine.isInitialized) { "GvrAudioEngine is not initialized. Call init() first." }

        val filename = call.argument<String>("filename")
        val asset = call.argument<Boolean>("asset") ?: true
        if (asset) {
            result.success(gvrAudioEngine.createSoundfield(registrar.lookupKeyForAsset(filename)))
        } else {
            result.success(gvrAudioEngine.createSoundfield(filename))
        }
    }


    private fun enableRoom(call: MethodCall, result: Result) {
        assert(::gvrAudioEngine.isInitialized) { "GvrAudioEngine is not initialized. Call init() first." }

        val enable = call.argument<Boolean>("enable")
                ?: return result.error("Invalid argument", "enable is required", null)
        gvrAudioEngine.enableRoom(enable)

        result.success(null)
    }


    private fun enableSpeakerStereoMode(call: MethodCall, result: Result) {
        assert(::gvrAudioEngine.isInitialized) { "GvrAudioEngine is not initialized. Call init() first." }

        val enable = call.argument<Boolean>("enable")
                ?: return result.error("Invalid argument", "enable is required", null)
        gvrAudioEngine.enableSpeakerStereoMode(enable)

        result.success(null)
    }

    private fun isSoundPlaying(call: MethodCall, result: Result) {
        assert(::gvrAudioEngine.isInitialized) { "GvrAudioEngine is not initialized. Call init() first." }

        val sourceId = call.argument<Int>("sourceId")
                ?: return result.error("Invalid argument", "sourceId is required", null)
        result.success(gvrAudioEngine.isSoundPlaying(sourceId))
    }

    private fun isSourceIdValid(call: MethodCall, result: Result) {
        assert(::gvrAudioEngine.isInitialized) { "GvrAudioEngine is not initialized. Call init() first." }

        val sourceId = call.argument<Int>("sourceId")
                ?: return result.error("Invalid argument", "sourceId is required", null)
        result.success(gvrAudioEngine.isSourceIdValid(sourceId))
    }

    private fun pause(call: MethodCall, result: Result) {
        assert(::gvrAudioEngine.isInitialized) { "GvrAudioEngine is not initialized. Call init() first." }

        gvrAudioEngine.pause()

        result.success(null)
    }

    private fun pauseSound(call: MethodCall, result: Result) {
        assert(::gvrAudioEngine.isInitialized) { "GvrAudioEngine is not initialized. Call init() first." }

        val sourceId = call.argument<Int>("sourceId")
                ?: return result.error("Invalid argument", "sourceId is required", null)
        gvrAudioEngine.pauseSound(sourceId)

        result.success(null)
    }

    private fun playSound(call: MethodCall, result: Result) {
        assert(::gvrAudioEngine.isInitialized) { "GvrAudioEngine is not initialized. Call init() first." }

        val sourceId = call.argument<Int>("sourceId")
                ?: return result.error("Invalid argument", "sourceId is required", null)
        val loopingEnabled = call.argument<Boolean>("loopingEnabled")
                ?: return result.error("Invalid argument", "loopingEnabled is required", null)
        gvrAudioEngine.playSound(sourceId, loopingEnabled)

        result.success(null)
    }

    private fun preloadSoundFile(call: MethodCall, result: Result) {
        assert(::gvrAudioEngine.isInitialized) { "GvrAudioEngine is not initialized. Call init() first." }

        val filename = call.argument<String>("filename")
                ?: return result.error("Invalid argument", "filename is required", null)
        val asset = call.argument<Boolean>("asset") ?: true
        if (asset) {
            result.success(gvrAudioEngine.preloadSoundFile(registrar.lookupKeyForAsset(filename)))
        } else {
            result.success(gvrAudioEngine.preloadSoundFile(filename))
        }
    }

    private fun resume(call: MethodCall, result: Result) {
        assert(::gvrAudioEngine.isInitialized) { "GvrAudioEngine is not initialized. Call init() first." }

        gvrAudioEngine.resume()

        result.success(null)
    }

    private fun resumeSound(call: MethodCall, result: Result) {
        assert(::gvrAudioEngine.isInitialized) { "GvrAudioEngine is not initialized. Call init() first." }

        val sourceId = call.argument<Int>("sourceId")
                ?: return result.error("Invalid argument", "sourceId is required", null)
        gvrAudioEngine.resumeSound(sourceId)

        result.success(null)
    }

    private fun setHeadPosition(call: MethodCall, result: Result) {
        assert(::gvrAudioEngine.isInitialized) { "GvrAudioEngine is not initialized. Call init() first." }

        val x = call.argument<Double>("x")
                ?: return result.error("Invalid argument", "x is required", null)
        val y = call.argument<Double>("y")
                ?: return result.error("Invalid argument", "y is required", null)
        val z = call.argument<Double>("z")
                ?: return result.error("Invalid argument", "z is required", null)
        gvrAudioEngine.setHeadPosition(x.toFloat(), y.toFloat(), z.toFloat())

        result.success(null)
    }

    private fun setHeadRotation(call: MethodCall, result: Result) {
        assert(::gvrAudioEngine.isInitialized) { "GvrAudioEngine is not initialized. Call init() first." }

        val x = call.argument<Double>("x")
                ?: return result.error("Invalid argument", "x is required", null)
        val y = call.argument<Double>("y")
                ?: return result.error("Invalid argument", "y is required", null)
        val z = call.argument<Double>("z")
                ?: return result.error("Invalid argument", "z is required", null)
        val w = call.argument<Double>("w")
                ?: return result.error("Invalid argument", "w is required", null)
        gvrAudioEngine.setHeadRotation(x.toFloat(), y.toFloat(), z.toFloat(), w.toFloat())

        result.success(null)
    }

    private fun setRoomProperties(call: MethodCall, result: Result) {
        assert(::gvrAudioEngine.isInitialized) { "GvrAudioEngine is not initialized. Call init() first." }

        val sizeX = call.argument<Double>("sizeX")
                ?: return result.error("Invalid argument", "sizeX is required", null)
        val sizeY = call.argument<Double>("sizeY")
                ?: return result.error("Invalid argument", "sizeY is required", null)
        val sizeZ = call.argument<Double>("sizeZ")
                ?: return result.error("Invalid argument", "sizeZ is required", null)
        val wallMaterial = call.argument<Int>("wallMaterial")
                ?: return result.error("Invalid argument", "wallMaterial is required", null)
        val ceilingMaterial = call.argument<Int>("ceilingMaterial")
                ?: return result.error("Invalid argument", "ceilingMaterial is required", null)
        val floorMaterial = call.argument<Int>("floorMaterial")
                ?: return result.error("Invalid argument", "floorMaterial is required", null)
        gvrAudioEngine.setRoomProperties(sizeX.toFloat(), sizeY.toFloat(), sizeZ.toFloat(), wallMaterial, ceilingMaterial, floorMaterial)

        result.success(null)
    }


    private fun setRoomReverbAdjustments(call: MethodCall, result: Result) {
        assert(::gvrAudioEngine.isInitialized) { "GvrAudioEngine is not initialized. Call init() first." }

        val gain = call.argument<Double>("gain")
                ?: return result.error("Invalid argument", "gain is required", null)
        val timeAdjust = call.argument<Double>("timeAdjust")
                ?: return result.error("Invalid argument", "timeAdjust is required", null)
        val brightnessAdjust = call.argument<Double>("brightnessAdjust")
                ?: return result.error("Invalid argument", "brightnessAdjust is required", null)
        gvrAudioEngine.setRoomReverbAdjustments(gain.toFloat(), timeAdjust.toFloat(), brightnessAdjust.toFloat())

        result.success(null)
    }

    private fun setSoundObjectDistanceRolloffModel(call: MethodCall, result: Result) {
        assert(::gvrAudioEngine.isInitialized) { "GvrAudioEngine is not initialized. Call init() first." }

        val soundObjectId = call.argument<Int>("soundObjectId")
                ?: return result.error("Invalid argument", "soundObjectId is required", null)
        val rolloffModel = call.argument<Int>("rolloffModel")
                ?: return result.error("Invalid argument", "rolloffModel is required", null)
        val minDistance = call.argument<Double>("minDistance")
                ?: return result.error("Invalid argument", "minDistance is required", null)
        val maxDistance = call.argument<Double>("maxDistance")
                ?: return result.error("Invalid argument", "maxDistance is required", null)
        gvrAudioEngine.setSoundObjectDistanceRolloffModel(soundObjectId, rolloffModel, minDistance.toFloat(), maxDistance.toFloat())

        result.success(null)
    }

    private fun setSoundObjectPosition(call: MethodCall, result: Result) {
        assert(::gvrAudioEngine.isInitialized) { "GvrAudioEngine is not initialized. Call init() first." }

        val soundObjectId = call.argument<Int>("soundObjectId")
                ?: return result.error("Invalid argument", "soundObjectId is required", null)
        val x = call.argument<Double>("x")
                ?: return result.error("Invalid argument", "x is required", null)
        val y = call.argument<Double>("y")
                ?: return result.error("Invalid argument", "y is required", null)
        val z = call.argument<Double>("z")
                ?: return result.error("Invalid argument", "z is required", null)
        gvrAudioEngine.setSoundObjectPosition(soundObjectId, x.toFloat(), y.toFloat(), z.toFloat())

        result.success(null)
    }

    private fun setSoundVolume(call: MethodCall, result: Result) {
        assert(::gvrAudioEngine.isInitialized) { "GvrAudioEngine is not initialized. Call init() first." }

        val soundObjectId = call.argument<Int>("soundObjectId")
                ?: return result.error("Invalid argument", "soundObjectId is required", null)
        val volume = call.argument<Double>("volume")
                ?: return result.error("Invalid argument", "volume is required", null)
        gvrAudioEngine.setSoundVolume(soundObjectId, volume.toFloat())

        result.success(null)
    }

    private fun setSoundfieldRotation(call: MethodCall, result: Result) {
        assert(::gvrAudioEngine.isInitialized) { "GvrAudioEngine is not initialized. Call init() first." }

        val soundObjectId = call.argument<Int>("soundObjectId")
                ?: return result.error("Invalid argument", "soundObjectId is required", null)
        val x = call.argument<Double>("x")
                ?: return result.error("Invalid argument", "x is required", null)
        val y = call.argument<Double>("y")
                ?: return result.error("Invalid argument", "y is required", null)
        val z = call.argument<Double>("z")
                ?: return result.error("Invalid argument", "z is required", null)
        val w = call.argument<Double>("w")
                ?: return result.error("Invalid argument", "w is required", null)
        gvrAudioEngine.setSoundfieldRotation(soundObjectId, x.toFloat(), y.toFloat(), z.toFloat(), w.toFloat())

        result.success(null)
    }

    private fun stopSound(call: MethodCall, result: Result) {
        assert(::gvrAudioEngine.isInitialized) { "GvrAudioEngine is not initialized. Call init() first." }

        val sourceId = call.argument<Int>("sourceId")
                ?: return result.error("Invalid argument", "sourceId is required", null)
        gvrAudioEngine.stopSound(sourceId)

        result.success(null)
    }

    private fun unloadSoundFile(call: MethodCall, result: Result) {
        assert(::gvrAudioEngine.isInitialized) { "GvrAudioEngine is not initialized. Call init() first." }

        val filename = call.argument<String>("filename")
                ?: return result.error("Invalid argument", "filename is required", null)
        val asset = call.argument<Boolean>("asset") ?: true

        if (asset) {
            gvrAudioEngine.unloadSoundFile(registrar.lookupKeyForAsset(filename))
        } else {
            gvrAudioEngine.unloadSoundFile(filename)
        }

        result.success(null)
    }

    private fun update(call: MethodCall, result: Result) {
        assert(::gvrAudioEngine.isInitialized) { "GvrAudioEngine is not initialized. Call init() first." }

        gvrAudioEngine.update()

        result.success(null)
    }
}

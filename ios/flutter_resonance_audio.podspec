#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_resonance_audio'
  s.version          = '0.0.1'
  s.summary          = 'Resonance Audio plugin for Flutter.'
  s.description      = <<-DESC
Resonance Audio plugin for Flutter.
                       DESC
  s.homepage         = 'https://github.com/niusounds/flutter_resonance_audio'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Yuya Matsuo' => 'niu@niusounds.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'GVRAudioSDK'
  s.static_framework = true

  s.ios.deployment_target = '8.0'
end


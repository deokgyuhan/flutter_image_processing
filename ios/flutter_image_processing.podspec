#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_camera_calibration.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_image_processing'
  s.version          = '0.0.3'
  s.summary          = 'A new Flutter FFI plugin project.'
  s.description      = <<-DESC

A new Flutter FFI plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }

  # This will ensure the source files in Classes/ are included in the native
  # builds of apps using this FFI plugin. Podspec does not support relative
  # paths, so Classes contains a forwarder C file that relatively imports
  # `../src/*` so that the C sources can be shared among all target platforms.
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # telling linker to include opencv2 framework
  s.xcconfig = {
     'OTHER_LDFLAGS' => '-framework opencv2 -all_load',
     'CLANG_CXX_LANGUAGE_STANDARD' => 'c++20',
  }

  ## including OpenCV 4.7 framework
  # s.vendored_frameworks = 'opencv2.framework'
  ## telling CocoaPods not to remove framework
  # s.preserve_paths = 'opencv2.framework'

  # flutter_image_processing
  s.dependency              'OpenCV', '4.3.0'
  s.library               = 'c++'
  s.static_framework      = true

  # module_map is needed so this module can be used as a framework
  s.module_map = 'flutter_image_processing.modulemap'
end

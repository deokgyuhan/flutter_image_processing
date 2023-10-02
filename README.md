# flutter_image_processing

A new Flutter FFI plugin project.

## Getting Started

This project is a starting point for a Flutter
[FFI plugin](https://docs.flutter.dev/development/platform-integration/c-interop),
a specialized package that includes native code directly invoked with Dart FFI.

## Project structure

This template uses the following structure:

* `src`: Contains the native source code, and a CmakeFile.txt file for building
  that source code into a dynamic library.

* `lib`: Contains the Dart code that defines the API of the plugin, and which
  calls into the native code using `dart:ffi`.

* platform folders (`android`, `ios`, `windows`, etc.): Contains the build files
  for building and bundling the native code library with the platform application.

## Building and bundling native code

The `pubspec.yaml` specifies FFI plugins as follows:

```yaml
  plugin:
    platforms:
      some_platform:
        ffiPlugin: true
```

This configuration invokes the native build for the various target platforms
and bundles the binaries in Flutter applications using these FFI plugins.

This can be combined with dartPluginClass, such as when FFI is used for the
implementation of one platform in a federated plugin:

```yaml
  plugin:
    implements: some_other_plugin
    platforms:
      some_platform:
        dartPluginClass: SomeClass
        ffiPlugin: true
```

A plugin can have both FFI and method channels:

```yaml
  plugin:
    platforms:
      some_platform:
        pluginClass: SomeName
        ffiPlugin: true
```

The native build systems that are invoked by FFI (and method channel) plugins are:

* For Android: Gradle, which invokes the Android NDK for native builds.
  * See the documentation in android/build.gradle.
* For iOS and MacOS: Xcode, via CocoaPods.
  * See the documentation in ios/flutter_image_processing.podspec.
  * See the documentation in macos/flutter_image_processing.podspec.
* For Linux and Windows: CMake.
  * See the documentation in linux/CMakeLists.txt.
  * See the documentation in windows/CMakeLists.txt.

## Binding to native code

To use the native code, bindings in Dart are needed.
To avoid writing these by hand, they are generated from the header file
(`src/flutter_image_processing.h`) by `package:ffigen`.
Regenerate the bindings by running `flutter pub run ffigen --config ffigen.yaml`.

## Invoking native code

Very short-running native functions can be directly invoked from any isolate.
For example, see `sum` in `lib/flutter_image_processing.dart`.

Longer-running functions should be invoked on a helper isolate to avoid
dropping frames in Flutter applications.
For example, see `sumAsync` in `lib/flutter_image_processing.dart`.

## 작업일지

### 2023.10.02
* pub.dev에서 플러그인 이름 충돌안나게 확인한후 프로젝트 생성후 깃허브 게시.. 일단 기본 기능만 만들어놓고 업데이트중으로 하고 pub.dev에 올려야 될것 같다. 
  
  이유는 그사이에 내가 만들어놓은 플러그인 이름을 다른 개발자가 먼저 만들고 올릴 수도 있으므로...

* 기본 필터 가우시안/블러 만들어서 오늘중에 일단 게시하도록.. 다만 개발중으로 README에 안내하고

* 개발환경 마무리하고 flutter pub run ffigen --config ffigen.yaml 실행

* chmod 755 init.sh -> chmod 755 update_ios.sh -> init.sh 실행

* ios에 opencv.framework 삭제

* .gitignore에 아래 디렉토리 추가후 커밋
  /ios/opencv2.framework/
  /src/include/
  /android/src/main/jniLibs/

* 이제 순차적으로   /src/include/, /android/src/main/jniLibs/ 주석처리하고 github 커밋

git 명령어 참조
```
>  git lfs install
>  git lfs track "*.so"
>  git add .gitattributes

>  git lfs track "*.h"
>  git lfs track "*.hpp"
>  git add .gitattributes
```

* 먼저 android jni lib *.so를 커밋 

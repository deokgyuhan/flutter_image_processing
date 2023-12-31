import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'flutter_image_processing_bindings_generated.dart';

const String _libName = 'flutter_image_processing';

/// The dynamic library in which the symbols for [FlutterImageProcessingBindings] can be found.
final DynamicLibrary _dylib = () {
  if (Platform.isMacOS || Platform.isIOS) {
    return DynamicLibrary.open('$_libName.framework/$_libName');
  }
  if (Platform.isAndroid || Platform.isLinux) {
    return DynamicLibrary.open('lib$_libName.so');
  }
  if (Platform.isWindows) {
    return DynamicLibrary.open('$_libName.dll');
  }
  throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
}();

/// The bindings to the native functions in [_dylib].
final FlutterImageProcessingBindings _bindings = FlutterImageProcessingBindings(_dylib);

String opencvVersion() => _bindings.opencvVersion().cast<Utf8>().toDartString();

Future<void> gaussianBlur(String imagePath) async {
  _bindings.GaussianBlur(imagePath.toNativeUtf8().cast<Char>());
}

Future<void> cannyDetector(String imagePath) async {
  _bindings.CannyDetector(imagePath.toNativeUtf8().cast<Char>());
}

Future<void> medianBlur(String imagePath) async {
  _bindings.medianBlur(imagePath.toNativeUtf8().cast<Char>());
}

Future<void> bilateralFilter(String imagePath) async {
  _bindings.bilateralFilter(imagePath.toNativeUtf8().cast<Char>());
}

Future<void> erosion(
    String imagePath, {
    int erosion_type = 0,
    int erosion_elem = 0,
    int erosion_size = 0,
    }) async {
  _bindings.erosion(imagePath.toNativeUtf8().cast<Char>(), erosion_type, erosion_elem, erosion_size);
}

Future<void> dilation(
    String imagePath, {
    int dilation_type = 0,
    int dilation_elem = 0,
    int dilation_size = 0,
    }) async {
  _bindings.bilateralFilter(imagePath.toNativeUtf8().cast<Char>());
}

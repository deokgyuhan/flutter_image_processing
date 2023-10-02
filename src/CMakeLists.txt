cmake_minimum_required(VERSION 3.10)

project(flutter_image_processing LANGUAGES C CXX)

include_directories(include)
add_library(lib_opencv SHARED IMPORTED)
set_target_properties(lib_opencv PROPERTIES IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/../android/src/main/jniLibs/${ANDROID_ABI}/libopencv_java4.so)

add_library(
    flutter_image_processing
    SHARED
    flutter_image_processing.cpp
)

set (BUILD_WRITERS ON)

target_link_libraries(flutter_image_processing lib_opencv)

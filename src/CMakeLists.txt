# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(flutter_image_processing_library VERSION 0.0.1 LANGUAGES C)

add_library(flutter_image_processing SHARED
  "flutter_image_processing.c"
)

set_target_properties(flutter_image_processing PROPERTIES
  PUBLIC_HEADER flutter_image_processing.h
  OUTPUT_NAME "flutter_image_processing"
)

target_compile_definitions(flutter_image_processing PUBLIC DART_SHARED_LIB)

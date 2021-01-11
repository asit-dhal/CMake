cmake_minimum_required(VERSION 3.19)

project(OutputArtifactDirs C)

file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/main.c "int main() { return 0; }")
file(WRITE ${CMAKE_CURRENT_BINARY_DIR}/lib.c "int func() { return 0; }")

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/$<CONFIG>/$<IF:$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>,rtlib,rtbin>")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/$<CONFIG>/$<IF:$<STREQUAL:$<TARGET_PROPERTY:TYPE>,SHARED_LIBRARY>,sharedlib,others>")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/$<CONFIG>/$<IF:$<STREQUAL:$<TARGET_PROPERTY:TYPE>,STATIC_LIBRARY>,staticlib,others>")

add_executable(exe_tgt ${CMAKE_CURRENT_BINARY_DIR}/main.c)
add_library(shared_tgt SHARED ${CMAKE_CURRENT_BINARY_DIR}/lib.c)
add_library(static_tgt STATIC ${CMAKE_CURRENT_BINARY_DIR}/lib.c)

add_custom_target(checkDirs ALL
  COMMAND ${CMAKE_COMMAND}
    -Dartifact_path=${CMAKE_CURRENT_BINARY_DIR}/$<CONFIG>
    -Dexe_name=$<TARGET_FILE_NAME:exe_tgt>
    -Dshared_name=$<TARGET_FILE_NAME:shared_tgt>
    -Dstatic_name=$<TARGET_FILE_NAME:static_tgt>
    -P ${CMAKE_CURRENT_SOURCE_DIR}/check.cmake
  )

add_dependencies(checkDirs exe_tgt shared_tgt static_tgt)

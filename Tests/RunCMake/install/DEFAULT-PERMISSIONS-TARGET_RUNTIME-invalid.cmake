enable_language(C)
add_executable(exeWithPerm main.c)
set(CMAKE_INSTALL_DEFAULT_TARGET_RUNTIME_PERMISSIONS OWNER_READ_WRITE OWNER_EXECUTE)
install(TARGETS exeWithPerm RUNTIME)

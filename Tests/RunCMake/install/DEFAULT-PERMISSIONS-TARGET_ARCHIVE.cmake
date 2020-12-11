enable_language(C)

set(CMAKE_INSTALL_DEFAULT_TARGET_ARCHIVE_PERMISSIONS
  OWNER_READ OWNER_WRITE OWNER_EXECUTE
  WORLD_EXECUTE
  )

add_library(default_perm_lib STATIC obj1.c)
set_target_properties(default_perm_lib PROPERTIES PREFIX "" SUFFIX "")
install(TARGETS default_perm_lib
  ARCHIVE
  DESTINATION ${CMAKE_INSTALL_LIBDIR}
  )

add_library(custom_perm_lib STATIC obj1.c)
set_target_properties(custom_perm_lib PROPERTIES PREFIX "" SUFFIX "")
install(TARGETS custom_perm_lib
  ARCHIVE
  PERMISSIONS OWNER_READ OWNER_WRITE
  DESTINATION ${CMAKE_INSTALL_LIBDIR}
  )

add_library(custom_perm_shared_lib SHARED obj1.c)
set_target_properties(custom_perm_shared_lib PROPERTIES PREFIX "" SUFFIX "")
install(TARGETS custom_perm_shared_lib
  LIBRARY
  PERMISSIONS OWNER_READ OWNER_WRITE
  DESTINATION ${CMAKE_INSTALL_LIBDIR}
  )

add_executable(custom_perm_exe main.c)
set_target_properties(custom_perm_exe PROPERTIES PREFIX "" SUFFIX "")
install(TARGETS custom_perm_exe
  RUNTIME
  PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE
    GROUP_READ GROUP_EXECUTE
    WORLD_READ WORLD_EXECUTE
  )

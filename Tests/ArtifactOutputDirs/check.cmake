if(NOT EXISTS ${artifact_path}/rtbin/${exe_name})
  message(SEND_ERROR "executable artifact not created in the expected path")
endif()

if(NOT EXISTS ${artifact_path}/staticlib/${static_name})
  message(SEND_ERROR "static artifact not created in the expected path")
endif()

if(WIN32)
  if(NOT EXISTS ${artifact_path}/rtlib/${shared_name})
    message(SEND_ERROR "dll artifact not created in the expected path")
  endif()
else()
  if(NOT EXISTS ${artifact_path}/sharedlib/${shared_name})
    message(SEND_ERROR "so artifact not created in the expected path")
  endif()
endif()

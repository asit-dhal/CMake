set(libdir "${RunCMake_TEST_BINARY_DIR}/root-all/lib")
set(bindir "${RunCMake_TEST_BINARY_DIR}/root-all/bin")

set(custom_perm_shared_lib_file "${libdir}/custom_perm_shared_lib")
check_permission(${custom_perm_shared_lib_file} "600")
set(custom_perm_lib_file "${libdir}/custom_perm_lib")
check_permission(${custom_perm_lib_file} "600")

set(default_perm_exe_file "${bindir}/default_perm_exe")
check_permission(${default_perm_exe_file} "700")
set(custom_perm_exe_file "${bindir}/custom_perm_exe")
check_permission(${custom_perm_exe_file} "705")

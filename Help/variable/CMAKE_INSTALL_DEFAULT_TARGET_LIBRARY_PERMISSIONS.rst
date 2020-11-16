CMAKE_INSTALL_DEFAULT_TARGET_LIBRARY_PERMISSIONS
------------------------------------------------

Default permissions for files created during installation of library artifacts
by :command:`install`.

If ``make install`` is invoked and library artifacts are created and
:command:`install` command has not defined permissions., then the library
artifacts get permissions set by
:variable:`CMAKE_INSTALL_DEFAULT_TARGET_LIBRARY_PERMISSIONS` variable or
platform specific default permissions if the variable is not set.

Expected content of the
:variable:`CMAKE_INSTALL_DEFAULT_TARGET_LIBRARY_PERMISSIONS` variable is a
list of permissions that can be used by :command:`install` command
`PERMISSIONS` section.

Example usage:

::

 set(CMAKE_INSTALL_DEFAULT_TARGET_LIBRARY_PERMISSIONS
      OWNER_READ
      OWNER_WRITE
      OWNER_EXECUTE
      GROUP_READ
    )

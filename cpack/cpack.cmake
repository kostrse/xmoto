set(CPACK_PACKAGE_NAME "${APP_NAME}")
set(CPACK_PACKAGE_VERSION_MAJOR ${APP_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${APP_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${APP_VERSION_PATCH})

if(APPLE)
	# Check if building a universal binary
	if(CMAKE_OSX_ARCHITECTURES)
		# Convert list to string and check if it contains multiple architectures
		list(LENGTH CMAKE_OSX_ARCHITECTURES _arch_count)
		if(_arch_count GREATER 1)
			set(CPACK_PACKAGE_FILE_NAME "xmoto-${APP_VERSION_STRING}-universal")
		else()
			set(CPACK_PACKAGE_FILE_NAME "xmoto-${APP_VERSION_STRING}-${CMAKE_OSX_ARCHITECTURES}")
		endif()
	else()
		set(CPACK_PACKAGE_FILE_NAME "xmoto-${APP_VERSION_STRING}-${CMAKE_SYSTEM_PROCESSOR}")
	endif()
else()
	set(CPACK_PACKAGE_FILE_NAME "xmoto-${APP_VERSION_STRING}")
endif()
set(CPACK_PACKAGE_HOMEPAGE_URL "https://xmoto.org")
set(CPACK_PACKAGE_CONTACT "https://github.com/xmoto/xmoto")
set(CPACK_PACKAGE_VENDOR "X-Moto Developers")

set(CPACK_RESOURCE_FILE_LICENSE "${PROJECT_SOURCE_DIR}/COPYING")
set(CPACK_RESOURCE_FILE_README "${PROJECT_SOURCE_DIR}/README.md")

set(CPACK_SOURCE_IGNORE_FILES "/\\\\.git/")
set(CPACK_SOURCE_GENERATOR STGZ)

set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "A challenging 2D motocross platform game")
set(CPACK_PACKAGE_DESCRIPTION "\
X-Moto is a challenging 2D motocross platform game, where physics play \
an all important role in the gameplay. You need to control your bike to \
its limit, if you want to have a chance finishing the more difficult of \
the challenges.\
")

include(cpack/macos.cmake)
include(cpack/win32.cmake)

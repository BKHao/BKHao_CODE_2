if (BKHao_FOUND)
    return()
endif ()

find_path(BKHao_INCLUDE_DIR BKHao/BKLBFGS.h
        HINTS
        ${BKHao}
        ENV BKHao
        PATHS
        ${CMAKE_SOURCE_DIR}/../..
        ${CMAKE_SOURCE_DIR}/..
        ${CMAKE_SOURCE_DIR}
        ${CMAKE_SOURCE_DIR}/BKHao
        ${CMAKE_SOURCE_DIR}/../BKHao
        ${CMAKE_SOURCE_DIR}/../../BKHao
        /usr/local
        /usr/local/BKHao
        PATH_SUFFIXES include
        )
find_path(BKHao_LIB_DIR libBKHao.dylib
        HINTS
        ${BKHao}
        ENV BKHao
        PATHS
        ${CMAKE_SOURCE_DIR}/../..
        ${CMAKE_SOURCE_DIR}/..
        ${CMAKE_SOURCE_DIR}
        ${CMAKE_SOURCE_DIR}/BKHao
        ${CMAKE_SOURCE_DIR}/../BKHao
        ${CMAKE_SOURCE_DIR}/../../BKHao
        /usr/local
        /usr/local/BKHao
        PATH_SUFFIXES lib)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(BKHao
        "\nBKHao not found ${CMAKE_SOURCE_DIR}/../BKHao"
        BKHao_INCLUDE_DIR)
mark_as_advanced(BKHao_INCLUDE_DIR)

#include(BKHao)
# Get Eigen3
find_package(Eigen3 REQUIRED)
if (Eigen3_FOUND)
    message(STATUS "${EIGEN3_VERSION_STRING}")
    include_directories(${EIGEN3_INCLUDE_DIR})
endif ()

# Get Boost
find_package(Boost REQUIRED)
if (Boost_FOUND)
    message(STATUS "BOOST FOUNDED")
    include_directories(${Boost_INCLUDE_DIRS})
endif ()

# Get CGAL
find_package(CGAL REQUIRED)
if (CGAL_FOUND)
    include(${CGAL_USE_FILE})
else ()
    message("ERROR: this program requires CGAL and will not be compiled.")
endif ()
cmake_minimum_required(VERSION 3.0.0)
project(image-reader VERSION 0.1.0)

include(CTest)
enable_testing()

set(CURL_LIBRARY "-lcurl") 
find_package(CURL REQUIRED) 
include_directories(${CURL_INCLUDE_DIR})

find_package( OpenCV REQUIRED )
include_directories( ${OpenCV_INCLUDE_DIRS} )

add_executable(image-reader main.cpp)
target_link_libraries(image-reader ${OpenCV_LIBS} ${CURL_LIBRARIES})

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)

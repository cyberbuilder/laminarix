cmake_minimum_required(VERSION 3.1.1)
project(laminarix)
add_definitions(-std=c++11)

set(QT_LIBS Core Gui Widgets Xml Sql Concurrent)
set(PROJECT_SRC_SUBDIRS src)
include(${PROJECT_SOURCE_DIR}/qtlibs.cmake)

find_package(catkin REQUIRED COMPONENTS
  roscpp
)

include_directories(${catkin_INCLUDE_DIRS})
catkin_package()


file(GLOB PROJECT_SRC
    "src/*.h"
    "src/*.cpp"
    ${SOURCE_FILES_LIST}
)

add_executable(${PROJECT_NAME} ${PROJECT_SRC} ${QT_RESOURCES_CPP})
add_dependencies(${PROJECT_NAME} ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
link_qt()
target_link_libraries(${PROJECT_NAME} ${catkin_LIBRARIES} ${DRIVESTACK_LIBS} ${OTHER_LIBS})

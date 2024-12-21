cmake_minimum_required(VERSION 3.1.1)

if(DEFINED QT_LIBS)
    set(Qt5_DIR $ENV{QT_BASE_DIR}/lib/cmake/Qt5)
    set(QT_QMAKE_EXECUTABLE $ENV{QMAKE_BIN})
    foreach(QTLIB IN LISTS QT_LIBS)
        set(Qt5${QTLIB}_DIR $ENV{QT_BASE_DIR}/lib/cmake/Qt5${QTLIB})
        message(STATUS "${BoldGreen} set Qt5${QTLIB}_DIR $ENV{QT_BASE_DIR}/lib/cmake/Qt5${QTLIB}")
   endforeach()

    find_package(catkin REQUIRED COMPONENTS qt_build)

    set(CMAKE_AUTOMOC ON)
    set(CMAKE_AUTOUIC ON)
    set(CMAKE_INCLUDE_CURRENT_DIR ON)
    find_package(Qt5 COMPONENTS ${QT_LIBS} REQUIRED )

    file(GLOB QT_RESOURCES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.qrc)
    QT5_ADD_RESOURCES(QT_RESOURCES_CPP ${QT_RESOURCES})
endif()


function(link_qt)
    if (DEFINED QT_LIBS)
        qt5_use_modules(${PROJECT_NAME} ${QT_LIBS})
    endif()
endfunction()


function(link_qt_for_project_name arg1)
    if (DEFINED QT_LIBS)
        qt5_use_modules(${arg1} ${QT_LIBS})
    endif()
endfunction()

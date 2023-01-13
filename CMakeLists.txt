project(LIBUI)

cmake_minimum_required(VERSION 2.8.12)
set(CMAKE_MACOSX_RPATH 1)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib") 

find_package(JlCxx)
get_target_property(JlCxx_location JlCxx::cxxwrap_julia LOCATION)
get_filename_component(JlCxx_location ${JlCxx_location} DIRECTORY)
set(CMAKE_INSTALL_RPATH "${CMAKE_INSTALL_PREFIX}/lib;${JlCxx_location}")
message(STATUS "Found JlCxx at ${JlCxx_location}")

set(IMGUI_DIR imguixx)
# here 
add_library(ui SHARED main.cpp ${IMGUI_DIR}/imgui.cpp ${IMGUI_DIR}/imgui_demo.cpp ${IMGUI_DIR}/imgui_draw.cpp ${IMGUI_DIR}/imgui_tables.cpp ${IMGUI_DIR}/imgui_widgets.cpp ${IMGUI_DIR}/backends/imgui_impl_glfw.cpp ${IMGUI_DIR}/backends/imgui_impl_opengl3.cpp)

find_package(PkgConfig REQUIRED)
pkg_search_module(GLFW REQUIRED glfw3)
include_directories(${GLFW_INCLUDE_DIRS} ${IMGUI_DIR} ${IMGUI_DIR}/backends)

target_link_libraries(ui JlCxx::cxxwrap_julia -lGL ${GLFW_LIBRARIES})
install(TARGETS
  ui
LIBRARY DESTINATION lib
ARCHIVE DESTINATION lib
RUNTIME DESTINATION lib)

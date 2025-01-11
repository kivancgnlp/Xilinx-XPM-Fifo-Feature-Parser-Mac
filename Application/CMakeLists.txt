cmake_minimum_required(VERSION 3.9)


set(CMAKE_OSX_DEPLOYMENT_TARGET 10.11) # Must be before first call to project()
project(XPM_Fifo_Feature_Parser_Project)


set(uiFiles
      src/en.lproj/MainMenu.xib
      src/en.lproj/InfoPlist.strings
)
  add_executable(XPM_Fifo_Feature_Parser MACOSX_BUNDLE
      src/AppDelegate.m
      src/AppDelegate.h
      src/Fifo_feature_extractor.m
      src/Fifo_feature_extractor.h
      src/main.m
      ${uiFiles}
)
  set_target_properties(XPM_Fifo_Feature_Parser PROPERTIES
      RESOURCE "${uiFiles}"
      MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_SOURCE_DIR}/src/Info.plist"
)

set_property (TARGET XPM_Fifo_Feature_Parser APPEND_STRING PROPERTY COMPILE_FLAGS "-fobjc-arc")

target_link_libraries(XPM_Fifo_Feature_Parser "-framework Cocoa")

set(MACOSX_BUNDLE_GUI_IDENTIFIER "kiv.XPM_Fifo_Feature_Parser")
set(MACOSX_BUNDLE_BUNDLE_NAME XPM_Fifo_Feature_Parser)
set(MACOSX_BUNDLE_NSMAIN_NIB_FILE "MainMenu")
set(MACOSX_BUNDLE_NSPRINCIPAL_CLASS "NSApplication")
set(MACOSX_BUNDLE_COPYRIGHT "Copyright © 2025 Kivanc")

# ---------------------- NIB Derleme bolumu

# Make sure we can find the 'ibtool' program. If we can NOT find it we
# skip generation of this project
find_program(IBTOOL ibtool HINTS "/usr/bin" "${OSX_DEVELOPER_ROOT}/usr/bin")
if (${IBTOOL} STREQUAL "IBTOOL-NOTFOUND")
  message(SEND_ERROR "ibtool can not be found and is needed to compile the .xib files. It should have been installed with the Apple developer tools. The default system paths were searched in addition to ${OSX_DEVELOPER_ROOT}/usr/bin")
endif()

# Make sure the 'Resources' Directory is correctly created before we build
add_custom_command (TARGET XPM_Fifo_Feature_Parser PRE_BUILD
                      COMMAND mkdir -p ${CMAKE_CURRENT_BINARY_DIR}/XPM_Fifo_Feature_Parser.app/Contents/Resources)

# Compile the .xib files using the 'ibtool' program with the destination being the app package
add_custom_command (TARGET XPM_Fifo_Feature_Parser POST_BUILD
                      COMMAND ${IBTOOL} --errors --warnings --notices --output-format human-readable-text --compile ${CMAKE_CURRENT_BINARY_DIR}/XPM_Fifo_Feature_Parser.app/Contents/Resources/${MACOSX_BUNDLE_NSMAIN_NIB_FILE}.nib ${CMAKE_CURRENT_SOURCE_DIR}/src//en.lproj/${MACOSX_BUNDLE_NSMAIN_NIB_FILE}.xib
                      COMMENT "Compiling ${CMAKE_CURRENT_SOURCE_DIR}/src/en.lproj/${MACOSX_BUNDLE_NSMAIN_NIB_FILE}.xib"
)



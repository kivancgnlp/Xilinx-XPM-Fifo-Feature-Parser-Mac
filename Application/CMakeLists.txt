cmake_minimum_required(VERSION 3.9)


set(CMAKE_OSX_DEPLOYMENT_TARGET 10.11) # Must be before first call to project()
project(XPM_Fifo_Feature_Parser_Project)


set(uiFiles
      en.lproj/MainMenu.xib
      en.lproj/InfoPlist.strings
)
  add_executable(XPM_Fifo_Feature_Parser MACOSX_BUNDLE
      AppDelegate.m
      AppDelegate.h
      Fifo_feature_extractor.m
      Fifo_feature_extractor.h
      main.m
      ${uiFiles}
)
  set_target_properties(XPM_Fifo_Feature_Parser PROPERTIES
      RESOURCE "${uiFiles}"
      MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_SOURCE_DIR}/Info.plist"
)

set_property (TARGET XPM_Fifo_Feature_Parser APPEND_STRING PROPERTY COMPILE_FLAGS "-fobjc-arc")

target_link_libraries(XPM_Fifo_Feature_Parser "-framework Cocoa")

set(MACOSX_BUNDLE_GUI_IDENTIFIER "tr.kiv.XPM_Fifo_Feature_Parser")
set(MACOSX_BUNDLE_BUNDLE_NAME XPM_Fifo_Feature_Parser)
set(MACOSX_BUNDLE_NSMAIN_NIB_FILE "MainMenu")
set(MACOSX_BUNDLE_NSPRINCIPAL_CLASS "NSApplication")
set(MACOSX_BUNDLE_COPYRIGHT "Copyright © 2025 Kivanc")


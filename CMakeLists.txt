cmake_minimum_required(VERSION 3.14.0)
set(CMAKE_OSX_DEPLOYMENT_TARGET 10.13 CACHE STRING "")

set(vst3sdk_SOURCE_DIR "/Users/alfiebradic/vst3sdk")
if(NOT vst3sdk_SOURCE_DIR)
    message(FATAL_ERROR "Path to VST3 SDK is empty!")
endif()

project(basicDelay
    # This is your plug-in version number. Change it here only.
    # Version number symbols usable in C++ can be found in
    # source/version.h and ${PROJECT_BINARY_DIR}/projectversion.h.
    VERSION 1.0.0.0 
    DESCRIPTION "basicDelay VST 3 Plug-in"
)

set(SMTG_VSTGUI_ROOT "${vst3sdk_SOURCE_DIR}")

add_subdirectory(${vst3sdk_SOURCE_DIR} ${PROJECT_BINARY_DIR}/vst3sdk)
smtg_enable_vst3_sdk()

smtg_add_vst3plugin(basicDelay
    source/version.h
    source/cids.h
    source/processor.h
    source/processor.cpp
    source/controller.h
    source/controller.cpp
    source/entry.cpp
)

#- VSTGUI Wanted ----
if(SMTG_ADD_VSTGUI)
    target_sources(basicDelay
        PRIVATE
            resource/editor.uidesc
    )
    target_link_libraries(basicDelay
        PRIVATE
            vstgui_support
    )
    smtg_target_add_plugin_resources(basicDelay
        RESOURCES
            "resource/editor.uidesc"
    )
endif(SMTG_ADD_VSTGUI)
# -------------------

smtg_target_add_plugin_snapshots (basicDelay
    RESOURCES
        resource/283136A6494E59A7850EEF2AD190C146_snapshot.png
        resource/283136A6494E59A7850EEF2AD190C146_snapshot_2.0x.png
)

target_link_libraries(basicDelay
    PRIVATE
        sdk
)

smtg_target_configure_version_file(basicDelay)

if(SMTG_MAC)
    smtg_target_set_bundle(basicDelay
        BUNDLE_IDENTIFIER com.alfiebradic.test
        COMPANY_NAME "Alfie Bradic"
    )
    smtg_target_set_debug_executable(basicDelay
        "/Applications/VST3PluginTestHost.app"
        "--pluginfolder;$(BUILT_PRODUCTS_DIR)"
    )
elseif(SMTG_WIN)
    target_sources(basicDelay PRIVATE 
        resource/win32resource.rc
    )
    if(MSVC)
        set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT basicDelay)

        smtg_target_set_debug_executable(basicDelay
            "$(ProgramW6432)/Steinberg/VST3PluginTestHost/VST3PluginTestHost.exe"
            "--pluginfolder \"$(OutDir)/\""
        )
    endif()
endif(SMTG_MAC)

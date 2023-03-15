#!/bin/sh
set -e
if test "$CONFIGURATION" = "Debug"; then :
  cd /Users/alfiebradic/Documents/basicDelay/build/bin
  /Users/alfiebradic/Documents/basicDelay/build/bin/Debug/moduleinfotool -create -version 1.0.0.0 -path /Users/alfiebradic/Documents/basicDelay/build/VST3/Debug/basicDelay.vst3 -output /Users/alfiebradic/Documents/basicDelay/build/VST3/Debug/basicDelay.vst3/Contents/moduleinfo.json
  cd /Users/alfiebradic/Documents/basicDelay/build/bin
  codesign -f -s - -v /Users/alfiebradic/Documents/basicDelay/build/VST3/Debug/basicDelay.vst3/Contents/moduleinfo.json
  cd /Users/alfiebradic/Documents/basicDelay/build/bin
  /Users/alfiebradic/Documents/basicDelay/build/bin/Debug/validator /Users/alfiebradic/Documents/basicDelay/build/VST3/Debug/basicDelay.vst3 
  cd /Users/alfiebradic/Documents/basicDelay/build
  /usr/local/Cellar/cmake/3.25.2/bin/cmake -E make_directory /Users/alfiebradic/Library/Audio/Plug-Ins/VST3
  ln -svfF /Users/alfiebradic/Documents/basicDelay/build/VST3/Debug/basicDelay.vst3 /Users/alfiebradic/Library/Audio/Plug-Ins/VST3
fi
if test "$CONFIGURATION" = "Release"; then :
  cd /Users/alfiebradic/Documents/basicDelay/build/bin
  /Users/alfiebradic/Documents/basicDelay/build/bin/Release/moduleinfotool -create -version 1.0.0.0 -path /Users/alfiebradic/Documents/basicDelay/build/VST3/Release/basicDelay.vst3 -output /Users/alfiebradic/Documents/basicDelay/build/VST3/Release/basicDelay.vst3/Contents/moduleinfo.json
  cd /Users/alfiebradic/Documents/basicDelay/build/bin
  codesign -f -s - -v /Users/alfiebradic/Documents/basicDelay/build/VST3/Release/basicDelay.vst3/Contents/moduleinfo.json
  cd /Users/alfiebradic/Documents/basicDelay/build/bin
  /Users/alfiebradic/Documents/basicDelay/build/bin/Release/validator  /Users/alfiebradic/Documents/basicDelay/build/VST3/Release/basicDelay.vst3
  cd /Users/alfiebradic/Documents/basicDelay/build
  /usr/local/Cellar/cmake/3.25.2/bin/cmake -E make_directory /Users/alfiebradic/Library/Audio/Plug-Ins/VST3
  ln -svfF /Users/alfiebradic/Documents/basicDelay/build/VST3/Release/basicDelay.vst3 /Users/alfiebradic/Library/Audio/Plug-Ins/VST3
fi


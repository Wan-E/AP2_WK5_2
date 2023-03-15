#!/bin/sh
set -e
if test "$CONFIGURATION" = "Debug"; then :
  cd /Users/alfiebradic/Documents/basicDelay/build
  make -f /Users/alfiebradic/Documents/basicDelay/build/CMakeScripts/ReRunCMake.make
fi
if test "$CONFIGURATION" = "Release"; then :
  cd /Users/alfiebradic/Documents/basicDelay/build
  make -f /Users/alfiebradic/Documents/basicDelay/build/CMakeScripts/ReRunCMake.make
fi


#!/bin/sh
set -e
if test "$CONFIGURATION" = "Debug"; then :
  cd /Users/alfiebradic/Documents/basicDelay/build/vst3sdk/public.sdk/samples/vst-hosting/validator
  /Users/alfiebradic/Documents/basicDelay/build/bin/Debug/validator -selftest
fi
if test "$CONFIGURATION" = "Release"; then :
  cd /Users/alfiebradic/Documents/basicDelay/build/vst3sdk/public.sdk/samples/vst-hosting/validator
  /Users/alfiebradic/Documents/basicDelay/build/bin/Release/validator -selftest
fi


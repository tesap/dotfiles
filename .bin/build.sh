#!/bin/bash

set -e

TARGET="Aurora_Target_armv7hl_5.2.0_35"
AURORA_PSDK="$PLATFORM_SDK_ROOT/sdks/sfossdk/mer-sdk-chroot"
PEM_PATH="$HOME/omp/pem"

# --- Build ---

cmd1="sb2 -t $TARGET.default -R -m sdk-install zypper ref"
cmd2="mb2 -t $TARGET $@ build"

echo "(AURORA_PSDK): $cmd1"
echo "(AURORA_PSDK): $cmd2"

$AURORA_PSDK $cmd1
$AURORA_PSDK $cmd2


#!/bin/bash

set -e

# 5.1.5
# TARGET="Aurora-armv7hl-5.1.5.28"
# TARGET="Aurora-aarch64-5.1.5.41"

# 5.2.0
# TARGET="Aurora-aarch64-5.2.0.835"
TARGET="Aurora-armv7hl-5.2.0.580"
# TARGET="Aurora-x86_64-5.2.0.794"
# TARGET="Aurora_Target_armv7hl_5.2.0_35"
# TARGET="Aurora_Target_x86_64_5.1.0_431"

# 5.1.0
# TARGET="Aurora_Target_5.1.0_284"
AURORA_PSDK="$PLATFORM_SDK_ROOT/sdks/sfossdk/mer-sdk-chroot"
PEM_PATH="$HOME/omp/pem"

# --- Build ---

cmd1="sb2 -t $TARGET.default -R -m sdk-install zypper ref"
cmd2="mb2 -t $TARGET $@ build"

echo "(AURORA_PSDK): $cmd1"
echo "(AURORA_PSDK): $cmd2"

$AURORA_PSDK $cmd1
$AURORA_PSDK $cmd2

#!/bin/bash

TARGET="Aurora_Target_armv7hl_5.2.0_35"
AURORA_PSDK="$PLATFORM_SDK_ROOT/sdks/sfossdk/mer-sdk-chroot"
PEM_PATH="$HOME/omp/pem"

# --- Push ---

$AURORA_PSDK rpmsign-external sign --key $PEM_PATH/system-developer-key.pem --cert $PEM_PATH/system-developer-cert.pem $1/*.rpm
# $AURORA_PSDK rpmsign-external sign --key $PEM_PATH/developer-regular-key.pem --cert $PEM_PATH/developer-regular-cert.pem $1/*.rpm
$AURORA_PSDK rpmsign-external sign --key $PEM_PATH/client-key.pem --cert $PEM_PATH/client-cert.pem $1/*.rpm

ssh aurora-device "rm -r $1"
rsync -rav $1 aurora-device:

ssh -t aurora-device "cd $1; devel-su pkcon install-local *"

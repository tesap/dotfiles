#!/bin/bash

set -e

# Set target
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
SSH_TARGET=defaultuser@10.185.68.164

# Flags for execution
BUILD=false
SIGN=false
PUSH=false
INSTALL=false

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
	case $1 in
	--build | -b)
		BUILD=true
		shift
		;;
	--sign | -s)
		SIGN=true
		shift
		;;
	--push | -p)
		PUSH=true
		shift
		;;
	--install | -i)
		INSTALL=true
		shift
		;;
	*)
		echo "Unknown option: $1"
		exit 1
		;;
	esac
done

# --- Build ---
if $BUILD; then
	echo "=========== BUILD ==========="
	cmd1="sb2 -t $TARGET.default -R -m sdk-install zypper ref"
	cmd2="mb2 -t $TARGET build"

	echo "(AURORA_PSDK): $cmd1"
	echo "(AURORA_PSDK): $cmd2"

	$AURORA_PSDK $cmd1
	$AURORA_PSDK $cmd2
fi

# --- Sign ---
if $SIGN; then
	echo "=========== SIGN ==========="
	$AURORA_PSDK rpmsign-external sign --key $PEM_PATH/system-developer-key.pem --cert $PEM_PATH/system-developer-cert.pem $1/*.rpm
	$AURORA_PSDK rpmsign-external sign --key $PEM_PATH/developer-regular-key.pem --cert $PEM_PATH/developer-regular-cert.pem $1/*.rpm
	# PEM_PATH="$HOME/AuroraOS/package-signing"
	# $AURORA_PSDK rpmsign-external sign --key $PEM_PATH/regular_key.pem --cert $PEM_PATH/regular_cert.pem $1/*.rpm

	# $AURORA_PSDK rpmsign-external sign --key $PEM_PATH/client-key.pem --cert $PEM_PATH/client-cert.pem $1/*.rpm
	# $AURORA_PSDK rpmsign-external sign --key $PEM_PATH/packages-key.pem --cert $PEM_PATH/packages-cert.pem $1/*.rpm
fi

# --- Push ---
if $PUSH; then
	echo "=========== PUSH ==========="
	ssh-copy-id $TARGET
	ssh $TARGET "rm -r $1"
	rsync -rav $1 $TARGET:
fi

# --- Install ---
if $INSTALL; then
	echo "=========== INSTALL ==========="

	# ssh -t aurora-device "cd $1; devel-su pkcon install-local -y *"
	# ssh -t aurora-device "devel-su rpm -U --force --nodeps $1/*"
	echo "o" | ssh -t $TARGET "devel-su rpm -U --force --nodeps $1/*"
	ssh $TARGET -t "echo 'o' | devel-su systemctl restart --user lipstick"
fi

# If no flags were provided, display usage information
if ! $BUILD && ! $SIGN && ! $PUSH && ! $INSTALL; then
	echo "Usage: $0 [--build|-b] [--sign|-s] [--push|-p] [--install|-i]"
	exit 1
fi

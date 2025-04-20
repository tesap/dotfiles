#!/bin/bash

# set -e
trap "echo '==== Script interrupted by user ==='; exit 1" SIGINT

# 5.1.5
# BUILD_TARGET="Aurora-armv7hl-5.1.5.28"
# BUILD_TARGET="Aurora-aarch64-5.1.5.41"

# 5.2.0
# BUILD_TARGET="Aurora-aarch64-5.2.0.835"
BUILD_TARGET="Aurora-armv7hl-5.2.0.580"
# BUILD_TARGET="Aurora-x86_64-5.2.0.794"
# BUILD_TARGET="Aurora_Target_armv7hl_5.2.0_35"
# BUILD_TARGET="Aurora_Target_x86_64_5.1.0_431"

# 5.1.0
# BUILD_TARGET="Aurora_Target_5.1.0_284"

# === SSH ===
SSH_TARGET=aurora-device
# SSH_TARGET=defaultuser@10.185.68.164
# === SSH ===

AURORA_PSDK="$PLATFORM_SDK_ROOT/sdks/sfossdk/mer-sdk-chroot"
PEM_PATH="$HOME/OMP/other/pem"
PROJECT_NAME=$(basename $PWD)

# Flags for execution
PATCH=false
UPDATE=false
BUILD=false
SIGN=false
PUSH=false
INSTALL=false
RESTART=false
RPMS_PATH=RPMS

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
	case $1 in
	--patch)
		PATCH=true
		shift
		;;
	--update | -u)
		UPDATE=true
		shift
		;;
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
	--restart | -r)
		RESTART=true
		shift
		;;
	--build-target | -B)
		BUILD_TARGET=$2
		shift 2
		;;
	--path | -P)
		RPMS_PATH=$2
		shift 2
		;;
	--ssh-target | -S)
		SSH_TARGET=$2
		shift 2
		;;
	*)
		echo "Unknown option: $1"
		exit 1
		;;
	esac
done

DEVICE_RPMS_PATH=$(basename $RPMS_PATH)

function exec_cmd() {
	echo "---------------> (LOCAL CMD): $@"
	"$@"
}

function exec_aurora_cmd() {
	echo "---------------> (AURORA_PSDK): $@"
	$AURORA_PSDK "$@"
}

function exec_ssh_cmd() {
	echo "---------------> (SSH DEVEL-SU): $@"
	ssh $SSH_TARGET -t "echo 'o' | devel-su $@"
}

echo "=========== VARS ==========="
if [[ "$BUILD" == true ]]; then
	echo "PROJECT_NAME:     $PROJECT_NAME"
fi
echo "RPMS_PATH:        $RPMS_PATH"
if [[ "$PUSH" == true ]]; then
	echo "DEVICE_RPMS_PATH: $DEVICE_RPMS_PATH"
fi
if [[ "$BUILD" == true ]]; then
	echo "BUILD_TARGET:     $BUILD_TARGET"
fi
if [[ "$PUSH" == true ]]; then
	echo "SSH_TARGET:       $SSH_TARGET"
fi
echo "============================"

# --- Patch ---
if $PATCH; then
	echo "=========== PATCH ==========="

	exec_aurora_cmd mb2 -t $BUILD_TARGET build-init || {
		echo "--- BUILD_INIT ERROR ---"
		exit 1
	}
	exec_aurora_cmd mb2 -t $BUILD_TARGET prepare || {
		echo "--- PREPARE ERROR ---"
		exit 1
	}
fi

# --- Update ---
if $UPDATE; then
	echo "=========== UPDATE ==========="

	exec_aurora_cmd sb2 -t $BUILD_TARGET.default -R -m sdk-install zypper ref || {
		echo "--- UPDATE ERROR ---"
		exit 1
	}
fi

# --- Build ---
if $BUILD; then
	echo "=========== BUILD ==========="
	if [[ $PROJECT_NAME == qtlocation* ]]; then
		# exec_aurora_cmd mb2 -t $BUILD_TARGET -s rpm/qtlocation-plugin-position-geoclue.spec build || {
		exec_aurora_cmd mb2 -t $BUILD_TARGET -s rpm/qtlocation.spec build || {
			echo "--- BUILD ERROR ---"
			exit 1
		}
	else
		exec_aurora_cmd mb2 -t $BUILD_TARGET build || {
			echo "--- BUILD ERROR ---"
			exit 1
		}
	fi
fi

# --- Sign ---
if $SIGN; then
	echo "=========== SIGN ==========="

	exec_aurora_cmd rpmsign-external sign --key $PEM_PATH/system-developer-key.pem --cert $PEM_PATH/system-developer-cert.pem $RPMS_PATH/*.rpm
	exec_aurora_cmd rpmsign-external sign --key $PEM_PATH/developer-regular-key.pem --cert $PEM_PATH/developer-regular-cert.pem $RPMS_PATH/*.rpm

	# PEM_PATH="$HOME/AuroraOS/package-signing"
	# $AURORA_PSDK rpmsign-external sign --key $PEM_PATH/regular_key.pem --cert $PEM_PATH/regular_cert.pem $RPMS_PATH/*.rpm

	# $AURORA_PSDK rpmsign-external sign --key $PEM_PATH/client-key.pem --cert $PEM_PATH/client-cert.pem $RPMS_PATH/*.rpm
	# $AURORA_PSDK rpmsign-external sign --key $PEM_PATH/packages-key.pem --cert $PEM_PATH/packages-cert.pem $RPMS_PATH/*.rpm
fi

# --- Push ---
if $PUSH; then
	echo "=========== PUSH ==========="
	exec_cmd ssh-copy-id $SSH_TARGET
	exec_ssh_cmd rm -r $DEVICE_RPMS_PATH
	exec_cmd rsync -rav $RPMS_PATH $SSH_TARGET:
fi

# --- Install ---
if $INSTALL; then
	echo "=========== INSTALL ==========="

	# ssh -t aurora-device "cd $PATH; devel-su pkcon install-local -y *"
	# ssh -t aurora-device "devel-su rpm -U --force --nodeps $RPMS_PATH/*"
	exec_ssh_cmd rpm -U --force --nodeps $DEVICE_RPMS_PATH/*
fi

# --- Restart ---
if $RESTART; then
	echo "=========== RESTART ==========="

	# if [[ $PROJECT_NAME == "ui-lipstick-jolla-home" ]]; then
	# 	RESTART_TARGET="--user lipstick"
	if [[ $PROJECT_NAME == "base-jolla-developer-mode" ]]; then
		RESTART_TARGET="developer-moded"
	fi
	if [[ $PROJECT_NAME == "reports-service" ]]; then
		RESTART_TARGET="reports"
	fi
	if [[ $PROJECT_NAME == "libprinter" ]]; then
		RESTART_TARGET="ru.omp.print"
	fi

	if [[ -n "$RESTART_TARGET" ]]; then
		exec_ssh_cmd systemctl restart $RESTART_TARGET
	fi
	exec_ssh_cmd systemctl restart --user lipstick
fi

# If no flags were provided, display usage information
if ! $PATCH && ! $UPDATE && ! $BUILD && ! $SIGN && ! $PUSH && ! $INSTALL ! $RESTART; then
	echo "Usage: $0 [--patch] [--update|-u] [--build|-b] [--sign|-s] [--push|-p] [--install|-i] [--restart|-r] [--path|-P <path>] [--build-target|-B <target>] [--ssh-target|-S <target>]"
	echo "Complete comman: all.sh --patch -u -b -s -p -i -r --ssh-target defaultuser@192.168.1.37"
	exit 1
fi

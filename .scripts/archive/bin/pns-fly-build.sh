#!/bin/bash

BUILD="build2"
TARGET="Aurora-armv7hl-5.2.0.580.default"
AURORA_PSDK="$PLATFORM_SDK_ROOT/sdks/sfossdk/mer-sdk-chroot"

run() {
	s="$AURORA_PSDK bash -c \"sb2 -t $TARGET -R $@\""
	echo $s
	bash -c "$s"
}

# ====== MAIN ======

if [[ $1 == "qmake" ]]; then
	cd $BUILD
	run qmake ../
	exit 0
fi

ln -sf ../../$BUILD/service/system/libsystem.a service/system
cd $BUILD
run make

# run tests/push-tests --gtest_color=yes --gtest_filter=PushClientF.ConnectionHealthcheckFailed
# run tests/push-tests --gtest_color=yes --gtest_filter=PushClientF.ConnectionHealthcheckOk

if [[ -z $@ ]]; then
	# echo
	run tests/push-tests --gtest_color=yes
else
	run tests/push-tests --gtest_color=yes --gtest_filter=$@
fi

cd ..

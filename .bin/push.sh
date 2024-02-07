#!/bin/bash

aurora_psdk="$PLATFORM_SDK_ROOT/sdks/sfossdk/mer-sdk-chroot"

$aurora_psdk bash -c "mb2 -t Aurora_Target_5.1.0_284 build"

cd RPMS

$aurora_psdk rpmsign-external sign --key ~/omp/pem/system-developer-key.pem --cert ~/omp/pem/system-developer-cert.pem *.rpm
$aurora_psdk rpmsign-external sign --key ~/omp/pem/client-key.pem --cert ~/omp/pem/client-cert.pem *.rpm

ssh aurora-device "rm softhsm*"
rsync -av *.rpm aurora-device:
cd ..
ssh -t aurora-device "devel-su pkcon install-local softhsm-2*"

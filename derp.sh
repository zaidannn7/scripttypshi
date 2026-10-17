#!/bin/bash

# =====  Viral =====
DEVICE="X6882"

DT_URL="https://github.com/USER/REPO_DT.git";  DT_BRANCH="BRANCH";  DT_PATH="device/VENDOR/codename"
VT_URL="https://github.com/USER/REPO_VT.git";  VT_BRANCH="BRANCH";  VT_PATH="vendor/VENDOR/codename"
KT_URL="https://github.com/USER/REPO_KT.git";  KT_BRANCH="BRANCH";  KT_PATH="kernel/VENDOR/SOC"
# ===================

repo init -u https://github.com/DerpFest-AOSP/android_manifest.git -b 16.2 --git-lfs --depth=1
/opt/crave/resync.sh
repo sync -c -j$(nproc) --force-sync --no-tags --no-clone-bundle --depth=1

git clone --depth=1 -b $DT_BRANCH $DT_URL $DT_PATH
git clone --depth=1 -b $VT_BRANCH $VT_URL $VT_PATH
git clone --depth=1 -b $KT_BRANCH $KT_URL $KT_PATH

source build/envsetup.sh
lunch lineage_${DEVICE}-bp4a-user
mka derp

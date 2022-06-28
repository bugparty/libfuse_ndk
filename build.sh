#!/usr/bin/env bash

CROSS_FILE_NAME=crossfile-${ANDROID_ABI}.meson

rm ${CROSS_FILE_NAME}

cat > "${CROSS_FILE_NAME}" << EOF
[binaries]
c = '${CC}'
ar = '${AR}'
strip = '${STRIP}'
nasm = '${NASM_EXECUTABLE}'
pkgconfig = '${PKG_CONFIG_EXECUTABLE}'

[properties]
needs_exe_wrapper = true
sys_root = '${SYSROOT_PATH}'

[host_machine]
system = 'linux'
cpu_family = '${CPU_FAMILY}'
cpu = '${TARGET_TRIPLE_MACHINE_ARCH}'
endian = 'little'

[built-in options]
prefix = '${INSTALL_DIR}'
EOF

export BUILD_DIRECTORY=build/${ANDROID_ABI}
#export BUILD_DIRECTORY=build
rm -rf ${BUILD_DIRECTORY}
mkdir -p "`pwd`/${BUILD_DIRECTORY}"


${MESON_EXECUTABLE} . ${BUILD_DIRECTORY} \
  --cross-file ${CROSS_FILE_NAME}

cd ${BUILD_DIRECTORY}

${NINJA_EXECUTABLE} -j${HOST_NPROC}
${NINJA_EXECUTABLE} install

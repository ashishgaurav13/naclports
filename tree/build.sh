# Copyright (c) 2014 The Native Client Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

NACLPORTS_CFLAGS+=" -Dmain=nacl_main"
BUILD_DIR=${SRC_DIR}
EXECUTABLES="tree"
export NACLPORTS_LDFLAGS+=" ${NACL_CLI_MAIN_LIB} -lppapi_simple -lnacl_io \
  -lppapi -l${NACL_CXX_LIB}"

BuildStep() {
	LogExecute make clean
	LogExecute make -j${OS_JOBS} CC="${NACLCC}" CFLAGS=" -c ${NACLPORTS_CFLAGS}" LDFLAGS="${NACLPORTS_LDFLAGS}" tree
}

InstallStep() {
	# no need, just return for now
	return
}

PublishStep() {
  PublishByArchForDevEnv
}

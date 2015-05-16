# Copyright (c) 2014 The Native Client Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

# use -Wno-return-type to suppress return-type errors encountered
# with pnacl, arm (clang-newlib only)
NACLPORTS_CFLAGS+=" -Dmain=nacl_main -Wno-return-type"
BUILD_DIR=${SRC_DIR}
EXECUTABLES="microperl"
export NACLPORTS_LDFLAGS+=" ${NACL_CLI_MAIN_LIB} -lppapi_simple -lnacl_io \
  -lppapi -l${NACL_CXX_LIB}"

BuildStep() {
	# use host's cc when RunSelLdrCommand fails, i.e. on arm
	# and run ugenerate_uudmap directly
	CC=${NACLCC}
	RUN="RunSelLdrCommand"
	if [ "${NACL_ARCH}" = "arm" ]; then
		CC=gcc
		RUN=""
	fi
	
	# clean up previous executables
	LogExecute make -j${OS_JOBS} -f Makefile.micro clean
	
	# generate build time artifacts from ugenerate_uudmap
	LogExecute ${CC} -c -o ugenerate_uudmap.o -DPERL_CORE -DPERL_MICRO -DSTANDARD_C -DPERL_USE_SAFE_PUTENV -DNO_MATHOMS  generate_uudmap.c
	LogExecute ${CC} -o ugenerate_uudmap  ugenerate_uudmap.o -lm
	LogExecute ${RUN} ./ugenerate_uudmap uuudmap.h ubitcount.h umg_data.h
	
	# microperl build from Makefile.micro
	LogExecute make -j${OS_JOBS} -f Makefile.micro CC="${NACLCC}" CCFLAGS=" -c -DHAS_DUP2 -DPERL_MICRO ${NACLPORTS_CFLAGS}" LDFLAGS="${NACLPORTS_LDFLAGS}"
}

InstallStep() {
	# microperl doesn't require make install
	return
}

PublishStep() {
  PublishByArchForDevEnv
}

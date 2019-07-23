LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_C_INCLUDES += ../include 
LOCAL_MODULE    := lua53
LOCAL_CFLAGS := -DLUA_USE_POSIX -DLUA_USE_C89 -I../include
LOCAL_SRC_FILES :=  \
 ../../src/lapi.c ../../src/lauxlib.c ../../src/lbaselib.c ../../src/lbitlib.c ../../src/lcode.c ../../src/lcorolib.c ../../src/lctype.c \
 ../../src/ldblib.c ../../src/ldebug.c ../../src/ldo.c ../../src/ldump.c ../../src/lfunc.c ../../src/lgc.c ../../src/linit.c ../../src/liolib.c \
 ../../src/llex.c ../../src/lmathlib.c ../../src/lmem.c ../../src/loadlib.c ../../src/lobject.c \
 ../../src/lopcodes.c ../../src/loslib.c ../../src/lparser.c ../../src/lstate.c ../../src/lstring.c ../../src/lstrlib.c ../../src/ltable.c \
 ../../src/ltablib.c ../../src/ltm.c ../../src/lundump.c ../../src/lutf8lib.c ../../src/lvm.c ../../src/lzio.c

include $(BUILD_SHARED_LIBRARY)

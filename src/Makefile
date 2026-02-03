# Makefile for building Lua
# See ../doc/readme.html for installation and customization instructions.

# == CHANGE THE SETTINGS BELOW TO SUIT YOUR ENVIRONMENT =======================

# Your platform. See PLATS for possible values.
PLAT= guess

CC= gcc -std=gnu99
CFLAGS= -O2 -Wall -Wextra -Wconversion -DLUA_COMPAT_5_3 $(SYSCFLAGS) $(MYCFLAGS)
LDFLAGS= $(SYSLDFLAGS) $(MYLDFLAGS)
LIBS= -lm $(SYSLIBS) $(MYLIBS)

AR= ar rcu
RANLIB= ranlib
RM= rm -f
UNAME= uname

SYSCFLAGS=
SYSLDFLAGS=
SYSLIBS=

MYCFLAGS=
MYLDFLAGS=
MYLIBS=
MYOBJS=

# Special flags for compiler modules; -Os reduces code size.
CMCFLAGS= 

# == END OF USER SETTINGS -- NO NEED TO CHANGE ANYTHING BELOW THIS LINE =======

PLATS= guess aix bsd c89 freebsd generic ios linux linux-readline macosx mingw posix solaris

LUA_A=	liblua.a
CORE_O=	lapi.o lcode.o lctype.o ldebug.o ldo.o ldump.o lfunc.o lgc.o llex.o lmem.o lobject.o lopcodes.o lparser.o lstate.o lstring.o ltable.o ltm.o lundump.o lvm.o lzio.o
LIB_O=	lauxlib.o lbaselib.o lcorolib.o ldblib.o liolib.o lmathlib.o loadlib.o loslib.o lstrlib.o ltablib.o lutf8lib.o linit.o
BASE_O= $(CORE_O) $(LIB_O) $(MYOBJS)

LUA_T=	lua
LUA_O=	lua.o

LUAC_T=	luac
LUAC_O=	luac.o

ALL_O= $(BASE_O) $(LUA_O) $(LUAC_O)
ALL_T= $(LUA_A) $(LUA_T) $(LUAC_T)
ALL_A= $(LUA_A)

# Targets start here.
default: $(PLAT)

all:	$(ALL_T)

o:	$(ALL_O)

a:	$(ALL_A)

$(LUA_A): $(BASE_O)
	$(AR) $@ $(BASE_O)
	$(RANLIB) $@

$(LUA_T): $(LUA_O) $(LUA_A)
	$(CC) -o $@ $(LDFLAGS) $(LUA_O) $(LUA_A) $(LIBS)

$(LUAC_T): $(LUAC_O) $(LUA_A)
	$(CC) -o $@ $(LDFLAGS) $(LUAC_O) $(LUA_A) $(LIBS)

test:
	./$(LUA_T) -v

clean:
	$(RM) $(ALL_T) $(ALL_O)

depend:
	@$(CC) $(CFLAGS) -MM l*.c

echo:
	@echo "PLAT= $(PLAT)"
	@echo "CC= $(CC)"
	@echo "CFLAGS= $(CFLAGS)"
	@echo "LDFLAGS= $(LDFLAGS)"
	@echo "LIBS= $(LIBS)"
	@echo "AR= $(AR)"
	@echo "RANLIB= $(RANLIB)"
	@echo "RM= $(RM)"
	@echo "UNAME= $(UNAME)"

# Convenience targets for popular platforms.
ALL= all

help:
	@echo "Do 'make PLATFORM' where PLATFORM is one of these:"
	@echo "   $(PLATS)"
	@echo "See doc/readme.html for complete instructions."

guess:
	@echo Guessing `$(UNAME)`
	@$(MAKE) `$(UNAME)`

AIX aix:
	$(MAKE) $(ALL) CC="xlc" CFLAGS="-O2 -DLUA_USE_POSIX -DLUA_USE_DLOPEN" SYSLIBS="-ldl" SYSLDFLAGS="-brtl -bexpall"

bsd:
	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_POSIX -DLUA_USE_DLOPEN" SYSLIBS="-Wl,-E"

c89:
	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_C89" CC="gcc -std=c89"
	@echo ''
	@echo '*** C89 does not guarantee 64-bit integers for Lua.'
	@echo '*** Make sure to compile all external Lua libraries'
	@echo '*** with LUA_USE_C89 to ensure consistency'
	@echo ''

FreeBSD NetBSD OpenBSD freebsd:
	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_LINUX -DLUA_USE_READLINE -I/usr/include/edit" SYSLIBS="-Wl,-E -ledit" CC="cc"

generic: $(ALL)

ios:
	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_IOS"

Linux linux:	linux-noreadline

linux-noreadline:
	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_LINUX" SYSLIBS="-Wl,-E -ldl"

linux-readline:
	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_LINUX -DLUA_USE_READLINE" SYSLIBS="-Wl,-E -ldl -lreadline"

Darwin macos macosx:
	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_MACOSX -DLUA_USE_READLINE" SYSLIBS="-lreadline"

mingw:
	$(MAKE) "LUA_A=lua55.dll" "LUA_T=lua.exe" \
	"AR=$(CC) -shared -o" "RANLIB=strip --strip-unneeded" \
	"SYSCFLAGS=-DLUA_BUILD_AS_DLL" "SYSLIBS=" "SYSLDFLAGS=-s" lua.exe
	$(MAKE) "LUAC_T=luac.exe" luac.exe

posix:
	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_POSIX"

SunOS solaris:
	$(MAKE) $(ALL) SYSCFLAGS="-DLUA_USE_POSIX -DLUA_USE_DLOPEN -D_REENTRANT" SYSLIBS="-ldl"

# Targets that do not create files (not all makes understand .PHONY).
.PHONY: all $(PLATS) help test clean default o a depend echo

# Compiler modules may use special flags.
llex.o:
	$(CC) $(CFLAGS) $(CMCFLAGS) -c llex.c

lparser.o:
	$(CC) $(CFLAGS) $(CMCFLAGS) -c lparser.c

lcode.o:
	$(CC) $(CFLAGS) $(CMCFLAGS) -c lcode.c

# DO NOT DELETE

lapi.o: lapi.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lapi.h ../include/llimits.h ../include/lstate.h \
 ../include/lobject.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/ldebug.h ../include/ldo.h ../include/lfunc.h ../include/lgc.h ../include/lstring.h \
 ../include/ltable.h ../include/lundump.h ../include/lvm.h
lauxlib.o: lauxlib.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/llimits.h
lbaselib.o: lbaselib.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/lualib.h ../include/llimits.h
lcode.o: lcode.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lcode.h ../include/llex.h ../include/lobject.h \
 ../include/llimits.h ../include/lzio.h ../include/lmem.h ../include/lopcodes.h ../include/lparser.h ../include/ldebug.h ../include/lstate.h ../include/ltm.h \
 ../include/ldo.h ../include/lgc.h ../include/lstring.h ../include/ltable.h ../include/lvm.h ../include/lopnames.h
lcorolib.o: lcorolib.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/lualib.h ../include/llimits.h
lctype.o: lctype.c ../include/lprefix.h ../include/lctype.h ../include/lua.h ../include/luaconf.h ../include/llimits.h
ldblib.o: ldblib.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/lualib.h ../include/llimits.h
ldebug.o: ldebug.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lapi.h ../include/llimits.h ../include/lstate.h \
 ../include/lobject.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/lcode.h ../include/llex.h ../include/lopcodes.h ../include/lparser.h \
 ../include/ldebug.h ../include/ldo.h ../include/lfunc.h ../include/lstring.h ../include/lgc.h ../include/ltable.h ../include/lvm.h
ldo.o: ldo.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lapi.h ../include/llimits.h ../include/lstate.h \
 ../include/lobject.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/ldebug.h ../include/ldo.h ../include/lfunc.h ../include/lgc.h ../include/lopcodes.h \
 ../include/lparser.h ../include/lstring.h ../include/ltable.h ../include/lundump.h ../include/lvm.h
ldump.o: ldump.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lobject.h ../include/llimits.h ../include/lstate.h \
 ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/lundump.h ../include/lapi.h ../include/lgc.h ../include/ltable.h
lfunc.o: lfunc.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/ldebug.h ../include/lstate.h ../include/lobject.h \
 ../include/llimits.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/ldo.h ../include/lfunc.h ../include/lgc.h
lgc.o: lgc.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/ldebug.h ../include/lstate.h ../include/lobject.h \
 ../include/llimits.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/ldo.h ../include/lfunc.h ../include/lgc.h ../include/lstring.h ../include/ltable.h
linit.o: linit.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lualib.h ../include/lauxlib.h ../include/llimits.h
liolib.o: liolib.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/lualib.h ../include/llimits.h
llex.o: llex.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lctype.h ../include/llimits.h ../include/ldebug.h \
 ../include/lstate.h ../include/lobject.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/ldo.h ../include/lgc.h ../include/llex.h ../include/lparser.h \
 ../include/lstring.h ../include/ltable.h
lmathlib.o: lmathlib.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/lualib.h ../include/llimits.h
lmem.o: lmem.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/ldebug.h ../include/lstate.h ../include/lobject.h \
 ../include/llimits.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/ldo.h ../include/lgc.h
loadlib.o: loadlib.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/lualib.h ../include/llimits.h
lobject.o: lobject.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lctype.h ../include/llimits.h \
 ../include/ldebug.h ../include/lstate.h ../include/lobject.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/ldo.h ../include/lstring.h ../include/lgc.h \
 ../include/lvm.h
lopcodes.o: lopcodes.c ../include/lprefix.h ../include/lopcodes.h ../include/llimits.h ../include/lua.h ../include/luaconf.h ../include/lobject.h
loslib.o: loslib.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/lualib.h ../include/llimits.h
lparser.o: lparser.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lcode.h ../include/llex.h ../include/lobject.h \
 ../include/llimits.h ../include/lzio.h ../include/lmem.h ../include/lopcodes.h ../include/lparser.h ../include/ldebug.h ../include/lstate.h ../include/ltm.h \
 ../include/ldo.h ../include/lfunc.h ../include/lstring.h ../include/lgc.h ../include/ltable.h
lstate.o: lstate.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lapi.h ../include/llimits.h ../include/lstate.h \
 ../include/lobject.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/ldebug.h ../include/ldo.h ../include/lfunc.h ../include/lgc.h ../include/llex.h \
 ../include/lstring.h ../include/ltable.h
lstring.o: lstring.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/ldebug.h ../include/lstate.h \
 ../include/lobject.h ../include/llimits.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/ldo.h ../include/lstring.h ../include/lgc.h
lstrlib.o: lstrlib.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/lualib.h ../include/llimits.h
ltable.o: ltable.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/ldebug.h ../include/lstate.h ../include/lobject.h \
 ../include/llimits.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/ldo.h ../include/lgc.h ../include/lstring.h ../include/ltable.h ../include/lvm.h
ltablib.o: ltablib.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/lualib.h ../include/llimits.h
ltm.o: ltm.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/ldebug.h ../include/lstate.h ../include/lobject.h \
 ../include/llimits.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/ldo.h ../include/lgc.h ../include/lstring.h ../include/ltable.h ../include/lvm.h
lua.o: lua.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/lualib.h ../include/llimits.h
luac.o: luac.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/ldebug.h ../include/lstate.h \
 ../include/lobject.h ../include/llimits.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/lopcodes.h ../include/lopnames.h ../include/lundump.h ../include/lapi.h
lundump.o: lundump.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/ldebug.h ../include/lstate.h \
 ../include/lobject.h ../include/llimits.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/ldo.h ../include/lfunc.h ../include/lstring.h ../include/lgc.h \
 ../include/lundump.h ../include/llimits.h
lutf8lib.o: lutf8lib.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/lauxlib.h ../include/lualib.h ../include/llimits.h
lvm.o: lvm.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/ldebug.h ../include/lstate.h ../include/lobject.h \
 ../include/llimits.h ../include/ltm.h ../include/lzio.h ../include/lmem.h ../include/ldo.h ../include/lfunc.h ../include/lgc.h ../include/lopcodes.h ../include/lstring.h \
 ../include/ltable.h ../include/lvm.h ../include/ljumptab.h ../include/lapi.h
lzio.o: lzio.c ../include/lprefix.h ../include/lua.h ../include/luaconf.h ../include/llimits.h ../include/lmem.h ../include/lstate.h \
 ../include/lobject.h ../include/ltm.h ../include/lzio.h ../include/lapi.h

# (end of Makefile)

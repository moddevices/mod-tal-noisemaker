# C++ Static Library Makefile autogenerated by premake
# Don't edit this file! Instead edit `premake.lua` then rerun `make`

ifndef CONFIG
  CONFIG=Release
endif

# if multiple archs are defined turn off automated dependency generation
DEPFLAGS := $(if $(word 2, $(TARGET_ARCH)), , -MMD)

ifeq ($(CONFIG),Release)
  BINDIR := ../..
  LIBDIR := ../..
  OBJDIR := intermediate/Release
  OUTDIR := ../..
  CPPFLAGS := $(DEPFLAGS) -D "LINUX=1" -D "NDEBUG=1" -I "." -I "../../juce/source" -I "../../juce/source/modules"
  CFLAGS += $(CPPFLAGS) $(TARGET_ARCH) -O2 -fPIC -DPIC -Wall -pthread -DJUCE_APP_CONFIG_HEADER='<AppConfig.h>' -Wno-multichar -Wno-unused-but-set-variable -Wno-unused-function -Wno-strict-overflow `pkg-config --cflags alsa freetype2 x11 xext` -std=c++0x -O3 -fvisibility=hidden -fvisibility-inlines-hidden -D__MOD_DEVICES__ -mcpu=cortex-a7 -mtune=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard -mvectorize-with-neon-quad -ffast-math -fno-finite-math-only -fprefetch-loop-arrays -funroll-loops -funsafe-loop-optimizations -isystem ${STAGING_DIR}/usr/include -msse -msse2 -mcpu=cortex-a7 -mtune=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard -mvectorize-with-neon-quad -ffast-math -fno-finite-math-only -fprefetch-loop-arrays -funroll-loops -funsafe-loop-optimizations -fdata-sections -ffunction-sections
  CXXFLAGS += $(CFLAGS)
  LDFLAGS += -L$(BINDIR) -L$(LIBDIR) -s
  LDDEPS :=
  RESFLAGS := -D "LINUX=1" -D "NDEBUG=1" -I "." -I "../../juce/source" -I "../../juce/source/modules"
  TARGET := libjuced.a
 BLDCMD = ar -rcs $(OUTDIR)/$(TARGET) $(OBJECTS) $(TARGET_ARCH)
endif

ifeq ($(CONFIG),Debug)
  BINDIR := ../..
  LIBDIR := ../..
  OBJDIR := intermediate/Debug
  OUTDIR := ../..
  CPPFLAGS := $(DEPFLAGS) -D "LINUX=1" -D "DEBUG=1" -D "_DEBUG=1" -I "." -I "../../juce/source" -I "../../juce/source/modules"
  CFLAGS += $(CPPFLAGS) $(TARGET_ARCH) -g -fPIC -DPIC -Wall -pthread -DJUCE_APP_CONFIG_HEADER='<AppConfig.h>' -Wno-multichar -Wno-unused-but-set-variable -Wno-unused-function -Wno-strict-overflow `pkg-config --cflags alsa freetype2 x11 xext` -std=c++0x -O0 -ggdb
  CXXFLAGS += $(CFLAGS)
  LDFLAGS += -L$(BINDIR) -L$(LIBDIR)
  LDDEPS :=
  RESFLAGS := -D "LINUX=1" -D "DEBUG=1" -D "_DEBUG=1" -I "." -I "../../juce/source" -I "../../juce/source/modules"
  TARGET := libjuced_debug.a
 BLDCMD = ar -rcs $(OUTDIR)/$(TARGET) $(OBJECTS) $(TARGET_ARCH)
endif

OBJECTS := \
	$(OBJDIR)/juced.o \

MKDIR_TYPE := msdos
CMD := $(subst \,\\,$(ComSpec)$(COMSPEC))
ifeq (,$(CMD))
  MKDIR_TYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  MKDIR_TYPE := posix
endif
ifeq ($(MKDIR_TYPE),posix)
  CMD_MKBINDIR := mkdir -p $(BINDIR)
  CMD_MKLIBDIR := mkdir -p $(LIBDIR)
  CMD_MKOUTDIR := mkdir -p $(OUTDIR)
  CMD_MKOBJDIR := mkdir -p $(OBJDIR)
else
  CMD_MKBINDIR := $(CMD) /c if not exist $(subst /,\\,$(BINDIR)) mkdir $(subst /,\\,$(BINDIR))
  CMD_MKLIBDIR := $(CMD) /c if not exist $(subst /,\\,$(LIBDIR)) mkdir $(subst /,\\,$(LIBDIR))
  CMD_MKOUTDIR := $(CMD) /c if not exist $(subst /,\\,$(OUTDIR)) mkdir $(subst /,\\,$(OUTDIR))
  CMD_MKOBJDIR := $(CMD) /c if not exist $(subst /,\\,$(OBJDIR)) mkdir $(subst /,\\,$(OBJDIR))
endif

.PHONY: clean

$(OUTDIR)/$(TARGET): $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking juced
	-@$(CMD_MKBINDIR)
	-@$(CMD_MKLIBDIR)
	-@$(CMD_MKOUTDIR)
	@$(BLDCMD)

clean:
	@echo Cleaning juced
ifeq ($(MKDIR_TYPE),posix)
	-@rm -f $(OUTDIR)/$(TARGET)
	-@rm -rf $(OBJDIR)
else
	-@if exist $(subst /,\,$(OUTDIR)/$(TARGET)) del /q $(subst /,\,$(OUTDIR)/$(TARGET))
	-@if exist $(subst /,\,$(OBJDIR)) del /q $(subst /,\,$(OBJDIR))
	-@if exist $(subst /,\,$(OBJDIR)) rmdir /s /q $(subst /,\,$(OBJDIR))
endif

$(OBJDIR)/juced.o: ../source/juced.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o "$@" -c "$<"

-include $(OBJECTS:%.o=%.d)

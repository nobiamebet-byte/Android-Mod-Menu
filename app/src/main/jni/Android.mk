LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := dobby
LOCAL_SRC_FILES := Dobby/libraries/$(TARGET_ARCH_ABI)/libdobby.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := Keystone
LOCAL_SRC_FILES := KittyMemory/Deps/Keystone/libs-android/$(TARGET_ARCH_ABI)/libkeystone.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := MyLibName
LOCAL_C_INCLUDES := $(LOCAL_PATH) $(LOCAL_PATH)/Includes/

LOCAL_SRC_FILES := Main.cpp \
                   Includes/Utils.cpp \
                   KittyMemory/KittyArm64.cpp \
                   KittyMemory/KittyScanner.cpp \
                   KittyMemory/KittyMemory.cpp \
                   KittyMemory/KittyUtils.cpp \
                   KittyMemory/MemoryPatch.cpp \
                   KittyMemory/MemoryBackup.cpp

LOCAL_LDLIBS := -llog -landroid -lEGL -lGLESv2
LOCAL_STATIC_LIBRARIES := Keystone dobby
include $(BUILD_SHARED_LIBRARY)


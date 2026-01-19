#!/bin/sh

lipo ./build/Release-appletvsimulator/liblua55.framework/liblua55 -verify_arch arm64
if [ $? -eq 0 ]; then
    mv ./build/Release-appletvsimulator/liblua55.framework/liblua55 ./build/Release-appletvsimulator/liblua55.framework/liblua55.old;
    lipo ./build/Release-appletvsimulator/liblua55.framework/liblua55.old -remove arm64 -output ./build/Release-appletvsimulator/liblua55.framework/liblua55;
fi
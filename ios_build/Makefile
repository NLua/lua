.PHONY: all

all: ios tvos maccatalyst

ios: ./ios/liblua55.framework/liblua55
./ios/liblua55.framework/liblua55:
	xcodebuild DISABLE_MANUAL_TARGET_ORDER_BUILD_WARNING=1 -project lua.ios.xcodeproj -configuration Release -sdk iphonesimulator
	xcodebuild DISABLE_MANUAL_TARGET_ORDER_BUILD_WARNING=1 -project lua.ios.xcodeproj  -configuration Release -sdk iphoneos
	ditto ./Build/Release-iphoneos/ ./ios/
	rm ./ios/liblua55.framework/liblua55
	lipo -create ./build/Release-iphonesimulator/liblua55.framework/liblua55  ./build/Release-iphoneos/liblua55.framework/liblua55 -output  ./ios/liblua55.framework/liblua55

tvos: ./tvos/liblua55.framework/liblua55
./tvos/liblua55.framework/liblua55:
	xcodebuild DISABLE_MANUAL_TARGET_ORDER_BUILD_WARNING=1 -project lua.tvos.xcodeproj -configuration Release -sdk appletvsimulator
	# Xcode 12 has a bug where it adds arm64 to appletv simulator
	./fix_tvos.sh
	xcodebuild DISABLE_MANUAL_TARGET_ORDER_BUILD_WARNING=1 -project lua.tvos.xcodeproj  -configuration Release -sdk appletvos
	ditto ./Build/Release-appletvos/ ./tvos/
	rm ./tvos/liblua55.framework/liblua55
	lipo -create ./build/Release-appletvsimulator/liblua55.framework/liblua55  ./build/Release-appletvos/liblua55.framework/liblua55 -output  ./tvos/liblua55.framework/liblua55

maccatalyst:  ./maccatalyst/liblua55.framework/liblua55
./maccatalyst/liblua55.framework/liblua55:
	xcodebuild -configuration Release -destination "platform=macOS,variant=Mac Catalyst" -project lua.maccatalyst.xcodeproj -scheme liblua55 SYMROOT=build_maccatalyst/
	ditto ./build_maccatalyst/Release-maccatalyst/liblua55.framework/Versions/A/ ./maccatalyst/liblua55.framework/

clean:
	rm -Rf build
	rm -Rf ./ios/
	rm -Rf ./tvos/
	rm -Rf ./maccatalyst/
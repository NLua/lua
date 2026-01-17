.PHONY: all

all: ios tvos maccatalyst

ios: ./ios/liblua54.framework/liblua54
./ios/liblua54.framework/liblua54:
	xcodebuild DISABLE_MANUAL_TARGET_ORDER_BUILD_WARNING=1 -project lua.ios.xcodeproj -configuration Release -sdk iphonesimulator
	xcodebuild DISABLE_MANUAL_TARGET_ORDER_BUILD_WARNING=1 -project lua.ios.xcodeproj  -configuration Release -sdk iphoneos
	ditto ./Build/Release-iphoneos/ ./ios/
	rm ./ios/liblua54.framework/liblua54
	lipo -create ./build/Release-iphonesimulator/liblua54.framework/liblua54  ./build/Release-iphoneos/liblua54.framework/liblua54 -output  ./ios/liblua54.framework/liblua54

tvos: ./tvos/liblua54.framework/liblua54
./tvos/liblua54.framework/liblua54:
	xcodebuild DISABLE_MANUAL_TARGET_ORDER_BUILD_WARNING=1 -project lua.tvos.xcodeproj -configuration Release -sdk appletvsimulator
	# Xcode 12 has a bug where it adds arm64 to appletv simulator
	./fix_tvos.sh
	xcodebuild DISABLE_MANUAL_TARGET_ORDER_BUILD_WARNING=1 -project lua.tvos.xcodeproj  -configuration Release -sdk appletvos
	ditto ./Build/Release-appletvos/ ./tvos/
	rm ./tvos/liblua54.framework/liblua54
	lipo -create ./build/Release-appletvsimulator/liblua54.framework/liblua54  ./build/Release-appletvos/liblua54.framework/liblua54 -output  ./tvos/liblua54.framework/liblua54

maccatalyst:  ./maccatalyst/liblua54.framework/liblua54
./maccatalyst/liblua54.framework/liblua54:
	xcodebuild -configuration Release -destination "platform=macOS,variant=Mac Catalyst" -project lua.maccatalyst.xcodeproj -scheme liblua54 SYMROOT=build_maccatalyst/
	ditto ./build_maccatalyst/Release-maccatalyst/liblua54.framework/Versions/A/ ./maccatalyst/liblua54.framework/

clean:
	rm -Rf build
	rm -Rf ./ios/
	rm -Rf ./tvos/
	rm -Rf ./maccatalyst/
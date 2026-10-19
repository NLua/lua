.PHONY: all ios iossimulator-x64 iossimulator-arm64 tvos maccatalyst clean

all: ios iossimulator-x64 iossimulator-arm64 tvos maccatalyst

ios: ./ios/liblua54.framework/liblua54
./ios/liblua54.framework/liblua54:
	rm -Rf ./ios ./build/ios
	xcodebuild DISABLE_MANUAL_TARGET_ORDER_BUILD_WARNING=1 -project lua.ios.xcodeproj -configuration Release -sdk iphoneos -arch arm64 SYMROOT=./build/ios
	ditto ./build/ios/Release-iphoneos/ ./ios/

iossimulator-x64: ./iossimulator-x64/liblua54.framework/liblua54
./iossimulator-x64/liblua54.framework/liblua54:
	rm -Rf ./iossimulator-x64 ./build/iossimulator-x64
	xcodebuild DISABLE_MANUAL_TARGET_ORDER_BUILD_WARNING=1 -project lua.ios.xcodeproj -configuration Release -sdk iphonesimulator -arch x86_64 SYMROOT=./build/iossimulator-x64
	ditto ./build/iossimulator-x64/Release-iphonesimulator/ ./iossimulator-x64/

iossimulator-arm64: ./iossimulator-arm64/liblua54.framework/liblua54
./iossimulator-arm64/liblua54.framework/liblua54:
	rm -Rf ./iossimulator-arm64 ./build/iossimulator-arm64
	xcodebuild DISABLE_MANUAL_TARGET_ORDER_BUILD_WARNING=1 -project lua.ios.xcodeproj -configuration Release -sdk iphonesimulator -arch arm64 SYMROOT=./build/iossimulator-arm64
	ditto ./build/iossimulator-arm64/Release-iphonesimulator/ ./iossimulator-arm64/

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
	rm -Rf ./iossimulator-x64/
	rm -Rf ./iossimulator-arm64/
	rm -Rf ./tvos/
	rm -Rf ./maccatalyst/
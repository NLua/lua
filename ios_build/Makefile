.PHONY: all

all: ios watchos tvos

ios: ./ios/liblua54.framework/liblua54
./ios/liblua54.framework/liblua54:
	xcodebuild  -project lua.ios.xcodeproj -configuration Release -sdk iphonesimulator
	xcodebuild  -project lua.ios.xcodeproj  -configuration Release -sdk iphoneos
	ditto ./Build/Release-iphoneos/ ./ios/
	rm ./ios/liblua54.framework/liblua54
	lipo -create ./build/Release-iphonesimulator/liblua54.framework/liblua54  ./build/Release-iphoneos/liblua54.framework/liblua54 -output  ./ios/liblua54.framework/liblua54

watchos: ./watchos/liblua54.framework/liblua54
./watchos/liblua54.framework/liblua54:
	xcodebuild  -project lua.watchos.xcodeproj -configuration Release -sdk watchsimulator
	xcodebuild  -project lua.watchos.xcodeproj  -configuration Release -sdk watchos
	ditto ./Build/Release-watchos/ ./watchos/
	rm ./watchos/liblua54.framework/liblua54
	lipo -create ./build/Release-watchsimulator/liblua54.framework/liblua54  ./build/Release-watchos/liblua54.framework/liblua54 -output  ./watchos/liblua54.framework/liblua54

tvos: ./tvos/liblua54.framework/liblua54
./tvos/liblua54.framework/liblua54:
	xcodebuild  -project lua.tvos.xcodeproj -configuration Release -sdk appletvsimulator
	xcodebuild  -project lua.tvos.xcodeproj  -configuration Release -sdk appletvos
	ditto ./Build/Release-appletvos/ ./tvos/
	rm ./tvos/liblua54.framework/liblua54
	lipo -create ./build/Release-appletvsimulator/liblua54.framework/liblua54  ./build/Release-appletvos/liblua54.framework/liblua54 -output  ./tvos/liblua54.framework/liblua54

clean:
	rm -Rf build
	rm -Rf ./ios/
	rm -Rf ./watchos/
	rm -Rf ./tvos/
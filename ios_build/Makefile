.PHONY: all

all: ios watchos tvos

ios: ./ios/lua53.framework/lua53
./ios/lua53.framework/lua53:
	xcodebuild  -project lua.ios.xcodeproj -configuration Release -sdk iphonesimulator ONLY_ACTIVE_ARCH=NO
	xcodebuild  -project lua.ios.xcodeproj  -configuration Release -sdk iphoneos ONLY_ACTIVE_ARCH=NO
	ditto ./Build/Release-iphoneos/ ./ios/
	rm ./ios/lua53.framework/lua53
	lipo -create ./build/Release-iphonesimulator/lua53.framework/lua53  ./build/Release-iphoneos/lua53.framework/lua53 -output  ./ios/lua53.framework/lua53
	/usr/libexec/PlistBuddy -c "Add :CFBundleSupportedPlatforms: string iPhoneSimulator" ./ios/lua53.framework/Info.plist

watchos: ./watchos/lua53.framework/lua53
./watchos/lua53.framework/lua53:
	xcodebuild  -project lua.watchos.xcodeproj -configuration Release -sdk watchsimulator ONLY_ACTIVE_ARCH=NO
	xcodebuild  -project lua.watchos.xcodeproj  -configuration Release -sdk watchos ONLY_ACTIVE_ARCH=NO
	ditto ./Build/Release-watchos/ ./watchos/
	rm ./watchos/lua53.framework/lua53
	lipo -create ./build/Release-watchsimulator/lua53.framework/lua53  ./build/Release-watchos/lua53.framework/lua53 -output  ./watchos/lua53.framework/lua53
	/usr/libexec/PlistBuddy -c "Add :CFBundleSupportedPlatforms: string WatchSimulator" ./watchos/lua53.framework/Info.plist

tvos: ./tvos/lua53.framework/lua53
./tvos/lua53.framework/lua53:
	xcodebuild  -project lua.tvos.xcodeproj -configuration Release -sdk appletvsimulator ONLY_ACTIVE_ARCH=NO
	xcodebuild  -project lua.tvos.xcodeproj  -configuration Release -sdk appletvos ONLY_ACTIVE_ARCH=NO
	ditto ./Build/Release-appletvos/ ./tvos/
	rm ./tvos/lua53.framework/lua53
	lipo -create ./build/Release-appletvsimulator/lua53.framework/lua53  ./build/Release-appletvos/lua53.framework/lua53 -output  ./tvos/lua53.framework/lua53
	/usr/libexec/PlistBuddy -c "Add :CFBundleSupportedPlatforms: string AppleTVSimulator" ./tvos/lua53.framework/Info.plist

clean:
	rm -Rf build
	rm -Rf ./ios/
	rm -Rf ./watchos/
	rm -Rf ./tvos/
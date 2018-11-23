ios:
	xcodebuild  -target lua53 -configuration Release -sdk iphonesimulator ONLY_ACTIVE_ARCH=NO
	xcodebuild  -target lua53 -configuration Release -sdk iphoneos ONLY_ACTIVE_ARCH=NO
	ditto ./Build/Release-iphoneos/ ./ios/
	rm ./ios/lua53.framework/lua53
	lipo -create ./build/Release-iphonesimulator/lua53.framework/lua53  ./build/Release-iphoneos/lua53.framework/lua53 -output  ./ios/lua53.framework/lua53
	/usr/libexec/PlistBuddy -c "Add :CFBundleSupportedPlatforms: string iPhoneSimulator" ./ios/lua53.framework/Info.plist
all: ios

clean:
	rm -Rf build
	rm -Rf ./ios/
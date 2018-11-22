all:
	xcodebuild  -target lua53 -configuration Release -sdk iphonesimulator ONLY_ACTIVE_ARCH=NO
	xcodebuild  -target lua53 -configuration Release -sdk iphoneos ONLY_ACTIVE_ARCH=NO
	cp -R ./Build/Release-iphoneos/lua53.framework .
	rm ./lua53.framework/lua53
	lipo -create ./build/Release-iphonesimulator/lua53.framework/lua53  ./build/Release-iphoneos/lua53.framework/lua53 -output  ./lua53.framework/lua53
	/usr/libexec/PlistBuddy -c "Add :CFBundleSupportedPlatforms: string iPhoneSimulator" ./lua53.framework/Info.plist
clean:
	rm -Rf build
	rm -Rf lua53.framework
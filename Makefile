library_path = LIBRARY_PATH="$(shell pwd)/openssl/lib"
cpath = CPATH="$(shell pwd)/openssl/include"

.PHONY: ios.debug
ios.debug: framework/Cgo.framework RNApp/node_modules RNApp/ios/Pods
	cd RNApp && npx react-native run-ios

.PHONY: ios.release
ios.release: framework/Cgo.framework RNApp/node_modules RNApp/ios/Pods
	cd RNApp && npx react-native run-ios --configuration=Release

RNApp/ios/Pods: RNApp/ios/Podfile
	cd RNApp/ios && pod install
	touch $@

RNApp/node_modules: RNApp/package.json
	cd RNApp && yarn install
	touch $@

framework/Cgo.framework: $(wildcard cgo/*)
	go mod download
	go run golang.org/x/mobile/cmd/gomobile init
	GO111MODULE=on $(library_path) $(cpath) \
		go run golang.org/x/mobile/cmd/gomobile bind \
			-o $@ \
			-target ios \
			./cgo

framework:
	mkdir -p $@

framework/Cgo.framework: $(wildcard cgo/*)
	go mod download
	go run golang.org/x/mobile/cmd/gomobile init
	GO111MODULE=on go run golang.org/x/mobile/cmd/gomobile bind \
		-o $@ \
		-target ios \
		./cgo

framework:
	mkdir -p $@

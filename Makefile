install:
	swift package update
	swift build -c release
	install .build/release/swifthooks /usr/local/bin/swifthooks

uninstall:
	rm -f /usr/local/bin/swifthooks
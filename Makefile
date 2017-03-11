all:
	gcc src/*.m -framework IOKit -framework Cocoa -Wno-deprecated -o bin/nomouse

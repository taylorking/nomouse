all:
	gcc src/*.m -framework IOKit -framework Appkit -framework Cocoa -Wno-deprecated -o bin/nomouse

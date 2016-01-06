clean:
	rm -rf icu 

clean-all: clean
	rm -rf libs

build-osx:
	./build-osx.sh

build-linux:
	./build-linux.sh

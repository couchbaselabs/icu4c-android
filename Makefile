clean:
	rm -rf icu 

clean-all: clean
	rm -rf libs

build-osx:
	./build-osx.sh

build-linux:
	./build-linux.sh

#build-windows:
#	build-windows.cmd

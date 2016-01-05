
# Build OSX binaries:
OUTPUT_DIR="libs/linux"
rm -rf ${OUTPUT_DIR}
mkdir ${OUTPUT_DIR}

cd ./icu4c
pwd

build_linux() {
	ARCH=$1
  	echo "Building osx libicuuc.a and libicui18n.a for ${ARCH}"
  	if [[ $ARCH == "x86" ]]; then
  		./runConfigureICU Linux --enable-static --with-library-bits=32
  	else
		./runConfigureICU Linux --enable-static
	fi
	make clean
	make
	file lib/libicuuc.a
	file lib/libicui18n.a
	file lib/libicudata.a.a
	mkdir -p ../${OUTPUT_DIR}/${ARCH}/
	cp lib/libicuuc.a ../${OUTPUT_DIR}/${ARCH}/
	cp lib/libicui18n.a ../${OUTPUT_DIR}/${ARCH}/
	cp lib/libicudata.a ../${OUTPUT_DIR}/${ARCH}/
}

build_linux "x86"
build_linux "x86_64"
build_linux "amd64"

cd ..
pwd
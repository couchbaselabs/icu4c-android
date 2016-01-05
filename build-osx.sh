
# Build OSX binaries:
OUTPUT_DIR="libs/osx"
rm -rf ${OUTPUT_DIR}
mkdir ${OUTPUT_DIR}

cd ./icu4c

build_osx() {
	ARCH=$1
  	echo "Building osx libicuuc.a and libicui18n.a for ${ARCH}"
  	if [[ $ARCH == "x86" ]]; then
  		# With --disable-shared option, build for libicudata.a fails for 32bit. 
  		./runConfigureICU MacOSX --enable-static --with-library-bits=32
  	else
		./runConfigureICU MacOSX --enable-static 
	fi
	make clean
	make
	file lib/libicuuc.a
	file lib/libicui18n.a
	file lib/libicudata.a
	mkdir -p ../${OUTPUT_DIR}/${ARCH}/
	cp lib/libicuuc.a ../${OUTPUT_DIR}/${ARCH}/
	cp lib/libicui18n.a ../${OUTPUT_DIR}/${ARCH}/
	cp lib/libicudata.a ../${OUTPUT_DIR}/${ARCH}/
}

build_osx "x86"
build_osx "x86_64"

cd ..

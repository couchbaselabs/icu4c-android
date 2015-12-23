
# Build OSX binaries:
OUTPUT_DIR="libs/osx"
rm -rf ${OUTPUT_DIR}
mkdir ${OUTPUT_DIR}

cd ./icu4c
pwd

build_osx() {
	ARCH=$1
  	echo "Building osx libicuuc.a and libicui18n.a for ${ARCH}"
	./configure --enable-static
	make clean
	cd ./common
	make
	cd ..
	cd ./i18n
	make
	cd ..
	file lib/libicuuc.a
	file lib/libicui18n.a
	mkdir -p ../${OUTPUT_DIR}/${ARCH}/
	cp lib/libicuuc.a ../${OUTPUT_DIR}/${ARCH}/
	cp lib/libicui18n.a ../${OUTPUT_DIR}/${ARCH}/
}

build_osx "x86_64"

cd ..
pwd
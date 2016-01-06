
# Build OSX binaries:
OUTPUT_DIR="libs/osx"
rm -rf ${OUTPUT_DIR}
mkdir -p ${OUTPUT_DIR}

# Extract codes
tar -xzvf download/icu4c-53_1-src.tgz
cp ./download/icudt53l.dat ./icu/source/data/in/

cd ./icu/source

build_osx() {
	ARCH=$1
  	echo "Building osx libicuuc.a and libicui18n.a for ${ARCH}"
  	if [[ $ARCH == "x86" ]]; then
  		CPPFLAGS="-DUCONFIG_ONLY_COLLATION=1 -DUCONFIG_NO_LEGACY_CONVERSION=1" ./runConfigureICU MacOSX --enable-static --disable-shared --with-library-bits=32
  	else
		CPPFLAGS="-DUCONFIG_ONLY_COLLATION=1 -DUCONFIG_NO_LEGACY_CONVERSION=1" ./runConfigureICU MacOSX --enable-static --disable-shared
	fi
	make clean
	make
	file lib/libicuuc.a
	file lib/libicui18n.a
	file lib/libicudata.a
	mkdir -p ../../${OUTPUT_DIR}/${ARCH}/
	cp lib/libicuuc.a   ../../${OUTPUT_DIR}/${ARCH}/
	cp lib/libicui18n.a ../../${OUTPUT_DIR}/${ARCH}/
	cp lib/libicudata.a ../../${OUTPUT_DIR}/${ARCH}/
}

build_osx "x86"
build_osx "x86_64"

cd ../..

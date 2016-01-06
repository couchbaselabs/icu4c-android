:: Must have PATH to Cygwin\bin

:: Visual Studio Environment
:: set VCVARSALL="C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\vcvarsall.bat"
set VSCMD="C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\bin\vcvars32.bat"
set VSCMD_64="C:\Program Files (x86)\Microsoft Visual Studio 12.0\VC\bin\amd64\vcvars64.bat"

:: Output Directory
set OUTPUT_DIR="%CD%\libs\windows"

:: Clean output directory
rmdir /S /Q %OUTPUT_DIR%

# Extract codes
tar -xzvf download/icu4c-53_1-src.tgz
cp ./download/icudt53l.dat ./icu/source/data/in/

cp config_windows.sh ./icu/source

cd ./icu/source

:: Build 32 bit binaries

:: Run Visual Studio 32 bits shell
call %VSCMD%

:: Configure and make
:: bash runConfigureICU Cygwin/MSVC --enable-static --disable-shared --with-library-bits=32
bash config_windows.sh
make clean
make

:: Copy binary
mkdir %OUTPUT_DIR%\x86
copy lib\sicudt.lib %OUTPUT_DIR%\x86
copy lib\sicuin.lib %OUTPUT_DIR%\x86
copy lib\sicuuc.lib %OUTPUT_DIR%\x86

:: Build 64 bit binaries

:: Run Visual Studio 64 bits shell
call %VSCMD_64%

:: Configure and make
:: bash runConfigureICU Cygwin/MSVC --enable-static --disable-shared
bash config_windows.sh
make clean
make

:: Copy binary
mkdir %OUTPUT_DIR%\amd64
copy lib\sicudt.lib %OUTPUT_DIR%\amd64
copy lib\sicuin.lib %OUTPUT_DIR%\amd64
copy lib\sicuuc.lib %OUTPUT_DIR%\amd64

mkdir %OUTPUT_DIR%\x86_64
copy lib\sicudt.lib %OUTPUT_DIR%\x86_64
copy lib\sicuin.lib %OUTPUT_DIR%\x86_64
copy lib\sicuuc.lib %OUTPUT_DIR%\x86_64

:: Exit
cd ../..
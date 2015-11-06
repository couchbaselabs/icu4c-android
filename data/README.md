# Data file

### Commited data file
Currently commited data file contains only collation data. (coll/*)

### How to create collation only data file from original

##### Prerequest
* Build ICU4C for platform you are ussing.
```
cd icu4c
./configure
make
```
* Set LIBRARY_PATH to ICU4C lib directory
```
export DYLD_LIBRARY_PATH="<ICU4C Home Directory>/lib"
Ex: export DYLD_LIBRARY_PATH="/Users/hideki/github/icu4c-android/icu4c/lib"
```

##### Create subset of data file
* Generate list of files in original data file
```
cd bin
./icupkg -tl -l ../stubdata/icudt53l.dat  > /tmp/out.lst
```
* Extract all files from the original data file
```
mkdir /tmp/icudt53l
./icupkg -tl -x /tmp/out.lst ../stubdata/icudt53l.dat -d /tmp/icudt53l/
```
* Update out.lst
* Repack the new icudt53l.dat
```
cd /tmp/icudt53l/
~/github/icu4c-android/icu4c/bin/gencmn -v -n icudt53l 0 < ../out.lst 
```
* Output => /tmp/icudt53l/icudt53l.dat


### out.lst
* **It is list of data files in current icudt53l.dat**



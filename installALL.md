

# binutils
```
mkdir /home/xgzhu/apps/srcbuilds/binutils
tar xvf binutils-2.28.tar.gz
cd binutils-2.28
## capital "O"; the folder binutils should exist
./configure --disable-shared --prefix=/home/xgzhu/apps/srcbuilds/binutils CC=gcc CXX=g++  CFLAGS="-g -no-pie" CXXFLAGS="-g -no-pie"
make
## move bins into /home/xgzhu/apps/srcbuilds/binutils
make install
```
# bison
```
mkdir /home/xgzhu/apps/srcbuilds/bison
tar -xJf bison-3.0.4.tar.xz
cd bison-3.0.4
./configure --enable-silent-rules --prefix=/home/xgzhu/apps/srcbuilds/bison CC=gcc CXX=g++ CFLAGS="-g -no-pie" CXXFLAGS="-g -no-pie"
make && make install
```

# catdoc
```
mkdir /home/xgzhu/apps/srcbuilds/catdoc
tar -xzf catdoc-0.95.tar.gz
cd catdoc-0.95
./configure --prefix=/home/xgzhu/apps/srcbuilds/catdoc CC=gcc CFLAGS="-g -no-pie"
make && make install
```

# cflow
```
mkdir /home/xgzhu/apps/srcbuilds/cflow
tar -xzf cflow-1.5.tar.gz
cd cflow-1.5
./configure --enable-silent-rules --prefix=/home/xgzhu/apps/srcbuilds/cflow CC=gcc CXX=g++ CFLAGS="-g -no-pie" CXXFLAGS="-g -no-pie"
make && make install
```

# clamav
### [install instructions](https://www.clamav.net/documents/installation-on-debian-and-ubuntu-linux-distributions)
```
mkdir /home/xgzhu/apps/srcbuilds/clamav
tar -xzf clamav-0.102.1.tar.gz
cd clamav-0.102.1
### --with-pic=non-PIC
./configure  --enable-static --enable-check --with-libjson-static=/downloads/libjson-c/build/libjson-c.a --prefix=/home/xgzhu/apps/srcbuilds/clamav CC=gcc CXX=g++ CFLAGS="-g" CXXFLAGS="-g"
make -j4 
make install
cp /home/xgzhu/apps/srcbuilds/clamav/etc/freshclam.conf.sample /home/xgzhu/apps/srcbuilds/clamav/etc/freshclam.conf
### remove the Example line in freshclam.conf so freshclam can use the config.
mkdir /home/xgzhu/apps/srcbuilds/clamav/share/clamav
groupadd clamav
useradd -g clamav -s /bin/false -c "Clam Antivirus" clamav
chown -R clamav:clamav /home/xgzhu/apps/srcbuilds/clamav/share/clamav
getent group clamav
### downloads database
/home/xgzhu/apps/srcbuilds/clamav/bin/freshclam
### run scan: clamscan -i /path/to/dir


        requirements: 
        apt-get update
        apt-get install libssl-dev

        git clone https://github.com/json-c/json-c.git
        mkdir build
        cmake -DCMAKE_INSTALL_PREFIX=/downloads/libjson-c/build/ -DBUILD_SHARED_LIBS=OFF ../json-c/
        make && make install
```

# GraphicsMagick-1-3-26
```
mkdir /home/xgzhu/apps/srcbuilds/GraphicsMagick-1-3-26
tar -xzf GraphicsMagick-1.3.26.tar.gz
cd GraphicsMagick-1.3.26
./configure --disable-shared --prefix=/home/xgzhu/apps/srcbuilds/GraphicsMagick-1-3-26 CC=gcc CXX=g++ CFLAGS="-g -no-pie" CXXFLAGS="-g -no-pie" 
make && make install
```

# GraphicsMagick-1.3.34
```
mkdir /home/xgzhu/apps/srcbuilds/GraphicsMagick
sudo apt-get install libtiff-dev
apt-get install lzip
tar --lzip -xf GraphicsMagick-1.3.34.tar.lz
cd GraphicsMagick-1.3.34
./configure --disable-shared --prefix=/home/xgzhu/apps/srcbuilds/GraphicsMagick CC=gcc CXX=g++ CFLAGS="-g -no-pie" CXXFLAGS="-g -no-pie"
make && make install
```

# jasper
[install instruction](http://www.linuxfromscratch.org/blfs/view/8.1/general/jasper.html)
```
mkdir /home/xgzhu/apps/srcbuilds/jasper
tar -xzf jasper-2.0.12.tar.gz
mkdir buildjasper
cd buildjasper
### -DCMAKE_BUILD_TYPE=Release
### SET ( CMAKE_CXX_FLAGS "-g -no-pie" CACHE STRING "compile flags" FORCE)
### SET ( CMAKE_C_FLAGS "-g -no-pie" CACHE STRING "compile flags" FORCE)
### in CMakeLists.txt
cmake -G "Unix Makefiles" -H"/downloads/becsource/jasper/jasper-2.0.12" -B"/downloads/becsource/jasper/buildjasper"  -DCMAKE_INSTALL_PREFIX="/home/xgzhu/apps/srcbuilds/jasper" -DJAS_ENABLE_SHARED=false
make clean all
make test
make install
```

# libav
```
mkdir /home/xgzhu/apps/srcbuilds/libav
tar -xzf libav-12.3.tar.gz
cd libav-12.3
### --disable-shared --enable-static
./configure --prefix=/home/xgzhu/apps/srcbuilds/libav cc=gcc --extra-cflags="-g -no-pie"
make && make install
```

# libdwarf
```
mkdir /home/xgzhu/apps/srcbuilds/libdwarf
tar -xzf libdwarf-20191104.tar.gz
cd libdwarf-20191104
./configure --enable-silent-rules --prefix=/home/xgzhu/apps/srcbuilds/libdwarf CC=gcc CXX=g++ CFLAGS="-g -no-pie" CXXFLAGS="-g -no-pie"
make && make install
```

# exiv2
```
wget https://github.com/Exiv2/exiv2/archive/0.27.1.zip
mkdir /home/xgzhu/apps/srcbuilds/exiv2
unzip exiv2-0.27.1.zip
# in CMakeLists.txt: SET ( CMAKE_CXX_FLAGS "-g -no-pie" CACHE STRING "compile flags" FORCE)
#                     SET ( CMAKE_C_FLAGS "-g -no-pie" CACHE STRING "compile flags" FORCE)
# ; -DBUILD_SHARED_LIBS=OFF -DEXIV2_ENABLE_NLS=OFF  -DCMAKE_BUILD_TYPE=Debug
mkdir buildexiv271
cd buildexiv271
cmake /downloads/becsource/exiv2/exiv2-0.27.1  -DCMAKE_INSTALL_PREFIX="/home/xgzhu/apps/srcbuilds/exiv271" -DBUILD_SHARED_LIBS=OFF
cmake --build .
make tests
make install
```

# libgxps  - skip, requirements error
```
tar -xJf libgxps-0.2.5-x86_64-1gds.txz
```

# liblouis
```
mkdir /home/xgzhu/apps/srcbuilds/liblouis
tar -xzf liblouis-3.2.0.tar.gz
cd liblouis-3.2.0
./autogen.sh
./configure --enable-static --prefix=/home/xgzhu/apps/srcbuilds/liblouis --with-pic=non-PIC CC=gcc CXX=g++ CFLAGS="-g -no-pie" CXXFLAGS="-g -no-pie"
make && make install
```


# libming
```
mkdir /home/xgzhu/apps/srcbuilds/libming
unzip libming-ming-0_4_8.zip
cd libming-ming-0_4_8
sudo apt-get install flex
sh autogen.sh
./configure --enable-shared=no --prefix=/home/xgzhu/apps/srcbuilds/libming CC=gcc CXX=g++ CFLAGS="-g -no-pie" CXXFLAGS="-g -no-pie"
make && make install
```

# libmpg123
```
mkdir /home/xgzhu/apps/srcbuilds/libmpg123
tar -xjf mpg123-1.25.0.tar.bz2
cd mpg123-1.25.0
###--with-pic=non-PIC
./configure --enable-static --prefix=/home/xgzhu/apps/srcbuilds/libmpg123 CC=gcc CFLAGS="-g -no-pie" CXXFLAGS="-g -no-pie"
make && make install
```

# ncurses
```
mkdir /home/xgzhu/apps/srcbuilds/libncurses
gzip -dc ncurses-6.0.tar.gz | tar -xzf -
cd ncurses-6.0
./configure --with-normal --prefix=/home/xgzhu/apps/srcbuilds/libncurses CC=gcc CXX=g++ CFLAGS="-g -no-pie" CXXFLAGS="-g -no-pie" CPPFLAGS="-P"
make && make install
```

# pspp
```
mkdir /home/xgzhu/apps/srcbuilds/libpspp
sudo apt-get install libgsl-dev
sudo apt-get install libxml2-dev
tar -xzf pspp-1.2.0.tar.gz
cd pspp-1.2.0
./configure --enable-static --enable-relocatable --with-pic=non-PIC --without-gui --prefix=/home/xgzhu/apps/srcbuilds/libpspp CC=gcc CXX=g++ CFLAGS="-g -no-pie" CXXFLAGS="-g -no-pie"
make && make install
```


# libRaw -make error
```
mkdir /home/xgzhu/apps/srcbuilds/libraw
tar -xzf LibRaw-0.18.2.tar.gz
cd LibRaw-0.18.2
autoreconf --force --install
./configure --with-pic=non-PIC --enable-static --prefix=/home/xgzhu/apps/srcbuilds/libraw CC=gcc CFLAGS="-g -no-pie" CXX=g++ CXXFLAGS="-g -no-pie"
make && make install
```


# libsass

    sassc: 3.6.1-8-g3e73
    libsass: 3.6.3-40-gf674
    sass2scss: 1.1.1
    sass: 3.5
```
mkdir /home/xgzhu/apps/srcbuilds/libsass
tar -xzf libsass-3.5.0.tar.gz
cd libsass-3.5.0
autoreconf --force --install
./configure --disable-shared --disable-tests --prefix=/home/xgzhu/apps/srcbuilds/libsass 
make -j4
make -j4 install

mkdir /home/xgzhu/apps/srcbuilds/sassc
git clone https://github.com/sass/sassc.git
cd sassc
autoreconf --force --install
./configure --prefix=/home/xgzhu/apps/srcbuilds/sassc --with-libsass=/home/xgzhu/apps/srcbuilds/libsass CC=gcc CXX=g++  CFLAGS="-g -no-pie" CXXFLAGS="-g -no-pie"
make -j4
make install
```


# libtasn1
```
mkdir /home/xgzhu/apps/srcbuilds/libtasn1
tar -xzf libtasn1-4.12.tar.gz
cd libtasn1-4.12
./configure --with-pic=non-PIC --enable-static --prefix=/home/xgzhu/apps/srcbuilds/libtasn1 CC=gcc CFLAGS="-g -no-pie" CXX=g++ CXXFLAGS="-g -no-pie"
make && make install
```

# tiff
```
mkdir /home/xgzhu/apps/srcbuilds/libtiff
unzip tiff-4.0.8.zip
cd tiff-4.0.8
./configure --disable-shared --prefix=/home/xgzhu/apps/srcbuilds/libtiff CC=gcc CXX=g++  CFLAGS="-g -no-pie" CXXFLAGS="-g -no-pie"
make && make install
```

# libtorrent
```
mkdir /home/xgzhu/apps/srcbuilds/libtorrent
tar -xzf libtorrent-rasterbar-1.1.11.tar.gz
cd libtorrent-rasterbar-1.1.11
./configure --disable-shared --prefix=/home/xgzhu/apps/srcbuilds/libtorrent CC=gcc CXX=g++ CFLAGS="-g -no-pie" CXXFLAGS="-g -no-pie"
make && make install
```

# nasm
```
mkdir /home/xgzhu/apps/srcbuilds/nasm
tar -xzf nasm-2.14.tar.gz
cd nasm-2.14
./configure --prefix=/home/xgzhu/apps/srcbuilds/nasm CC=gcc CFLAGS="-g -no-pie" CXX=g++ CXXFLAGS="-g -no-pie"
make && make install
```

# tcpdump - have had one


# vim
```
mkdir /home/xgzhu/apps/srcbuilds/vim
tar -xjf vim-8.0.tar.bz2
cd vim80
./configure --prefix=/home/xgzhu/apps/srcbuilds/vim CC=gcc CFLAGS="-g -no-pie"
make && make install
```


# poppler
```
mkdir /home/xgzhu/apps/srcbuilds/poppler
sudo apt-get install libfontconfig1-dev
sudo apt-get install libjpeg-dev
tar -xzf poppler-0.22.5.tar.gz
cd poppler-0.22.5
./configure --prefix=/home/xgzhu/apps/srcbuilds/poppler  --disable-shared CFLAGS="-Wall -g -no-pie" CXXFLAGS="-Wall -Woverloaded-virtual -Wnon-virtual-dtor -Wcast-align -fno-exceptions -fno-check-new -fno-common -g -ansi -no-pie"
make all
make install
```




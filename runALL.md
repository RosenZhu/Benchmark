# fuzzing
afl-fuzz -i seed_dir -o out_dir -t 500 ... 

## audiofile/sfconvert: 
-- ./audiofile-0.2.7/sfcommands/sfconvert @@ out.mp3 format aiff

## binutils/readelf
-- ./binutils-2.30/binutils/readelf -a @@

## binutils/objdump
-- objdump -d @@

## binutils/nm
-- nm -n @@

## cjson/cjson
-x json.dict  -- ./cjson-1.7.7/fuzzing/cjson @@

## libarchive/bsdtar
-- ./libarchive-3.3.2/bsdtar -O -xf @@

## libjpeg/djpeg
-- ./jpeg-9c/djpeg @@

## libksba/cert-basic
-- ./libksba-1.3.5/tests/cert-basic @@

## poppler/pdftohtml
-x pdf.dict -- ./poppler-0.22.5/utils/pdftohtml @@

## tcpdump/tcpdump
-- ./tcpdump-4.9.2/tcpdump -nr @@

## lava/base64
-- ./lava_bins/base64 -d @@

## lava/md5sum
-- ./lava_bins/md5sum @@

## lava/uniq
-- ./lava_bins/uniq

## lava/who
-- ./lava_bins/who @@

## graphicsMagick/gm
-- gm convert -page A4+0+0 @@  */out_dir/out.ps

## bison/bison
-- bison -vdty @@

## catdoc/catdoc
-- catdoc -a @@

## cflow/cflow
-- cflow -T @@

## clamscan
-- clamscan -i @@

## exiv2
-- exiv2 -pt @@

## jasper
./jasper -f @@ -T bmp -F out.bmp

## avconv
./avconv -i @@ -r 24 out.avi

## libdwarf
./dwarfdump -a @@

## liblouis
./lou_translate -f unicode.dis,en-us-g2.ctb < @@

## libming
./listswf -v @@

## libmpg123
## -s: output to stdout; -t: test mode, no output
[instruction](http://manpages.ubuntu.com/manpages/bionic/zh_TW/man1/mpg123.1.html)

./mpg123 -s @@

## libncurses - too complex
[instruction](https://www.gnu.org/software/ncurses/)

## libsass + sassc
./sassc @@ > output.css

## libtasn1
[instruction](https://gnutls.gitlab.io/libtasn1/libtasn1.html#Utilities)

./asn1Parser -o out -n arr @@

## libtiff/tiff2pdf
./tiff2pdf -o out.pdf @@

## libtiff/tiff2ps
./tiff2ps -1 -O out.ps @@

## libtorrent -- need program to call API
[run libFuzzer](https://www.libtorrent.org/fuzzing.html)

## nasm
./nasm -f elf64 -l out.lst -o out.o @@

## pspp
[instruction](https://manpages.ubuntu.com/manpages/disco/man1/pspp.1.html)

./pspp @@

## vim
[parameters](https://linux.die.net/man/1/rvim)

takes an input regexp to fuzz vim regexp engine

./vim -u NONE -X -Z -e -s -c 'call search(getline("."))' -c ':qa!' @@









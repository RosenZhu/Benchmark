#!/bin/bash


target_dir=/apps/target-bins
fuzz_time=24h
timeout=1000

# run fuzzing
#  

for N in 1 2 3 4 5 6 7
do
    exp_out=/mnt/expmt${N}
    mkdir ${exp_out}
    chmod 777 -R ${exp_out}
    # 1 sfconvert
    sfconvert_bin=${target_dir}/audiofile/sfconvert
    sfconvert_seeds=${target_dir}/audiofile/seed_dir
    sfconvert_out=${exp_out}/sfconvert
    sfconvert_param="@@ ${exp_out}/sfconvertout.mp3 format aiff"
    sfconvert_version=64

    # 2 readelf
    readelf_bin=${target_dir}/readelf/readelf
    readelf_seeds=${target_dir}/readelf/seed_dir
    readelf_param="-a @@"
    readelf_out=${exp_out}/readelf
    readelf_version=64

    # 3 objdump
    objdump_bin=${target_dir}/objdump/objdump
    objdump_param="-d @@"
    objdump_seeds=${target_dir}/objdump/seed_dir
    objdump_out=${exp_out}/objdump
    objdump_version=64

    # 4 nm --uncondjump instrument error
    nm_bin=${target_dir}/nm/nm
    nm_param="-n @@"
    nm_seeds=${target_dir}/nm/seed_dir
    nm_out=${exp_out}/nm
    nm_version=64


    # 5 bsdtar
    bsdtar_bin=${target_dir}/libarchive/bsdtar
    bsdtar_param="-O -xf @@"
    bsdtar_seeds=${target_dir}/libarchive/seed_dir
    bsdtar_out=${exp_out}/bsdtar
    bsdtar_version=64

    # 6 djpeg
    djpeg_bin=${target_dir}/libjpeg/djpeg
    djpeg_param="@@"
    djpeg_seeds=${target_dir}/libjpeg/seed_dir
    djpeg_out=${exp_out}/djpeg
    djpeg_version=64

    # 7 cert-basic
    cert_bin=${target_dir}/libksba/cert-basic
    cert_param="@@"
    cert_seeds=${target_dir}/libksba/seed_dir
    cert_out=${exp_out}/cert-basic
    cert_version=64


    # 8 tcpdump
    tcpdump_bin=${target_dir}/tcpdump/tcpdump
    tcpdump_param="-nr @@"
    tcpdump_seeds=${target_dir}/tcpdump/seed_dir
    tcpdump_out=${exp_out}/tcpdump
    tcpdump_version=64

    # 9 lava/base64
    base64_bin=${target_dir}/lava_base64/base64
    base64_param="-d @@"
    base64_seeds=${target_dir}/lava_base64/seed_dir
    base64_out=${exp_out}/base64
    base64_version=64

    # 10 lave/md5sum
    md5sum_bin=${target_dir}/lava_md5sum/md5sum
    md5sum_param="@@"
    md5sum_seeds=${target_dir}/lava_md5sum/seed_dir
    md5sum_out=${exp_out}/md5sum
    md5sum_version=64

    # 11 lava/uniq
    uniq_bin=${target_dir}/lava_uniq/uniq
    uniq_param="@@"
    uniq_seeds=${target_dir}/lava_uniq/seed_dir
    uniq_out=${exp_out}/uniq
    uniq_version=64

    # 12 lava/who
    who_bin=${target_dir}/lava_who/who
    who_param="@@"
    who_seeds=${target_dir}/lava_who/seed_dir
    who_out=${exp_out}/who
    who_version=64

    # 13 graphicsMagick/gm
    gm_bin=${target_dir}/graphicsMagick/gm
    gm_seeds=${target_dir}/graphicsMagick/seed_dir
    gm_out=${exp_out}/gm
    gm_param="convert -page A4+0+0 @@ ${exp_out}/gmout.ps"
    gm_version=128


    # 14 bison
    bison_bin=${target_dir}/bison/bison
    bison_seeds=${target_dir}/bison/seed_dir
    bison_out=${exp_out}/bison
    bison_param="-vdty -b ${exp_out}/ @@"
    bison_version=64



    # 16 cflow
    cflow_bin=${target_dir}/cflow/cflow
    cflow_seeds=${target_dir}/cflow/seed_dir
    cflow_out=${exp_out}/cflow
    cflow_param="-T @@"
    cflow_version=64

 

    # 18 exiv2
    exiv2_bin=${target_dir}/exiv2/exiv2
    exiv2_seeds=${target_dir}/exiv2/seed_dir
    exiv2_out=${exp_out}/exiv2
    exiv2_param="-pt @@"
    exiv2_version=64



    # 21 libdwarf/dwarfdump 
    dwarfdump_bin=${target_dir}/libdwarf/dwarfdump
    dwarfdump_seeds=${target_dir}/libdwarf/seed_dir
    dwarfdump_out=${exp_out}/dwarfdump
    dwarfdump_param="-a @@"
    dwarfdump_version=64

    # 22 liblouis/lou_translate
    lou_translate_bin=${target_dir}/liblouis/lou_translate
    lou_translate_seeds=${target_dir}/liblouis/seed_dir
    lou_translate_out=${exp_out}/lou_translate
    lou_translate_param="-f unicode.dis,en-us-g2.ctb @@"
    lou_translate_version=64

    # 23 libming/listswf
    listswf_bin=${target_dir}/libming/listswf
    listswf_seeds=${target_dir}/libming/seed_dir
    listswf_out=${exp_out}/listswf
    listswf_param="-v @@"
    listswf_version=64

    # 24 libmpg123/mpg123
    mpg123_bin=${target_dir}/libmpg123/mpg123
    mpg123_seeds=${target_dir}/libmpg123/seed_dir
    mpg123_out=${exp_out}/mpg123
    mpg123_param="-s @@"
    mpg123_version=64

    # 25 sassc
    sassc_bin=${target_dir}/sassc/sassc
    sassc_seeds=${target_dir}/sassc/seed_dir
    sassc_out=${exp_out}/sassc
    sassc_param="@@ > ${exp_out}/sasscout.css"  
    sassc_version=64


    # 26 libtasn1/asn1Parser
    asn1Parser_bin=${target_dir}/libtasn1/asn1Parser
    asn1Parser_seeds=${target_dir}/libtasn1/seed_dir
    asn1Parser_out=${exp_out}/asn1Parser
    asn1Parser_param="-o ${exp_out}/asn1out -n arr @@"
    asn1Parser_version=64


    # 27 tiff2pdf
    tiff2pdf_bin=${target_dir}/tiff2pdf/tiff2pdf
    tiff2pdf_seeds=${target_dir}/tiff2pdf/seed_dir
    tiff2pdf_out=${exp_out}/tiff2pdf
    tiff2pdf_param="-o ${exp_out}/tiffpdfout.pdf @@"
    tiff2pdf_version=64

    # 28 tiff2ps
    tiff2ps_bin=${target_dir}/tiff2ps/tiff2ps
    tiff2ps_seeds=${target_dir}/tiff2ps/seed_dir
    tiff2ps_out=${exp_out}/tiff2ps
    tiff2ps_param="-1 -O ${exp_out}/tiffpsout.ps @@"
    tiff2ps_version=64


    # 29 nasm
    nasm_bin=${target_dir}/nasm/nasm
    nasm_seeds=${target_dir}/nasm/seed_dir
    nasm_out=${exp_out}/nasm
    nasm_param="-f elf64 -l ${exp_out}/nasmout.lst -o ${exp_out}/nasmout.o @@"
    nasm_version=64


    # 30 pspp
    pspp_bin=${target_dir}/pspp/pspp
    pspp_seeds=${target_dir}/pspp/seed_dir
    pspp_out=${exp_out}/pspp
    pspp_param="@@"
    pspp_version=64



    # with dictionary
    # 32 cjson
    cjson_bin=${target_dir}/cjson/cjson
    cjson_param="@@"
    cjson_seeds=${target_dir}/cjson/seed_dir
    cjson_out=${exp_out}/cjson
    cjson_dict="${target_dir}/cjson/json.dict"
    cjson_version=64

    # 33 pdftohtml
    pdftohtml_bin=${target_dir}/poppler/pdftohtml
    pdftohtml_param="@@"
    pdftohtml_seeds=${target_dir}/poppler/seed_dir
    pdftohtml_out=${exp_out}/pdftohtml
    pdftohtml_dict="${target_dir}/poppler/pdf.dict"
    pdftohtml_version=64



    COMMDS=('/apps/becfuzz ./runBecfuzzinst.sh ./runbecNoDict.sh'
            '/apps/becfast ./runBecfastinst.sh ./runfastNoDict.sh'
            '/apps/collafl-dyninst ./runcollinst.sh ./runcollNoDict.sh'
            '/apps/afl ./runAFLinstrument.sh ./runAflNoDict.sh'
            '/apps/aflfast ./runAFLfastinst.sh ./runAflfastNoDict.sh')

    # COMMDS=('/apps/becfuzz ./runbecNoDict.sh')

    ############# first run #####################
    # nodict: without dictionary

    ########### instrumentation
    for fc in "${COMMDS[@]}"
    do
        cmd=($fc)

        (
        cd ${cmd[0]}
        ${cmd[1]} ${objdump_out}$N $objdump_seeds $objdump_bin $objdump_version $fuzz_time "nodict" $timeout $objdump_param
        # objdump_size=$(stat -c%s "$objdump_bin")
        # echo "size of $objdump_bin = $objdump_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[1]} ${nm_out}$N $nm_seeds $nm_bin $nm_version $fuzz_time "nodict" $timeout $nm_param
        # nm_size=$(stat -c%s "$nm_bin")
        # echo "size of $nm_bin = $nm_size bytes"
        )& 
        (
        cd ${cmd[0]}
        ${cmd[1]} ${tcpdump_out}$N $tcpdump_seeds $tcpdump_bin $tcpdump_version $fuzz_time "nodict" $timeout $tcpdump_param
        # tcpdump_size=$(stat -c%s "$tcpdump_bin")
        # echo "size of $tcpdump_bin = $tcpdump_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[1]} ${readelf_out}$N $readelf_seeds $readelf_bin $readelf_version $fuzz_time "nodict" $timeout $readelf_param
        # readelf_size=$(stat -c%s "$readelf_bin")
        # echo "size of $readelf_bin = $readelf_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[1]} ${bsdtar_out}$N $bsdtar_seeds $bsdtar_bin $bsdtar_version $fuzz_time "nodict" $timeout $bsdtar_param
        # bsdtar_size=$(stat -c%s "$bsdtar_bin")
        # echo "size of $bsdtar_bin = $bsdtar_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[1]} ${gm_out}$N $gm_seeds $gm_bin $gm_version $fuzz_time "nodict" $timeout $gm_param
        # gm_size=$(stat -c%s "$gm_bin")
        # echo "size of $gm_bin = $gm_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[1]} ${exiv2_out}$N $exiv2_seeds $exiv2_bin $exiv2_version $fuzz_time "nodict" $timeout $exiv2_param
        # exiv2_size=$(stat -c%s "$exiv2_bin")
        # echo "size of $exiv2_bin = $exiv2_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[1]} ${dwarfdump_out}$N $dwarfdump_seeds $dwarfdump_bin $dwarfdump_version $fuzz_time "nodict" $timeout $dwarfdump_param
        # dwarfdump_size=$(stat -c%s "$dwarfdump_bin")
        # echo "size of $dwarfdump_bin = $dwarfdump_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[1]} ${sassc_out}$N $sassc_seeds $sassc_bin $sassc_version $fuzz_time "nodict" $timeout $sassc_param
        # sassc_size=$(stat -c%s "$sassc_bin")
        # echo "size of $sassc_bin = $sassc_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[1]} ${tiff2pdf_out}$N $tiff2pdf_seeds $tiff2pdf_bin $tiff2pdf_version $fuzz_time "nodict" $timeout $tiff2pdf_param
        # tiff2pdf_size=$(stat -c%s "$tiff2pdf_bin")
        # echo "size of $tiff2pdf_bin = $tiff2pdf_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[1]} ${nasm_out}$N $nasm_seeds $nasm_bin $nasm_version $fuzz_time "nodict" $timeout $nasm_param
        # nasm_size=$(stat -c%s "$nasm_bin")
        # echo "size of $nasm_bin = $nasm_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[1]} ${pdftohtml_out}$N $pdftohtml_seeds $pdftohtml_bin $pdftohtml_version $fuzz_time $pdftohtml_dict $timeout $pdftohtml_param
        # pdftohtml_size=$(stat -c%s "$pdftohtml_bin")
        # echo "size of $pdftohtml_bin = $pdftohtml_size bytes"
        )&
        
    done
    wait
    echo " first run instruemnt done."

    ################# run fuzzing
    for fc in "${COMMDS[@]}"
    do
        cmd=($fc)

        (
        cd ${cmd[0]}
        ${cmd[2]} ${objdump_out}$N $objdump_seeds $objdump_bin $objdump_version $fuzz_time "nodict" $timeout $objdump_param
        # objdump_size=$(stat -c%s "$objdump_bin")
        # echo "size of $objdump_bin = $objdump_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[2]} ${nm_out}$N $nm_seeds $nm_bin $nm_version $fuzz_time "nodict" $timeout $nm_param
        # nm_size=$(stat -c%s "$nm_bin")
        # echo "size of $nm_bin = $nm_size bytes"
        )& 
        (
        cd ${cmd[0]}
        ${cmd[2]} ${tcpdump_out}$N $tcpdump_seeds $tcpdump_bin $tcpdump_version $fuzz_time "nodict" $timeout $tcpdump_param
        # tcpdump_size=$(stat -c%s "$tcpdump_bin")
        # echo "size of $tcpdump_bin = $tcpdump_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[2]} ${readelf_out}$N $readelf_seeds $readelf_bin $readelf_version $fuzz_time "nodict" $timeout $readelf_param
        # readelf_size=$(stat -c%s "$readelf_bin")
        # echo "size of $readelf_bin = $readelf_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[2]} ${bsdtar_out}$N $bsdtar_seeds $bsdtar_bin $bsdtar_version $fuzz_time "nodict" $timeout $bsdtar_param
        # bsdtar_size=$(stat -c%s "$bsdtar_bin")
        # echo "size of $bsdtar_bin = $bsdtar_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[2]} ${gm_out}$N $gm_seeds $gm_bin $gm_version $fuzz_time "nodict" $timeout $gm_param
        # gm_size=$(stat -c%s "$gm_bin")
        # echo "size of $gm_bin = $gm_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[2]} ${exiv2_out}$N $exiv2_seeds $exiv2_bin $exiv2_version $fuzz_time "nodict" $timeout $exiv2_param
        # exiv2_size=$(stat -c%s "$exiv2_bin")
        # echo "size of $exiv2_bin = $exiv2_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[2]} ${dwarfdump_out}$N $dwarfdump_seeds $dwarfdump_bin $dwarfdump_version $fuzz_time "nodict" $timeout $dwarfdump_param
        # dwarfdump_size=$(stat -c%s "$dwarfdump_bin")
        # echo "size of $dwarfdump_bin = $dwarfdump_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[2]} ${sassc_out}$N $sassc_seeds $sassc_bin $sassc_version $fuzz_time "nodict" $timeout $sassc_param
        # sassc_size=$(stat -c%s "$sassc_bin")
        # echo "size of $sassc_bin = $sassc_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[2]} ${tiff2pdf_out}$N $tiff2pdf_seeds $tiff2pdf_bin $tiff2pdf_version $fuzz_time "nodict" $timeout $tiff2pdf_param
        # tiff2pdf_size=$(stat -c%s "$tiff2pdf_bin")
        # echo "size of $tiff2pdf_bin = $tiff2pdf_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[2]} ${nasm_out}$N $nasm_seeds $nasm_bin $nasm_version $fuzz_time "nodict" $timeout $nasm_param
        # nasm_size=$(stat -c%s "$nasm_bin")
        # echo "size of $nasm_bin = $nasm_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[2]} ${pdftohtml_out}$N $pdftohtml_seeds $pdftohtml_bin $pdftohtml_version $fuzz_time $pdftohtml_dict $timeout $pdftohtml_param
        # pdftohtml_size=$(stat -c%s "$pdftohtml_bin")
        # echo "size of $pdftohtml_bin = $pdftohtml_size bytes"
        )&
        
    done
    wait

    echo "experiment 1-${N} complete."


    ################# second run ##########################
    ########### second run instrument
    for fcs in "${COMMDS[@]}"
    do
        cmd=($fcs)

        (
        cd ${cmd[0]}
        ${cmd[1]} ${sfconvert_out}$N $sfconvert_seeds $sfconvert_bin $sfconvert_version $fuzz_time  "nodict" $timeout $sfconvert_param
        # sfconvert_size=$(stat -c%s "$sfconvert_bin")
        # echo "size of $sfconvert_bin = $sfconvert_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[1]} ${djpeg_out}$N $djpeg_seeds $djpeg_bin $djpeg_version $fuzz_time "nodict" $timeout $djpeg_param
        # djpeg_size=$(stat -c%s "$djpeg_bin")
        # echo "size of $djpeg_bin = $djpeg_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[1]} ${cert_out}$N $cert_seeds $cert_bin $cert_version $fuzz_time "nodict" $timeout $cert_param
        # cert_size=$(stat -c%s "$cert_bin")
        # echo "size of $cert_bin = $cert_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[1]} ${bison_out}$N $bison_seeds $bison_bin $bison_version $fuzz_time "nodict" $timeout $bison_param
        # bison_size=$(stat -c%s "$bison_bin")
        # echo "size of $bison_bin = $bison_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[1]} ${cflow_out}$N $cflow_seeds $cflow_bin $cflow_version $fuzz_time "nodict" $timeout $cflow_param
        # cflow_size=$(stat -c%s "$cflow_bin")
        # echo "size of $cflow_bin = $cflow_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[1]} ${lou_translate_out}$N $lou_translate_seeds $lou_translate_bin $lou_translate_version $fuzz_time "nodict" $timeout $lou_translate_param
        # lou_translate_size=$(stat -c%s "$lou_translate_bin")
        # echo "size of $lou_translate_bin = $lou_translate_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[1]} ${listswf_out}$N $listswf_seeds $listswf_bin $listswf_version $fuzz_time "nodict" $timeout $listswf_param
        # listswf_size=$(stat -c%s "$listswf_bin")
        # echo "size of $listswf_bin = $listswf_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[1]} ${mpg123_out}$N $mpg123_seeds $mpg123_bin $mpg123_version $fuzz_time "nodict" $timeout $mpg123_param
        # mpg123_size=$(stat -c%s "$mpg123_bin")
        # echo "size of $mpg123_bin = $mpg123_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[1]} ${asn1Parser_out}$N $asn1Parser_seeds $asn1Parser_bin $asn1Parser_version $fuzz_time "nodict" $timeout $asn1Parser_param
        # asn1Parser_size=$(stat -c%s "$asn1Parser_bin")
        # echo "size of $asn1Parser_bin = $asn1Parser_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[1]} ${tiff2ps_out}$N $tiff2ps_seeds $tiff2ps_bin $tiff2ps_version $fuzz_time "nodict" $timeout $tiff2ps_param
        # tiff2ps_size=$(stat -c%s "$tiff2ps_bin")
        # echo "size of $tiff2ps_bin = $tiff2ps_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[1]} ${pspp_out}$N $pspp_seeds $pspp_bin $pspp_version $fuzz_time "nodict" $timeout $pspp_param
        # pspp_size=$(stat -c%s "$pspp_bin")
        # echo "size of $pspp_bin = $pspp_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[1]} ${cjson_out}$N $cjson_seeds $cjson_bin $cjson_version $fuzz_time $cjson_dict $timeout $cjson_param
        # cjson_size=$(stat -c%s "$cjson_bin")
        # echo "size of $cjson_bin = $cjson_size bytes"
        )&
    done
    wait
    echo "second instrumentation done."

    ########### second run fuzzing
    for fcs in "${COMMDS[@]}"
    do
        cmd=($fcs)

        (
        cd ${cmd[0]}
        ${cmd[2]} ${sfconvert_out}$N $sfconvert_seeds $sfconvert_bin $sfconvert_version $fuzz_time  "nodict" $timeout $sfconvert_param
        # sfconvert_size=$(stat -c%s "$sfconvert_bin")
        # echo "size of $sfconvert_bin = $sfconvert_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[2]} ${djpeg_out}$N $djpeg_seeds $djpeg_bin $djpeg_version $fuzz_time "nodict" $timeout $djpeg_param
        # djpeg_size=$(stat -c%s "$djpeg_bin")
        # echo "size of $djpeg_bin = $djpeg_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[2]} ${cert_out}$N $cert_seeds $cert_bin $cert_version $fuzz_time "nodict" $timeout $cert_param
        # cert_size=$(stat -c%s "$cert_bin")
        # echo "size of $cert_bin = $cert_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[2]} ${bison_out}$N $bison_seeds $bison_bin $bison_version $fuzz_time "nodict" $timeout $bison_param
        # bison_size=$(stat -c%s "$bison_bin")
        # echo "size of $bison_bin = $bison_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[2]} ${cflow_out}$N $cflow_seeds $cflow_bin $cflow_version $fuzz_time "nodict" $timeout $cflow_param
        # cflow_size=$(stat -c%s "$cflow_bin")
        # echo "size of $cflow_bin = $cflow_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[2]} ${lou_translate_out}$N $lou_translate_seeds $lou_translate_bin $lou_translate_version $fuzz_time "nodict" $timeout $lou_translate_param
        # lou_translate_size=$(stat -c%s "$lou_translate_bin")
        # echo "size of $lou_translate_bin = $lou_translate_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[2]} ${listswf_out}$N $listswf_seeds $listswf_bin $listswf_version $fuzz_time "nodict" $timeout $listswf_param
        # listswf_size=$(stat -c%s "$listswf_bin")
        # echo "size of $listswf_bin = $listswf_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[2]} ${mpg123_out}$N $mpg123_seeds $mpg123_bin $mpg123_version $fuzz_time "nodict" $timeout $mpg123_param
        # mpg123_size=$(stat -c%s "$mpg123_bin")
        # echo "size of $mpg123_bin = $mpg123_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[2]} ${asn1Parser_out}$N $asn1Parser_seeds $asn1Parser_bin $asn1Parser_version $fuzz_time "nodict" $timeout $asn1Parser_param
        # asn1Parser_size=$(stat -c%s "$asn1Parser_bin")
        # echo "size of $asn1Parser_bin = $asn1Parser_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[2]} ${tiff2ps_out}$N $tiff2ps_seeds $tiff2ps_bin $tiff2ps_version $fuzz_time "nodict" $timeout $tiff2ps_param
        # tiff2ps_size=$(stat -c%s "$tiff2ps_bin")
        # echo "size of $tiff2ps_bin = $tiff2ps_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[2]} ${pspp_out}$N $pspp_seeds $pspp_bin $pspp_version $fuzz_time "nodict" $timeout $pspp_param
        # pspp_size=$(stat -c%s "$pspp_bin")
        # echo "size of $pspp_bin = $pspp_size bytes"
        )&
        (
        cd ${cmd[0]}
        ${cmd[2]} ${cjson_out}$N $cjson_seeds $cjson_bin $cjson_version $fuzz_time $cjson_dict $timeout $cjson_param
        # cjson_size=$(stat -c%s "$cjson_bin")
        # echo "size of $cjson_bin = $cjson_size bytes"
        )&
    done
    wait

    echo "experiment 2-${N} complete."
done




######################  LAVA #########################

# (
# cd ${cmd[0]}
# ${cmd[1]} ${base64_out}$N $base64_seeds $base64_bin $base64_version $fuzz_time "nodict" $base64_param
# # base64_size=$(stat -c%s "$base64_bin")
# # echo "size of $base64_bin = $base64_size bytes"
# )&

# (
# cd ${cmd[0]}
# ${cmd[1]} ${who_out}$N $who_seeds $who_bin $who_version $fuzz_time "nodict" $who_param
# # who_size=$(stat -c%s "$who_bin")
# # echo "size of $who_bin = $who_size bytes"
# )&
# (
# cd ${cmd[0]}
# ${cmd[1]} ${uniq_out}$N $uniq_seeds $uniq_bin $uniq_version $fuzz_time "nodict" $uniq_param
# # uniq_size=$(stat -c%s "$uniq_bin")
# # echo "size of $uniq_bin = $uniq_size bytes"
# )&
# (
# cd ${cmd[0]}
# ${cmd[1]} ${md5sum_out}$N $md5sum_seeds $md5sum_bin $md5sum_version $fuzz_time "nodict" $md5sum_param
# # md5sum_size=$(stat -c%s "$md5sum_bin")
# # echo "size of $md5sum_bin = $md5sum_size bytes"
# )&






########################## with dictionary ######################








############################# with error   #########################


# 15 catdoc
# catdoc_bin=${target_dir}/catdoc/catdoc
# catdoc_param="-a @@"
# catdoc_seeds=${target_dir}/catdoc/seed_dir
# catdoc_out=${exp_out}/catdoc
# catdoc_version=64

# (
# cd ${cmd[0]}
# ${cmd[1]} ${catdoc_out}$N $catdoc_seeds $catdoc_bin $catdoc_version $fuzz_time $catdoc_param
# # catdoc_size=$(stat -c%s "$catdoc_bin")
# # echo "size of $catdoc_bin = $catdoc_size bytes"
# )&

#    # 17 clamav/clamscan 
#     clamscan_bin=${target_dir}/clamav/clamscan
#     clamscan_seeds=${target_dir}/clamav/seed_dir
#     clamscan_out=${exp_out}/clamscan
#     clamscan_param="-i @@"
#     clamscan_version=64

# (
# cd ${cmd[0]}
# ${cmd[1]} ${clamscan_out}$N $clamscan_seeds $clamscan_bin $clamscan_version $fuzz_time $clamscan_param
# # clamscan_size=$(stat -c%s "$clamscan_bin")
# # echo "size of $clamscan_bin = $clamscan_size bytes"
# )&

# # 19 jasper
# jasper_bin=${target_dir}/jasper/jasper
# jasper_seeds=${target_dir}/jasper/seed_dir
# jasper_out=${exp_out}/jasper
# jasper_param="-f @@ -T bmp -F ${jasper_out}${N}/out.bmp"
# jasper_version=64

# (
# cd ${cmd[0]}
# ${cmd[1]} ${jasper_out}$N $jasper_seeds $jasper_bin $jasper_version $fuzz_time $jasper_param
# # jasper_size=$(stat -c%s "$jasper_bin")
# # echo "size of $jasper_bin = $jasper_size bytes"
# )&

# # 20 avconv
# avconv_bin=${target_dir}/avconv/avconv
# avconv_seeds=${target_dir}/avconv/seed_dir
# avconv_out=${exp_out}/avconv
# avconv_param="-i @@ -r 24 ${avconv_out}${N}/out.avi"
# avconv_version=256

# (
# cd ${cmd[0]}
# ${cmd[1]} ${avconv_out}$N $avconv_seeds $avconv_bin $avconv_version $fuzz_time $avconv_param
# # avconv_size=$(stat -c%s "$avconv_bin")
# # echo "size of $avconv_bin = $avconv_size bytes"
# )&

# # 31 vim
# vim_bin=${target_dir}/vim/vim
# vim_seeds=${target_dir}/vim/seed_dir
# vim_out=${exp_out}/vim
# vim_param="-u NONE -X -Z -e -s -c 'call search(getline("."))' -c ':qa!' @@"
# vim_version=128

# (
# cd ${cmd[0]}
# ${cmd[1]} ${vim_out}$N $vim_seeds $vim_bin $vim_version $fuzz_time $vim_param
# # vim_size=$(stat -c%s "$vim_bin")
# # echo "size of $vim_bin = $vim_size bytes"
# )&


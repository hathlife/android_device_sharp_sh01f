#!/bin/sh

export FP=$(cd ${0%/*} && pwd -P)
export VENDOR=$(basename $(dirname $FP))
export DEVICE=$(basename $FP)
export BOARDCONFIGVENDOR=true

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary

mkdir -p $BASE

echo "Pulling device files..."
for FILE in `cat proprietary-files.txt | grep -v ^# | grep -v ^$`; do
    DIR=`dirname $FILE`
    if [ ! -d $BASE/$DIR ]; then
        mkdir -p $BASE/$DIR
    fi
    adb pull /system/$FILE $BASE/$FILE.orig

    sed -e 's#/system/bin/linker#/vendor/bin/linker#g; s#LD_LIBRARY_PATH#VENDOR_LIB_PATH#g' $BASE/$FILE.orig > $BASE/$FILE
    touch -r $BASE/$FILE.orig $BASE/$FILE
    rm $BASE/$FILE.orig
done

chmod 755 $BASE/bin/*


./setup-makefiles.sh

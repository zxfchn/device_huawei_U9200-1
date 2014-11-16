#!/bin/sh
#
# applypatch.sh
# apply patches
#

dir=`cd $(dirname $0) && pwd`
top=$dir/../../../..

for patch in `ls $dir/*.patch` ; do
	echo ""
	echo "==> patch file: ${patch##*/}"
	patch -p1 -N -i $patch -r - -d $top
done

find . -name "*.orig" -delete

linarover=4.8

echo ""
echo "Проверяем наличие Linaro toolchain"
if ! [ -d $top/prebuilts/gcc/linux-x86/arm/linaro-$linarover ] ; then
    echo "Linaro нету. Делаем ссылки..."
    ln -s ../../../../../../linaro-$linarover $top/prebuilts/gcc/linux-x86/arm/linaro-$linarover
fi

echo ""

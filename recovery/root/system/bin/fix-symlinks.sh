#!/system/bin/sh

PATH=/system/bin:/system/xbin

PROTECTED="lk tee1 tee2"

for byname in /dev/block/by-name /dev/block/platform/*/by-name /dev/block/platform/*/*/by-name; do
    [ -d "${byname}" ] || continue

    for part in ${PROTECTED}; do
        [ -e ${byname}/${part} ] || continue
        [ -e ${byname}/${part}_real ] && continue

        real=$(readlink -f ${byname}/${part})
        [ -n "${real}" ] || continue

        rm -f ${byname}/${part}
        ln -s "${real}" ${byname}/${part}_real
        ln -s /dev/null ${byname}/${part}
    done
done

if [ -e /dev/block/mmcblk0boot0 ] && [ ! -e /dev/block/mmcblk0boot0_real ]; then
    mv /dev/block/mmcblk0boot0 /dev/block/mmcblk0boot0_real
    ln -s /dev/null /dev/block/mmcblk0boot0
fi

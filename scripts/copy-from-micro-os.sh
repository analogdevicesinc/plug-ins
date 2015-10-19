#! /bin/bash

# This script must be executed in the scripts folder, paths are relative to it.
# $ cd .../gnuarmeclipse-se-git/scripts
# $ bash copy-from-micro-os.sh

src=../../../uOS/micro-os-plus-iii.git/packages

# -----------------------------------------------------------------------------

system=../ilg.gnuarmeclipse.templates.core/templates/common/system

rm -rf $system

for i in 'arm' 'cmsis' 'cortexm' 'diag'
do
    mkdir -p $system/include/$i
done

echo
cp -nv $src/architectures/arm/arm.pack/include/arm/semihosting.h $system/include/arm

# cp -n $src/architectures/arm/cortexm.pack/include/cmsis/*.h $system/include/cmsis
# cp -n $src/architectures/arm/cortexm.pack/include/cmsis/README*.txt $system/include/cmsis

cp -nv $src/architectures/arm/cortexm.pack/include/cortexm/ExceptionHandlers.h $system/include/cortexm

cp -nv $src/portable/diag.pack/include/diag/Trace.h $system/include/diag

for i in 'cortexm' 'diag' 'newlib'
do
    mkdir -p $system/src/$i
done

echo
cp -nv $src/architectures/arm/cortexm.pack/src/cortexm/*.c* $system/src/cortexm

cp -nv $src/portable/diag.pack/src/diag/*.c* $system/src/diag
cp -nv $src/architectures/arm/cortexm.pack/src/diag/*.c* $system/src/diag

cp -nv $src/portable/newlib.pack/src/newlib/*.c* $system/src/newlib
cp -nv $src/portable/newlib.pack/src/newlib/README.txt $system/src/newlib

# _write.c moved from system to application
cp -nv $src/architectures/arm/cortexm.pack/src/newlib/_write.c $system/src

# -----------------------------------------------------------------------------

lds=../ilg.gnuarmeclipse.templates.core/templates/common/ldscripts

# link scripts
rm -rf $lds
mkdir -p $lds

cp -nv $src/architectures/arm/cortexm.pack/ldscripts/*.ld $lds

# -----------------------------------------------------------------------------

stm=../ilg.gnuarmeclipse.templates.stm/templates/micro-os-plus

# stm32f0 cmsis
echo
rm -rf $stm/stm32f0.pack
mkdir -p $stm/stm32f0.pack/include/cmsis
cp -Rnv $src/vendors/stm/stm32f0.pack/include/cmsis/* $stm/stm32f0.pack/include/cmsis
mkdir -p $stm/stm32f0.pack/src/cmsis
cp -Rnv $src/vendors/stm/stm32f0.pack/src/cmsis/* $stm/stm32f0.pack/src/cmsis

# stm32f0 stdPeriph drivers
echo
rm -rf $stm/stm32f0-stdperiph.pack
mkdir -p $stm/stm32f0-stdperiph.pack
cp -Rnv $src/vendors/stm/stm32f0-stdperiph.pack/* $stm/stm32f0-stdperiph.pack


# stm32f1 cmsis
echo
rm -rf $stm/stm32f1.pack
mkdir -p $stm/stm32f1.pack/include/cmsis
cp -Rnv $src/vendors/stm/stm32f1.pack/include/cmsis/* $stm/stm32f1.pack/include/cmsis
mkdir -p $stm/stm32f1.pack/src/cmsis
cp -Rnv $src/vendors/stm/stm32f1.pack/src/cmsis/* $stm/stm32f1.pack/src/cmsis

# stm32f1 stdPeriph drivers
echo
rm -rf $stm/stm32f1-stdperiph.pack
mkdir -p $stm/stm32f1-stdperiph.pack
cp -Rnv $src/vendors/stm/stm32f1-stdperiph.pack/* $stm/stm32f1-stdperiph.pack


# stm32f2 cmsis
echo
rm -rf $stm/stm32f2.pack
mkdir -p $stm/stm32f2.pack/include/cmsis
cp -Rnv $src/vendors/stm/stm32f2.pack/include/cmsis/* $stm/stm32f2.pack/include/cmsis
mkdir -p $stm/stm32f2.pack/src/cmsis
cp -Rnv $src/vendors/stm/stm32f2.pack/src/cmsis/* $stm/stm32f2.pack/src/cmsis

# stm32f2 stdPeriph drivers
echo
rm -rf $stm/stm32f2-stdperiph.pack
mkdir -p $stm/stm32f2-stdperiph.pack
cp -Rnv $src/vendors/stm/stm32f2-stdperiph.pack/* $stm/stm32f2-stdperiph.pack


# stm32f3 cmsis
echo
rm -rf $stm/stm32f3.pack
mkdir -p $stm/stm32f3.pack/include/cmsis
cp -Rnv $src/vendors/stm/stm32f3.pack/include/cmsis/* $stm/stm32f3.pack/include/cmsis
mkdir -p $stm/stm32f3.pack/src/cmsis
cp -Rnv $src/vendors/stm/stm32f3.pack/src/cmsis/* $stm/stm32f3.pack/src/cmsis

# stm32f3 stdPeriph drivers
echo
rm -rf $stm/stm32f3-stdperiph.pack
mkdir -p $stm/stm32f3-stdperiph.pack
cp -Rnv $src/vendors/stm/stm32f3-stdperiph.pack/* $stm/stm32f3-stdperiph.pack


# stm32f4 cmsis
echo
rm -rf $stm/stm32f4.pack
mkdir -p $stm/stm32f4.pack/include/cmsis
cp -Rnv $src/vendors/stm/stm32f4.pack/include/cmsis/* $stm/stm32f4.pack/include/cmsis
mkdir -p $stm/stm32f4.pack/src/cmsis
cp -Rnv $src/vendors/stm/stm32f4.pack/src/cmsis/* $stm/stm32f4.pack/src/cmsis

# stm32f4 hal drivers
echo
rm -rf $stm/stm32f4-hal.pack
mkdir -p $stm/stm32f4-hal.pack
cp -Rnv $src/vendors/stm/stm32f4-hal.pack/* $stm/stm32f4-hal.pack

# -----------------------------------------------------------------------------

# Freescale
vendor=freescale
vendor_dest=../ilg.gnuarmeclipse.templates.freescale/templates/micro-os-plus

# klxx cmsis
cmsis=klxx
echo
rm -rf $vendor_dest/$cmsis.pack
mkdir -p $vendor_dest/$cmsis.pack/include/cmsis
cp -Rn $src/vendors/$vendor/$cmsis.pack/include/cmsis/* $vendor_dest/$cmsis.pack/include/cmsis
mkdir -p $vendor_dest/$cmsis.pack/src/cmsis
cp -Rnv $src/vendors/$vendor/$cmsis.pack/src/cmsis/* $vendor_dest/$cmsis.pack/src/cmsis

# kl46 sc drivers
device=kl46-sc
echo
rm -rf $vendor_dest/$device.pack
mkdir -p $vendor_dest/$device.pack
cp -Rnv $src/vendors/$vendor/$device.pack/* $vendor_dest/$device.pack

# kl25 sc drivers
echo
device=kl25-sc
rm -rf $vendor_dest/$device.pack
mkdir -p $vendor_dest/$device.pack
cp -Rnv $src/vendors/$vendor/$device.pack/* $vendor_dest/$device.pack

# --- xPacks

src=../../../xPacks/arm-cmsis-core.git

echo
cp -nv $src/CMSIS/Include/*.h $system/include/cmsis
cp -nv $src/CMSIS/README.txt $system/include/cmsis/README_CMSIS.txt

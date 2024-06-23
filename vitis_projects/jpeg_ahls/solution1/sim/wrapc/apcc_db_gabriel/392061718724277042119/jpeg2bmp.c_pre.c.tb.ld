#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/jpeg_ahls/solution1/sim/wrapc/apcc_db_gabriel/392061718724277042119/jpeg2bmp.c_pre.c.tb.ld.bc ${1+"$@"}

#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/adpcm_ahls/solution1/sim/wrapc/apcc_db_gabriel/378821718834795274787/adpcm.c_pre.c.tb.ld.bc ${1+"$@"}

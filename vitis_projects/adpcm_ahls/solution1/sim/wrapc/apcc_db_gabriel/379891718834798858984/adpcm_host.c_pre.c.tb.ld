#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/adpcm_ahls/solution1/sim/wrapc/apcc_db_gabriel/379891718834798858984/adpcm_host.c_pre.c.tb.ld.bc ${1+"$@"}

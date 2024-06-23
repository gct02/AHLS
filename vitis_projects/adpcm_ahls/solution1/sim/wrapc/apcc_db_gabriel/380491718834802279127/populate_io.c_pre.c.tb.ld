#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/adpcm_ahls/solution1/sim/wrapc/apcc_db_gabriel/380491718834802279127/populate_io.c_pre.c.tb.ld.bc ${1+"$@"}

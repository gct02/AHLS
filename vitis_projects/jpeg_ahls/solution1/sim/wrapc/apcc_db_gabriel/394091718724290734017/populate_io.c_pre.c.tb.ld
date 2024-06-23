#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/jpeg_ahls/solution1/sim/wrapc/apcc_db_gabriel/394091718724290734017/populate_io.c_pre.c.tb.ld.bc ${1+"$@"}

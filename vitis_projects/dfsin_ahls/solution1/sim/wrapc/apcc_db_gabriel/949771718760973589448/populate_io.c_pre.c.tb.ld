#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/dfsin_ahls/solution1/sim/wrapc/apcc_db_gabriel/949771718760973589448/populate_io.c_pre.c.tb.ld.bc ${1+"$@"}

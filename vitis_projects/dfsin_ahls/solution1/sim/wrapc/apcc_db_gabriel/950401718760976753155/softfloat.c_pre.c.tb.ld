#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/dfsin_ahls/solution1/sim/wrapc/apcc_db_gabriel/950401718760976753155/softfloat.c_pre.c.tb.ld.bc ${1+"$@"}

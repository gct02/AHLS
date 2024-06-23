#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/dfsin_ahls/solution1/sim/wrapc/apcc_db_gabriel/948531718760967309341/dfsin.c_pre.c.tb.ld.bc ${1+"$@"}

#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/gabriel/Documents/UFRGS/RAISE/AHLS/vitis_projects/dfsin_ahls/solution1/sim/wrapc/apcc_db_gabriel/949131718760970618333/dfsin_host.c_pre.c.tb.ld.bc ${1+"$@"}
